/****************************************************************************
**
**  This file is a part of Dremote.
**
**  This program is free software; you can redistribute it and/or modify
**  it under the terms of the GNU General Public License as published by
**  the Free Software Foundation; either version 2 of the License, or
**  (at your option) any later version.
**
**  This program is distributed in the hope that it will be useful,
**  but WITHOUT ANY WARRANTY; without even the implied warranty of
**  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
**  GNU General Public License for more details.
**
**  You should have received a copy of the GNU General Public License along
**  with this program.  If not, see <http://www.gnu.org/licenses/>.
**
****************************************************************************/

#include "dreambox.h"
#include <QtCore/QStringList>
#include <QtCore/QCoreApplication>
#include <QDebug>

const QString KEY_ACTIVE_PROFILE("activeProfile");
const QString KEY_PROFILES_CLASS("profiles");
const QString PROFILE_CLASS("profile");
const QString KEY_PROFILE_NAME("profileName");
const QString KEY_PROFILE_HOST("host");
const QString KEY_PROFILE_PORT("port");
const QString KEY_PROFILE_USER("user");
const QString KEY_PROFILE_PASSWORD("password");
const QString KEY_SETTINGS("settings");

Dreambox::Dreambox(QObject *parent)
    : QObject(0)
    , m_settings(new QSettings(this))
    , m_firstRun(false)
{
    // if application name is set, initialize
    if (parent->property("applicationName").isValid()) {
        initialize();
    } else {
        QObject::connect(parent, SIGNAL(applicationNameChanged), this, SLOT(initialize()));
    }
}

Dreambox::~Dreambox()
{
    m_settings->sync();
    delete m_settings;
}

void Dreambox::initialize()
{
    qDebug() << "INIT";
    m_settings = new QSettings(QCoreApplication::applicationName());
    m_settings->setFallbacksEnabled(true);
    if (m_settings->value(KEY_ACTIVE_PROFILE).isValid()) {
        loadSettings();
        setProfile(m_settings->value(KEY_ACTIVE_PROFILE).toString());
    } else {
        m_firstRun = true;
        m_settings->setValue("VERSION", 1);
        // set default settings structure
        m_settings->beginGroup(KEY_SETTINGS);
        m_settings->setValue("simpleRemote", false);
        m_settings->setValue("separateEventsByDay", true);
        m_settings->setValue("connectionTimeoutSeconds", 7);
        m_settings->endGroup();

        Q_EMIT firstRunChanged();
    }
}

QString Dreambox::profile() const
{
    return m_settings->value(KEY_ACTIVE_PROFILE).toString();
}

void Dreambox::setProfile(const QString &profile)
{
    if (m_profileMap.contains(profile) && (m_settings->value(KEY_ACTIVE_PROFILE).toString() != profile)) {
        m_settings->setValue(KEY_ACTIVE_PROFILE, profile);
        m_settings->sync();
        Q_EMIT profileChanged();
    }
}

QUrl Dreambox::profileUrl()
{
    if (profile().isEmpty())
        return QUrl();

    QJsonObject data = profileData();
    QString host = data.value(KEY_PROFILE_HOST).toString();
    if (host.isEmpty())
        return QUrl();
    int port = data.value(KEY_PROFILE_PORT).toVariant().toInt();
    QString user = data.value(KEY_PROFILE_USER).toString();
    QString password = data.value(KEY_PROFILE_PASSWORD).toString();
    QUrl url;
    url.setHost(host);
    url.setScheme("http");
    if (port)
        url.setPort(port);
    if (!user.isEmpty())
        url.setUserName(user);
    if (!password.isEmpty())
        url.setPassword(password);
    return url;
}
QJsonObject Dreambox::profileData()
{
    if (!m_settings->value(KEY_ACTIVE_PROFILE).isValid())
        return QJsonObject();
    return getProfileData(m_settings->value(KEY_ACTIVE_PROFILE).toString());
}

int Dreambox::profileIndex()
{
    if (!m_settings->value(KEY_ACTIVE_PROFILE).isValid())
        return -1;
    QStringList profiles = m_profileMap.keys();
    return profiles.indexOf(m_settings->value(KEY_ACTIVE_PROFILE).toString());
}

QJsonObject Dreambox::settings() const
{
    // load other settings
    m_settings->beginGroup(KEY_SETTINGS);
    QStringList items = m_settings->childKeys();
    QVariantMap properties;
    Q_FOREACH(const QString &key, items) {
        properties.insert(key, m_settings->value(key));
    }
    m_settings->endGroup();
    return QJsonObject::fromVariantMap(properties);
}
void Dreambox::setSettings(const QJsonObject &settings)
{
    m_settings->beginGroup(KEY_SETTINGS);
    QMapIterator<QString, QVariant> i(settings.toVariantMap());
    while (i.hasNext()) {
        i.next();
        m_settings->setValue(i.key(), i.value());
    }
    m_settings->endGroup();

//    Q_EMIT settingsChanged();
}


/*
 * JSON profile object
 * - profileName: string
 * - host
 * - port
 * - user
 * - password
 * - extendedBouquet
 * - separateDays
 */
bool Dreambox::addProfile(const QJsonObject &profile)
{
    QString profileName = profile.value(KEY_PROFILE_NAME).toString();
    if (profileName.isEmpty())
        return false;
    m_settings->beginGroup(KEY_PROFILES_CLASS);
    m_settings->beginGroup(profileName);
    QMapIterator<QString, QVariant> i(profile.toVariantMap());
    while (i.hasNext()) {
        i.next();
        m_settings->setValue(i.key(), i.value());
    }
    m_settings->endGroup();
    m_settings->endGroup();
    m_settings->sync();
    m_profileMap.insert(profileName, profile);
    Q_EMIT profilesChanged();
    return true;
}

bool Dreambox::removeProfile(const QString &name)
{
    if (name.isEmpty() || !m_profileMap.contains(name)) {
        return false;
    }
    m_settings->beginGroup(KEY_PROFILES_CLASS);
    m_settings->remove(name);
    m_settings->endGroup();
    m_profileMap.remove(name);
    if (m_settings->value(KEY_ACTIVE_PROFILE).toString() == name) {
        m_settings->setValue(KEY_ACTIVE_PROFILE, QString());
        Q_EMIT profileChanged();
    }
    m_settings->sync();
    // FIXME: there's a bug in ListItems Empty, itemRemoved signal fired before the animation gets done.
//    Q_EMIT profilesChanged();
    QMetaObject::invokeMethod(this, "profilesChanged", Qt::QueuedConnection);
    return true;
}

QJsonObject Dreambox::getProfileData(const QString &name)
{
    return m_profileMap.value(name);
}

void Dreambox::loadSettings()
{
    m_profileMap.clear();
    m_settings->beginGroup(KEY_PROFILES_CLASS);
    QStringList profiles = m_settings->childGroups();

    Q_FOREACH(const QString &name, profiles) {
        QVariantMap profile;
        m_settings->beginGroup(name);
        QStringList keys = m_settings->childKeys();
        Q_FOREACH(const QString &key, keys) {
            profile.insert(key, m_settings->value(key));
        }
        m_settings->endGroup();
        // add to profiles
        m_profileMap.insert(name, QJsonObject::fromVariantMap(profile));
    }
    m_settings->endGroup();
}

QStringList Dreambox::profiles()
{
    return m_profileMap.keys();
}

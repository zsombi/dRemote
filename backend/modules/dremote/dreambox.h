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

#ifndef MYTYPE_H
#define MYTYPE_H

#include <QtCore/QObject>
#include <QtCore/QUrl>
#include <QtCore/QJsonObject>
#include <QtCore/QSettings>
#include <QtCore/QStringList>

class Profile : public QObject
{
    Q_OBJECT
public:
};

class Dreambox : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool firstRun READ firstRun NOTIFY firstRunChanged)
    Q_PROPERTY(QString profile READ profile WRITE setProfile NOTIFY profileChanged)
    Q_PROPERTY(QUrl profileUrl READ profileUrl NOTIFY profileChanged)
    Q_PROPERTY(QJsonObject profileData READ profileData NOTIFY profileChanged)
    Q_PROPERTY(int profileIndex READ profileIndex NOTIFY profileChanged)
    Q_PROPERTY(QStringList profiles READ profiles NOTIFY profilesChanged)

    Q_PROPERTY(QJsonObject settings READ settings WRITE setSettings NOTIFY settingsChanged)
public:
    explicit Dreambox(QObject *parent = 0);
    ~Dreambox();

    QString profile() const;
    void setProfile(const QString &profile);
    QUrl profileUrl();
    QJsonObject profileData();
    int profileIndex();

    QJsonObject settings() const;
    void setSettings(const QJsonObject &settings);

public Q_SLOTS:
    bool addProfile(const QJsonObject &profile);
    bool removeProfile(const QString &name);
    QJsonObject getProfileData(const QString &name);
private Q_SLOTS:
    void initialize();

Q_SIGNALS:
    void firstRunChanged();
    void profileChanged();
    void profilesChanged();
    void settingsChanged();

protected:
    QSettings *m_settings;
    QString m_activeProfile;
    QMap<QString, QJsonObject> m_profileMap;
    bool m_firstRun;

    bool firstRun() const {
        return m_firstRun;
    }
    void loadSettings();
    QStringList profiles();
};

#endif // MYTYPE_H

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

#include <QtQml>
#include <QtQml/QQmlContext>
#include "backend.h"
#include "dreambox.h"
#include <QDebug>


QObject *registerDreambox(QQmlEngine *engine, QJSEngine*)
{
    QObject *app = engine->rootContext()->contextProperty("UbuntuApplication").value<QObject*>();
    return new Dreambox(app);
}

void BackendPlugin::registerTypes(const char *uri)
{
    Q_ASSERT(uri == QLatin1String("dremote"));

    qmlRegisterSingletonType<Dreambox>(uri, 1, 0, "Dreambox", &registerDreambox);
}

void BackendPlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    QQmlExtensionPlugin::initializeEngine(engine, uri);
}

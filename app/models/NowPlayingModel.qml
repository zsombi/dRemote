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

import QtQuick.XmlListModel 2.0
import dremote 1.0

ModelBase {
    id: model
    property bool busy: status == XmlListModel.Loading
    property bool on: false
    property bool error: false
    property string playingTitle: ""
    property string playingService: ""
    property string nextTitle: ""

    property var now: (count > 0) ? get(0) : undefined
    property var next: (count > 0) ? get(1) : undefined

    source: Dreambox.profileUrl + "/web/getcurrent"
    query: "/e2currentserviceinformation/e2eventlist/e2event"
    XmlRole {name: "serviceId"; query: "e2eventservicereference/string()"}
    XmlRole {name: "serviceName"; query: "e2eventservicename/string()"}
    XmlRole {name: "eventName"; query: "e2eventname/string()"}
    XmlRole {name: "description"; query: "e2eventdescription/string()"}
    XmlRole {name: "descriptionExtended"; query: "e2eventdescriptionextended/string()"}
    XmlRole {name: "startTime"; query: "e2eventstart/string()"}
    XmlRole {name: "duration"; query: "e2eventduration/string()"}
    XmlRole {name: "remaining"; query: "e2eventremaining/string()"}
    XmlRole {name: "currTime"; query: "e2eventcurrenttime/string()"}
    onStatusChanged: {
        if (source == "") {
            on = false;
            error = false;
        } else if (status == XmlListModel.Error) {
            error = true;
            on = false;
            playingTitle = newtTitle = "";
            playingService = errorString();
        } else if ((status == XmlListModel.Ready)  && (count > 0)){
            error = false;
            if (get(0).serviceId === "") {
                on = false;
                playingService = playingTitle = nextTitle = i18n.tr("Nothing playing");
            } else {
                on = true;
                playingTitle = get(0).eventName.trim();
                playingService = get(0).serviceName.trim();
                nextTitle = get(1).eventName.trim();
                if (playingTitle === "") {
                    playingTitle = playingService;
                }
            }
        }
    }
}

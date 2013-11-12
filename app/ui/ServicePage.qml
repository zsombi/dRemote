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

import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Layouts 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import dremote 1.0
import "../components"
import "../models"
import "../models/dateUtils.js" as Date
import "../models/serviceUtils.js" as Service

Page {
    property string service

    tools: ToolbarItems {
        ToolbarButton {
            action: Action {
                text: i18n.tr("Zap")
                iconSource: Qt.resolvedUrl("../graphics/Flat_Icons_1.png")
                onTriggered: request.zap(serviceList.model.get(0).serviceId)
            }
        }
    }
    SimpleRequestModel {
        id: request
    }

    ListView {
        id: serviceList
        anchors.fill: parent
        model: ServiceEpgModel {
            source: Service.epgService(service)
        }
        delegate: ListItem.Standard {
            id: serviceLine
            height: column.childrenRect.height + units.gu(1.5)
            Column {
                id: column
                anchors {
                    left: parent.left
                    top: parent.top
                    right: parent.right
                    margins: units.gu(0.5)
                    rightMargin: units.gu(5)
                }
                Label {
                    anchors{
                        left: parent.left
                        right: parent.right
                    }
                    font.bold: true
                    text: title
                    wrapMode: Text.WordWrap
                }
                Label {
                    anchors{
                        left: parent.left
                        leftMargin: units.gu(1)
                        right: parent.right
                    }
                    text: (new Date()).formatDate(startTime, duration)
                    wrapMode: Text.WordWrap
                }
            }
            progression: true

            onClicked: {
                stack.push(Qt.resolvedUrl("ProgramPage.qml"), {"serviceObject": model, "title": title})
            }
        }
    }
}

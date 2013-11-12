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
import Ubuntu.Components.Popups 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import dremote 1.0
import "../components"
import "../models"
import "../models/dateUtils.js" as Date
import "../models/serviceUtils.js" as Service

ScrollablePage {
    property alias serviceUlr: service.source
    property var serviceObject
    property date startTime: serviceObject ? new Date(parseInt(serviceObject.startTime) * 1000) : new Date()
    property date endTime: serviceObject ? new Date(parseInt(serviceObject.startTime) * 1000 + parseInt(serviceObject.duration) * 1000) : new Date()

    tools: ToolbarItems {
        opened: true
        locked: true
        ToolbarButton {
            action: Action {
                text: i18n.tr("Zap")
                iconSource: Qt.resolvedUrl("../graphics/Flat_Icons_1.png")
                onTriggered: request.zap(serviceObject.serviceId)
            }
        }
        ToolbarButton {
            action: Action {
                text: i18n.tr("IMDB")
                iconSource: Qt.resolvedUrl("../graphics/movie.png")
            }
        }
        ToolbarButton {
            id: btn
            action: Action {
                text: i18n.tr("Add timer")
                iconSource: Qt.resolvedUrl("../graphics/Flat_Icons_16.png")
                onTriggered: {
                    print(PopupUtils.open(zapPopover, btn))
                }
            }
        }
    }

    ServiceEpgModel {
        id: similarsModel
        source: Service.similarEvent(serviceObject.serviceId, serviceObject.eventId)
    }
    SimpleRequestModel {
        id: request
    }
    ServiceEpgModel {
        id: service
    }

    Component {
        id: zapPopover
        Popover {
            contentWidth: units.gu(12)
            Column {
                anchors {
                    left: parent.left
                    top: parent.top
                    right: parent.right
                }

                ListItem.Standard {
                    text: i18n.tr("Record")
                }
                ListItem.Standard {
                    text: i18n.tr("Just play")
                }
            }
        }
    }

    ListItem.Standard {
        text: i18n.tr("Event")
        showDivider: false
    }

    BubbleShape {
        anchors {
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }
        height: contentHeight

        ListItem.Standard {
            text: serviceObject.serviceName
        }
        ListItem.Subtitled {
            text: i18n.tr("Starting at")
            subText: Qt.formatDateTime(startTime, "dddd, h:mm AP")
        }
        ListItem.Subtitled {
            id: endLabel
            text: i18n.tr("Ending at")
            subText: Qt.formatDateTime(endTime, "dddd, h:mm AP")
        }
        Label {
            anchors {
                left: parent.left
                right: parent.right
                leftMargin: units.gu(2)
                rightMargin: units.gu(2)
            }
            wrapMode: Text.WordWrap
            text: serviceObject.info
        }
    }

    ListItem.Standard {
        text: i18n.tr("Similar Events")
        showDivider: false
    }

    BubbleShape {
        anchors {
            left: parent.left
            right: parent.right
            margins: units.gu(1)
        }
        height: contentHeight
        Repeater {
            model: similarsModel
            ListItem.Subtitled {
                text: (new Date()).formatDate(startTime, duration)
                subText: i18n.tr("on ") + serviceName
                progression: true
                onClicked: {
                    stack.push(Qt.resolvedUrl("ProgramPage.qml"), {"serviceObject": model, "title": i18n.tr("Similar: ") + title})
                }
            }
        }
    }
}

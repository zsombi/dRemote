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
import Ubuntu.Components.ListItems 0.1 as ListItem
import Ubuntu.Components.Popups 0.1
import dremote 1.0
import "../components"
import "../models"

Page {
    title: i18n.tr("Settings")
    property bool editMode: false
    tools: ToolbarItems {
        opened: true
        locked: true
        ToolbarButton {
            action: Action {
                text: i18n.tr("New")
                iconSource: Qt.resolvedUrl("../graphics/satellite.png")
                onTriggered: stack.push(Qt.resolvedUrl("ProfilePage.qml"))
            }
        }
        ToolbarButton {
            action: Action {
                text: i18n.tr("Edit")
                iconSource: Qt.resolvedUrl("../graphics/edit.png")
                onTriggered: editMode = !editMode
            }
        }
    }

    property bool completed: false
    Component.onCompleted: completed = true;

    AboutModel {
        id: about
    }

    Flickable {
        anchors {
            fill: parent
            margins: units.gu(1)
        }
        contentHeight: body.childrenRect.height
        Column {
            id: body
            width: parent.width

            ListItem.Standard {
                text: i18n.tr("Available Profiles")
                showDivider: false
            }
            BubbleShape {
                width: parent.width
                height: contentItem.childrenRect.height
                Repeater {
                    model: Dreambox.profiles
                    ListItem.Standard {
                        text: modelData
                        progression: editMode
                        icon: editMode ? Qt.resolvedUrl("../graphics/edit.png") : ""
                        confirmRemoval: true
                        removable: editMode
                        control: Item {
                            width: units.gu(4)
                            height: width
                            visible: Dreambox.profile === modelData
                            ActivityIndicator {
                                id: checking
                                anchors.fill: parent
                                running: about.busy
                            }
                            Icon {
                                anchors.fill: parent
                                name: about.error ? "user-offline" : "user-available"
                                visible: !checking.running
                            }
                        }

                        onClicked: {
                            if (editMode) {
                                var profile = modelData;
                                var data = Dreambox.getProfileData(profile);
                                stack.push(Qt.resolvedUrl("ProfilePage.qml"), {"title": i18n.tr("Edit profile: ") + profile, "profile": data});
                            } else {
                                Dreambox.profile = modelData;

                            }
                        }
                        onItemRemoved: {
                            Dreambox.removeProfile(modelData);
                        }
                    }
                }
            }
            ListItem.Standard {
                text: i18n.tr("Simple Remote")
                control: Switch{
                    checked: Dreambox.settings.simpleRemote
                    onCheckedChanged: {
                        if (!completed) return;
                        var settings = Dreambox.settings;
                        settings.simpleRemote = checked;
                        Dreambox.settings = settings;
                    }
                }
            }
            ListItem.Standard {
                text: i18n.tr("Separate events by day")
                control: Switch{
                    checked: Dreambox.settings.separateEventsByDay
                    onCheckedChanged: {
                        if (!completed) return;
                        var settings = Dreambox.settings;
                        settings.separateEventsByDay = checked;
                        Dreambox.settings = settings;
                    }
                }
            }
            ListItem.ItemSelector {
                text: i18n.tr("Connection Timeout")
                showDivider: false
                model: ["7 sec", "15 sec", "30 sec", "45 sec"]
            }
        }
    }
}

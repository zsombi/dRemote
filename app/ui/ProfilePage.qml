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
import Ubuntu.Components.Popups 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import dremote 1.0
import "../components"

Page {
    title: i18n.tr("New profile")
    property var profile

    tools: ToolbarItems {
        opened: true
        locked: true
        ToolbarButton {
            action: Action {
                text: i18n.tr("Save")
                iconSource: Qt.resolvedUrl("../graphics/tick.png")
                onTriggered: {
                    saveProfile();
                    stack.pop();
                }
            }
        }
    }

    Column {
        anchors.fill: parent
        ListItem.Standard {
            text: i18n.tr("Name")
            control: TextField {
                id: profileName
            }
        }
        ListItem.Standard {
            text: i18n.tr("Address")
            control: TextField {
                id: host
                inputMethodHints: Qt.ImhUrlCharactersOnly
            }
        }
        ListItem.Standard {
            text: i18n.tr("Port")
            control: TextField {
                id: port
                inputMethodHints: Qt.ImhDigitsOnly
            }
        }
        ListItem.Standard {
            text: i18n.tr("User")
            control: TextField {
                id: user
                placeholderText: "root"
            }
        }
        ListItem.Standard {
            text: i18n.tr("Password")
            control: TextField {
                id: password
                placeholderText: "dreambox"
                echoMode: TextInput.PasswordEchoOnEdit
            }
        }

    }

    Component.onCompleted: {
        if (profile) {
            profileName.text = profile.profileName;
            host.text = profile.host;
            port.text = profile.port;
            user.text = profile.user;
            password.text = profile.password;
        }
    }

    function saveProfile() {
        var profile = {
            "profileName": profileName.text,
            "host": host.text,
            "port": parseInt(port.text),
            "user": user.text,
            "password": password.text
        };
        if (Dreambox.addProfile(profile) && Dreambox.profile === "") {
            Dreambox.profile = profileName.text;
        }
    }
}

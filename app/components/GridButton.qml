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

AbstractButton {
    id: button
    property alias text: label.text
    property alias image: image.source
    property alias icon: icon.name
    property alias iconColor: icon.color

    width: parent && parent.hasOwnProperty("columns") ? parent.width / parent.columns : units.gu(10)
    height: width

    Rectangle {
        anchors.fill: parent
        border.width: units.gu(0.1)
        border.color: Theme.palette.normal.base
        color: button.pressed ? "#b3b3b3" : "transparent"
        Image {
            id: image
            anchors {
                centerIn: parent
                verticalCenterOffset: (label.text !== "") ? -(label.paintedHeight + units.gu(1))/2 : 0
            }
        }
        Icon {
            id: icon
            width: units.gu(4)
            height: units.gu(4)
            anchors {
                centerIn: parent
                verticalCenterOffset: (label.text !== "") ? -(label.paintedHeight + units.gu(1))/2 : 0
            }
        }

        Label {
            id: label
            text: model.text
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
            anchors{
                centerIn: parent
                verticalCenterOffset: ((icon.name != "") || (image.name != "")) ? (label.paintedHeight + units.gu(1))/2 : 0
            }
        }
    }
}

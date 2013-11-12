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

UbuntuShape {

    default property alias content: contentItem.data
    property alias contentItem: contentItem
    readonly property real contentHeight: contentItem.childrenRect.height

    radius: "medium"
    image: source

    ShaderEffectSource {
        id: source
        sourceItem: contentItem
        hideSource: true
        opacity: 0.01
        width: 1; height: 1
    }

    Column {
        id: contentItem
        anchors {
            left: parent.left
            top: parent.top
            right: parent.right
        }
        height: childrenRect.height
    }
}

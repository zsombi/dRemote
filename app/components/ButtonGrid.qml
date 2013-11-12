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
    property alias columns: grid.columns
    property alias rows: grid.rows
    default property alias buttons: grid.data
    property real buttonWidth: units.gu(10)
    property real buttonHeight: units.gu(10)

    radius: "medium"
    image: source
    width: childrenRect.width
    height: childrenRect.height
    onButtonsChanged: grid.updateButtons()
    Component.onCompleted: grid.updateButtons()

    ShaderEffectSource {
        id: source
        sourceItem: grid
        hideSource: true
        opacity: 0.01
        width: 1; height: 1
    }

    Grid {
        id: grid
        columns: 3
        clip: true
        anchors {
            left: parent.left
            top: parent.top
        }
        height: childrenRect.height
        width: childrenRect.width

        function updateButtons() {
            // reset width and height
            print("shit+"+children.length)
            for (var i = 0; i < children.length; i++) {
                children[i].width = buttonWidth;
                children[i].height = buttonHeight;
            }
        }
    }
}

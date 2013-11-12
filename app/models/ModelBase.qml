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
import QtQuick.XmlListModel 2.0
import dremote 1.0

XmlListModel {
    property bool ready: status === XmlListModel.Ready
    property bool error: status === XmlListModel.Error
    property bool busy: status === XmlListModel.Loading
    property var syncModels

    signal completed()

    function __sync() {
        if (__syncing) return;
        __syncing = true;
        for (var i in syncModels) {
            syncModels[i].reload();
        }
    }
    property bool __syncing: false

    onStatusChanged: {
        if (status === XmlListModel.Ready) {
            completed();
            __sync();
            __syncing = false;
        }
    }
}

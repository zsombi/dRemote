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
    property bool busy: status == XmlListModel.Loading
    property bool on: (count > 0) ? (get(0).inStandby === "true") : false
    onOnChanged: print(on)
    query: "/e2powerstate"
    XmlRole { name: "inStandby"; query: "e2instandby/string()" }
    onStatusChanged: {
        if (status == XmlListModel.Ready && (count > 0)) {
            console.debug("inStandby::" + get(0).inStandby)
            on = (get(0).inStandby === "true");
        }
    }
    Component.onCompleted: getStatus()

    function getStatus()
    {
        source = Dreambox.profileUrl + "/web/powerstate"
        console.debug("Power:: " + source)
    }
    function standby()
    {
        source = Dreambox.profileUrl + "/web/powerstate?newstate=0"
    }
    function shutdown()
    {
        source = Dreambox.profileUrl + "/web/powerstate?newstate=1"
    }
    function reboot()
    {
        source = Dreambox.profileUrl + "/web/powerstate?newstate=2"
    }
    function restartE2()
    {
        source = Dreambox.profileUrl + "/web/powerstate?newstate=3"
    }
}

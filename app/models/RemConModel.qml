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
    query: "/e2remotecontrol"
    XmlRole { name: "result"; query: "e2result/string()" }
    XmlRole { name: "message"; query: "e2resulttext/string()" }

    function command(code)
    {
        var src = Dreambox.profileUrl + "/web/remotecontrol?command=" + code;
        if (source != src) {
            source = src;
        } else {
            reload();
        }
    }
    function power()
    {
        command("116")
    }
    onStatusChanged: {
        if ((status == XmlListModel.Ready) && (count > 0)){
            console.debug("RemCon command \"" + source + "\", result: " + get(0).result + ":: " + get(0).message)
        }
    }
}

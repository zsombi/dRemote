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
    query: "/e2simplexmlresult"
    XmlRole { name: "result"; query: "e2state/string()" }
    XmlRole { name: "message"; query: "e2statetext/string()" }

    function zap(sId)
    {
        source = Dreambox.profileUrl + "/web/zap?sRef=" + sId
    }
    function cleanFinishedTimers()
    {
        var src = Dreambox.profileUrl + "/web/timercleanup?cleanup=3"
        if (src != source)
            source = src
        else
            reload()
    }
    onStatusChanged: {
        if (status == XmlListModel.Ready) {
            console.debug("XML: " + xml)
            completed()
        }
    }
}

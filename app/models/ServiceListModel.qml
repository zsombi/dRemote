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

XmlListModel {
    query: "/e2servicelist/e2service"
    XmlRole {name: "serviceId"; query: "e2servicereference/string()"}
    XmlRole {name: "serviceName"; query: "e2servicename/string()"}

    readonly property url bouquetList: Dreambox.profileUrl + "/web/getservices"

    function currentService()
    {
        return Dreambox.profileUrl + "/web/subservices";
    }
//    function bouquetList()
//    {
//        return "";
//    }
    function bouquetContent(bouquet)
    {
        return Dreambox.profileUrl + "/web/getservices?sRef=" + bouquet;
    }
}

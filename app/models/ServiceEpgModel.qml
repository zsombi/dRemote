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
import "serviceUtils.js" as Services

ModelBase {
    query:  "/e2eventlist/e2event"
    XmlRole {name: "eventId"; query: "e2eventid/string()"}
    XmlRole {name: "startTime"; query: "e2eventstart/string()"}
    XmlRole {name: "duration"; query: "e2eventduration/string()"}
    XmlRole {name: "now"; query: "e2eventcurrenttime/string()"}
    XmlRole {name: "title"; query: "e2eventtitle/string()"}
    XmlRole {name: "info"; query: "e2eventdescription/string()"}
    XmlRole {name: "serviceId"; query: "e2eventservicereference/string()"}
    XmlRole {name: "serviceName"; query: "e2eventservicename/string()"}

//    function epgNow(sId)
//    {
//        return Services.epgNow(sId);
//    }
//    function epgNext(sId)
//    {
//        source = Dreambox.profileUrl + "/web/epgservicenext?sRef=" + sId
//    }
//    function epgService(sId)
//    {
//        //console.debug("epgService URL: " + Dreambox.profileUrl + "/web/epgservice?sRef=" + sId)
//        return Dreambox.profileUrl + "/web/epgservice?sRef=" + sId
//    }
    function eventsFrom(sId, start, length)
    {
        var src = Dreambox.profileUrl + "/web/epgservice?sRef=" + sId + "&time=" + start// + "&endTime=" + (start + length)
        if (src != source)
            source = src
        else
            reload()
    }

//    function epgBouquet(bId)
//    {
//        return Dreambox.profileUrl + "/web/epgbouquet?bRef=" + bId
//    }

//    function similarEvent(sId, eventId)
//    {
//        source = Dreambox.profileUrl + "/web/epgsimilar?sRef=" + sId + "&eventid=" + eventId
//    }

//    function epgSearch(item)
//    {
//        source = Dreambox.profileUrl + "/web/epgsearch?search=" + item
//    }
}

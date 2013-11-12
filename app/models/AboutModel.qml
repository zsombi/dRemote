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

//import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import dremote 1.0

ModelBase {
    source: Dreambox.profileUrl + "/web/about"
    query: "/e2abouts/e2about"
    XmlRole { name: "e2Version"; query: "e2enigmaversion/string()"}
    XmlRole { name: "e2ImageVersion"; query: "e2imageversion/string()" }
    XmlRole { name: "e2WebIfVersion"; query: "e2webifversion/string()" }
    XmlRole { name: "e2Model"; query: "e2model/string()" }

    XmlRole { name: "serviceName"; query: "e2servicename/string()" }
    XmlRole { name: "serviceProvider"; query: "e2serviceprovider/string()" }
    XmlRole { name: "videoSize"; query: "e2servicevideosize/string()" }
}

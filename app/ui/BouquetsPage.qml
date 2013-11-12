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
import Ubuntu.Layouts 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem
import dremote 1.0
import "../components"
import "../models"

Page {
    title: i18n.tr("Bouquet List")

    ListView {
        anchors.fill: parent
        model: ServiceListModel{
            source: bouquetList
        }
        delegate: ListItem.Standard {
            text: serviceName
            progression: true
            onClicked: {
                stack.push(Qt.resolvedUrl("BouquetPage.qml"), {"service": serviceId, "title": serviceName})
            }
        }
    }
}

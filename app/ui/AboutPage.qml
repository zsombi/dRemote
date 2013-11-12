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
import Ubuntu.Components.ListItems 0.1 as ListItem
//import dremote 1.0
import "../components"
import "../models"


ScrollablePage {
    title: i18n.tr("About Dreambox")

    ListItem.Standard {
        text: i18n.tr("Receiver")
        showDivider: false
    }
    BubbleShape {
        width: parent.width
        height: contentHeight
        AboutModel {
            id: model
        }
        ListItem.Subtitled {
            text: i18n.tr("Model: ") + (model.isReady ? model.get(0).e2Model : "")
            subText: i18n.tr("GUI Version: ") + (model.isReady ? model.get(0).e2Version : "")
        }
        ListItem.Standard {
            text: i18n.tr("Image Version: ") + (model.isReady ? model.get(0).e2ImageVersion : "")
        }
        ListItem.Standard {
            text: i18n.tr("WebIF Version: ") + (model.isReady ? model.get(0).e2WebIfVersion : "")
        }
    }

    ListItem.Standard {
        text: i18n.tr("Tuner")
        showDivider: false
    }
    BubbleShape {
        width: parent.width
        height: contentHeight
        Repeater {
            model: TunerInfoModel {}
            ListItem.Subtitled {
                text: i18n.tr("Tuner: ") + tunerModel
                subText: tunerType
            }
        }
    }

    ListItem.Standard {
        text: i18n.tr("HDD Info")
        showDivider: false
    }
    BubbleShape {
        width: parent.width
        height: contentHeight
        Repeater {
            model: HddInfoModel {
            }
            ListItem.Subtitled {
                text: i18n.tr("HDD: ") + hddModel
                subText: hddFree + " " + i18n.tr("of") + " " + hddCapacity
            }
        }
    }
}

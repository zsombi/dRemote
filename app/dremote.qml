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
import "ui"
import "components"
import "models"

/*!
    \brief MainView with Tabs element.
           First Tab has a single Label and
           second Tab has a single ToolbarAction.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"
    
    // Note! applicationName needs to match the .desktop filename
    applicationName: "dremote"
    
    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    automaticOrientation: true
    
    backgroundColor: "#4884a2"
    width: units.gu(40)
    height: units.gu(71)

    property var settings: QtObject {
        property bool stacked: false
    }

    PageStack {
        id: stack
        Component.onCompleted: {
            stack.push(mainPage);
            if (Dreambox.firstRun) {
                stack.push(Qt.resolvedUrl("ui/SettingsPage.qml"));
                stack.push(Qt.resolvedUrl("ui/NewProfileDialog.qml"));
            }
        }
        ScrollablePage {
            id: mainPage
            title: i18n.tr("dRemote")
            onActiveChanged: if (active) nowPlaying.reload()

            tools: ToolbarItems {
                ToolbarButton {
                    action: Action {
                        text: i18n.tr("Settings")
                        iconSource: Qt.resolvedUrl("graphics/Flat_Icons_17.png");
                        onTriggered: stack.push(Qt.resolvedUrl("ui/SettingsPage.qml"));
                    }
                }
            }

            NowPlayingModel {
                id: nowPlaying
            }
            RemConModel {
                id: remcon
                syncModels: [nowPlaying]
            }

            BubbleShape {
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: units.gu(1)
                }

                height: contentHeight
                ListItem.Standard {
                    text: i18n.tr("Running on ") + nowPlaying.playingService
                    showDivider: false
                    control: Image {
                        source: nowPlaying.on ? Qt.resolvedUrl("graphics/on.png") : Qt.resolvedUrl("graphics/off.png")
                        width: units.gu(4)
                        height: width
                    }
                    onClicked: {
                        remcon.power();
                    }
                }
                ListItem.Standard {
                    text: nowPlaying.playingTitle
                    showDivider: false
                    progression: true
                    onClicked: {
                        stack.push(Qt.resolvedUrl("ui/ProgramPage.qml"), {"title": nowPlaying.playingTitle, "eventObject": nowPlaying.now})
                    }
                }
                ListItem.Standard {
                    text: i18n.tr("Next: ") + nowPlaying.nextTitle
                    showDivider: false
                    progression: true
                }
                Grid {
                    id: grid
                    anchors {
                        left: parent.left
                        right: parent.right
                    }
                    columns: 3
                    GridButton {
                        width: grid.width / 3
                        text: i18n.tr("Bouquets")
    //                    image: Qt.resolvedUrl("graphics/bouquet.png")
                        icon: "x-office-address-book"
                        onClicked: stack.push(Qt.resolvedUrl("ui/BouquetsPage.qml"))
                    }
                    GridButton {
                        text: i18n.tr("Remote")
    //                    image: Qt.resolvedUrl("graphics/remote.png")
                        icon: "network-transmit"
                    }
                    GridButton {
                        text: i18n.tr("Timers")
    //                    image: Qt.resolvedUrl("graphics/timer.png")
                        icon: "emblem-important"
                    }
                    GridButton {
                        text: i18n.tr("Search EPG")
                        icon: "search"
    //                    iconColor: "white"
                    }
                    GridButton {
                        text: i18n.tr("About Receiver")
    //                    image: Qt.resolvedUrl("graphics/satellite.png")
                        icon: "help-about"
                        onClicked: stack.push(Qt.resolvedUrl("ui/AboutPage.qml"))
                    }
                    GridButton {
                        text: i18n.tr("Recording Locations")
    //                    image: Qt.resolvedUrl("graphics/movie.png")
                        icon: "drive-harddisk"
                    }
                    GridButton {
                        text: i18n.tr("Sleep Timer")
                        image: Qt.resolvedUrl("graphics/clock.png")
    //                    icon: "process-stop"
                    }
                }
            }

        }
    }

//    Tabs {
//        id: tabs
//        DynamicTab {
//            title: i18n.tr("Bouquets")
//        }

//        DynamicTab {
//            title: i18n.tr("Remote")
//        }
//        DynamicTab {
//            title: i18n.tr("Timers")
//        }
//        DynamicTab {
//            title: i18n.tr("Utilities")
//        }
//        DynamicTab {
//            title: i18n.tr("Settings")
//            source: Qt.resolvedUrl("ui/SettingsPage.qml")
////            sourceComponent: Component {SettingsPage{}}
//        }
//    }
}

import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0

import "../controls"
import "../components"

CustomPage {
    id: root

    property int cols

    Column{
        anchors.fill: parent

        ShadowedRectangle {
            id: header
            width: parent.width
            height: 50
            contentRadius: 0
            z: 1

            contentItem: Rectangle{
                id: headerContainer
                anchors.fill: parent

                Row{
                    anchors.fill: parent
                    spacing: 15
                    leftPadding: 15

                    Image{
                        width: 30
                        height: 30
                        visible: navigationDrawer.interactive
                        anchors.verticalCenter: parent.verticalCenter
                        source: "qrc:/assets/images/icons/hamburger_menu_grey.png"

                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: navigationDrawer.open()
                        }
                    }

                    Text {
                        text: "Home"
                        font.family: AppUtil.font1.name
                        font.bold: true
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                        height: parent.height
                    }
                }

                //end of container
            }

            //end of header
        }       

        Row{
            width: parent.width
            height: parent.height - header.height

            HomeSidePanel{
                id: sidePanel
                panelWidth: 300
                height: parent.height
                z: 5
            }

            HomeScrollView{
                width: parent.width - sidePanel.width
                height: parent.height
            }
        }

        //end of Column
    }

    //end of root
}

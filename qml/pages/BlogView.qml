import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0

import "../controls"
import "../components"
import "../models"

CustomPage {
    id: root

    Column{
        anchors.fill: parent

        ShadowedRectangle {
            id: header
            width: parent.width
            height: 50
            z: 1

            Row{
                width: childrenRect.width
                height: parent.height
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
                    text: "Blog"
                    font.family: AppUtil.font1.name
                    font.bold: true
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                    height: parent.height
                }
            }

            //end of header
        }

        BlogList{
            width: parent.width
            height: parent.height - header.height
        }

        //end of Column
    }

    BlogModel {
        id: blogModel
    }

    //end of root
}

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

        ScrollView{
            width: parent.width
            height: parent.height - header.height
            contentWidth: -1
            clip: true           

            onWidthChanged: flow.width = width

            Flow{
                id: flow
                spacing: cols < 2 ? 10 : 40
                bottomPadding: cols < 2 ? 20 : 40
                topPadding: cols < 2 ? 20 : 40

                onWidthChanged: {

                    cols = Math.floor(width/360);

                    if(cols < 2){
                        leftPadding = (width-320)/2;
                        return;
                    }

                    leftPadding = (width - ((320*cols) + ((cols-1)*spacing)))/2;
                }

                //end of flow
            }

            //end of ScrollView
        }

        //end of Column
    }

    //end of root
}

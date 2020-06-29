import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0
import Felgo 3.0

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
                    text: "About"
                    font.family: AppUtil.font1.name
                    font.bold: true
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                    height: parent.height
                }
            }

            //end of header
        }

        ScrollView{
            width: parent.width
            height: parent.height - header.height
            contentWidth: -1

            Column{
                width: parent.width
                height: childrenRect.height
                topPadding: 30
                spacing: 15

                Column{
                    width: parent.width
                    height: childrenRect.height
                    spacing: 15

                    Image {
                        source: "qrc:/assets/images/logos/bike-hub-medium-icon.png"
                        width: 200
                        height: (sourceSize.height/sourceSize.width) * width
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        text: "your trusted repair partner"
                        width: parent.width
                        height: 20
                        font.pixelSize: 16
                        font.family: AppUtil.font1.name
                        font.bold: true
                        font.weight: Font.ExtraBold
                        color: "#39C4EB"
                        horizontalAlignment: Text.AlignHCenter
                    }

                }

                Text {
                    text: "BikeHub is your trusted parnter when it comes to bike repairs." +
                          " We have more than enough repair shops on our system all at your disposal."
                    width: 300
                    height: contentHeight + 10
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 14
                    font.family: AppUtil.font1.name
                    color: "#323232"
                    wrapMode: Text.Wrap
                    verticalAlignment: Text.AlignVCenter
                    lineHeight: 1.2
                }

                MaterialButton{
                    width: 150
                    height: 40
                    text: "Report Problem"
                    font.family: AppUtil.font1.name
                    font.pixelSize: 16
                    colorUp: "white"
                    backgroundColor: "#39C4EB"
                    anchors.horizontalCenter: parent.horizontalCenter

                    onClicked: {
                        reportBug.open();
                    }
                }

                Row{
                    width: childrenRect.width
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 30
                    height: 25

                    Icon{
                        size: parent.height
                        icon: IconType.facebookf
                        color: "#39C4EB"
                    }

                    Icon{
                        size: parent.height
                        icon: IconType.twitter
                        color: "#39C4EB"
                    }
                }

                Text {
                    text: "version 1.0"
                    width: parent.width
                    height: 20
                    font.pixelSize: 14
                    font.family: AppUtil.font1.name
                    font.bold: true
                    font.weight: Font.ExtraBold
                    color: "#39C4EB"
                    horizontalAlignment: Text.AlignHCenter
                }

                //end of Column
            }

            //end of ScrollView
        }

        //end of Column
    }

    //end of root
}

import QtQuick 2.0
import AppUtil 1.0
import SVG 1.0
import Felgo 3.0

import "../controls"

FelgoPage {
    id: root
    isStatusBarVisible: false

    Timer{
        running: true
        interval: 2000
        onTriggered: {
            mainNavigationStack.clearAndPush(Qt.resolvedUrl("NavigationPage.qml"));
        }
    }

    Image {
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
        source: "qrc:/assets/images/wallpapers/bike.jpg"
    }

    Rectangle{
        anchors.fill: parent
        opacity: 0.75
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#486A99" }
            GradientStop { position: 1.0; color: "#0F2358" }
        }
    }

    Column{
        width: parent.width
        height: childrenRect.height
        anchors.centerIn: parent
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
            font.pixelSize: 18
            font.family: AppUtil.font1.name
            font.bold: true
            font.weight: Font.ExtraBold
            color: "#39C4EB"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            text: "version 1.0"
            width: parent.width
            height: 20
            font.pixelSize: 18
            font.family: AppUtil.font1.name
            font.bold: true
            font.weight: Font.ExtraBold
            color: "white"
            horizontalAlignment: Text.AlignHCenter
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

    }

    //end of root
}

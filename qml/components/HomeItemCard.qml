import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0
import SVG 1.0

import "../controls"

ShadowedRectangle {
    id: root
    width: 120
    height: 120
    shadowColor: Qt.rgba(100/255,100/255,100/255,0.3)
    contentRadius: container.radius

    property alias backgroundColor: container.color

    property alias icon: image.source
    property alias text: text.text

    signal itemClicked()

    contentItem: Rectangle{
        id: container
        anchors.fill: parent
        radius: 8

        Column{
            anchors.fill: parent
            topPadding: 10
            spacing: 15

            Image {
                id: image
                width: 60
                height: 60
                anchors.horizontalCenter: parent.horizontalCenter                
            }

            Text {
                id: text                
                width: parent.width
                height: 30
                horizontalAlignment: Text.AlignHCenter
                font.family: AppUtil.font1.name
                font.bold: true
                font.pixelSize: 14
                wrapMode: Text.Wrap
                color: "#646464"
            }
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: itemClicked()
        }

        //end of container
    }

    //end of root
}

import QtQuick 2.12
import AppUtil 1.0

ShadowedRectangle{
    width: parent.width - 10
    height: 400
    contentRadius: 8
    dropShadow.verticalOffset: 2
    dropShadow.horizontalOffset: 2
    dropShadow.color: Qt.rgba(150/255,150/255,150/255,0.3)

    property alias icon: image
    property alias label: label
    property alias text: text

    property real iconSize: 25

    contentItem: Rectangle{
        anchors.fill: parent
        radius: 8

        Row{
            anchors.fill: parent
            leftPadding: 15

            Image {
                id: image
                width: iconSize
                height: iconSize
                sourceSize.width: width
                sourceSize.height: height
                anchors.verticalCenter: parent.verticalCenter
            }

            Column{
                height: parent.height
                width: parent.width - 25
                leftPadding: 20

                Text {
                    id: label
                    verticalAlignment: Text.AlignVCenter
                    font.family: AppUtil.font1.name
                    font.pixelSize: 14
                    color: "#323232"
                    width: parent.width
                    height: parent.height/2
                    elide: Text.ElideRight
                }

                Text {
                    id: text
                    verticalAlignment: Text.AlignVCenter
                    font.family: AppUtil.font1.name
                    font.pixelSize: 14
                    font.bold: true
                    width: parent.width
                    height: parent.height/2
                    elide: Text.ElideRight
                    rightPadding: 10
                }
            }
        }

    }
    //end of root
}

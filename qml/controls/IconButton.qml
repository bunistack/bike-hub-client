import QtQuick 2.7
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import AppUtil 1.0

Button{
    id: control
    width: 130
    height: 50
    icon.color: "#323232"

    property color backgroundColor: "#f0f0f0"

    property color animatedBackgroundColor: Qt.rgba(1,1,1,0.5)

    property color shadowColorDown: Qt.rgba(100/255,100/255,100/255,0.8)
    property color shadowColorUp: Qt.rgba(100/255,100/255,100/255,0.5)
    property alias shadowEnabled: shadowedRectangle.shadowEnabled

    property real buttonRadius: 4

    background: ShadowedRectangle{
        anchors.fill: parent
        id: shadowedRectangle
        contentItemMargins: 4
        contentRadius: buttonRadius
        shadowColor: control.down ? shadowColorDown : shadowColorUp

        contentItem: Rectangle{
            anchors.fill: parent
            color: backgroundColor
            radius: buttonRadius
            clip: true

            Rectangle{
                id: animatedBackground
                anchors.centerIn: parent
                color: animatedBackgroundColor
                scale: 0
                width: parent.width > parent.height ? parent.width : parent.height
                height: parent.width > parent.height ? parent.width : parent.height
                radius: width/2

                ParallelAnimation{
                    id: btnBackgroundAnim

                    NumberAnimation{
                        target: animatedBackground
                        property: "scale"
                        from: 0
                        duration: 300
                        to: 1
                    }

                    NumberAnimation{
                        target: animatedBackground
                        property: "opacity"
                        from: 1
                        duration: 300
                        to: 0
                    }

                    onStopped: {
                        animatedBackground.opacity = 1;
                        animatedBackground.scale = 0;
                    }
                }

                //end of animated rectangle
            }

            //end of shadowedContainer
        }

    }

    onClicked: {
        btnBackgroundAnim.start();
    }
}


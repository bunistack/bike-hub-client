import QtQuick 2.7
import QtQuick.Controls 1.4 as Controls
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import Felgo 3.0
import AppUtil 1.0

Popup{
    id: root
    width: 150
    height: 60
    clip: true
    padding: 2
    modal: false
    closePolicy: Popup.NoAutoClose

    onClosed: {
        if(running) running=false;
        operations_timer.stop();
    }

    background: Rectangle{

        color: Qt.rgba(0,0,0,0)
    }

    property alias timeoutInterval: operations_timer.interval
    property alias text: indicatorTxt.text
    property alias fontsize: indicatorTxt.font.pixelSize
    property alias running: control.running

    signal timeout()

    function run(indicatorText){
        text = indicatorText;
        running = true;
        operations_timer.restart();
        root.open();
    }

    Timer{
        id: operations_timer
        interval: 20000
        onTriggered: timeout()
    }

    Rectangle{
        id: container
        anchors.fill: parent
        radius: 2
        color: "white"

        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height
            spacing: 10

            Spinner{
                id: control
                running: false
                size: root.height-15
                anchors.verticalCenter: parent.verticalCenter
            }

            Text{
                id: indicatorTxt
                text: "Loading"
                font.family: AppUtil.font1.name
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 16
            }

            //end of row
        }

    }

    //end of root
}

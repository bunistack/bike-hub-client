import QtQuick 2.7
import QtQuick.Controls 2.2
import AppUtil 1.0
import SVG 1.0

import "../controls"

Popup {
    id: root
    modal: true
    width: 320
    height: 220
    x: (parent.width-width)/2
    y: (parent.height-height)/2

    background: Rectangle{
        color: "white"
        radius: 6
    }

    onOpened: {
        resetInputs();
    }

    function resetInputs(){
        bug_description_edit.reset();
    }

    Column{
        anchors.fill: parent
        anchors.margins: 2
        spacing: 10

        Row{
            width: parent.width
            height: 25

            Text {
                text: "Report Bug"
                width: parent.width - parent.height
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                color: "#323232"
                font.pixelSize: 18
                font.family: AppUtil.font1.name
                leftPadding: 3
            }
        }

        TextAreaStyle1{
            id: bug_description_edit
            width: 300
            height: 100
            maximumLength: 200
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MaterialButton{
            width: 150
            height: 40
            text: "Report"
            font.family: AppUtil.font1.name
            font.pixelSize: 16
            colorUp: "white"
            backgroundColor: "#39C4EB"
            anchors.left: parent.left

            onClicked: {

                let bug_description;

                if(bug_description_edit.isEmpty()){
                    return;
                }else{
                    bug_description = bug_description_edit.text;
                }


            }
        }

        //end of Column
    }

    //end of root
}

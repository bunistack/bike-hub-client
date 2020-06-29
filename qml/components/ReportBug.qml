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

    property string report_bug_request: ""

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

                report_bug_request = AppUtil.generateRequestID();

                busy_indicator.run("Reporting...");

                let msg = {
                    jsonrpc: "2.0",
                    params: {
                        method: "",
                        args: {
                            bug_description: bug_description
                        }
                    },
                    id: report_bug_request
                };

                API.post(JSON.stringify(msg));

            }
        }

        //end of Column
    }

    Connections{
        target: API

        onReplyReady: {
            switch(requestID){
            case report_bug_request:
                reportBugRequestReady(reply);
                break;
            default:
                break;
            }
        }
    }

    //end of root
}

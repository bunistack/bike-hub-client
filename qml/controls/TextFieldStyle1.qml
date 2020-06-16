import QtQuick 2.7
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.2
import AppUtil 1.0

Rectangle {
    id: root
    width: 320
    height: 70

    property bool iconEnabled: true

    property alias icon: lineEditIcon
    property alias lineEdit: control

    property alias actionIcon: actionButtonIcon
    property alias actionButton: actionButton

    property alias prefixVisible: prefixContainer.visible
    property alias prefixText: prefixText

    property alias sufixVisible: sufixContainer.visible
    property alias sufixText: sufixText

    property alias text: control.text
    readonly property string fullText: prefixText.text + control.text + sufixText.text

    property string regex: ""

    property bool textValid: false
    property alias textValidityIndicator: validityIndicatorCnt
    property bool validityIndicatorEnabled: true

    property bool placeholderContainerVisible: true

    signal actionButtonClicked()

    function validateString(text){

        if(regex === ""){
            textValid = true;
            return;
        }

        var patt = new RegExp(regex);
        var result = patt.test(text);
        textValid = result;
    }

    function isEmpty(){

        var fieldText = text;

        var reg = "^( )+$";
        var patt = new RegExp(reg);

        var result = patt.test(fieldText);

        if(result || fieldText === ""){
            textValid = false;
            return true;
        }else{
            textValid = true;
            return false;
        }
    }

    function showTextValidityIndicator(){
        textValidityIndicator.visible = true;
    }

    function hideTextValidityIndicator(){
        textValidityIndicator.visible = false;
    }

    function setText(txt){
        text = txt;
    }

    function reset(){
        lineEdit.clear();
        hideTextValidityIndicator();
    }

    Rectangle{
        anchors.fill: parent
        color: "white";
        radius: 6
        clip: true

        Column{
            anchors.fill: parent
            anchors.margins: 2

            Rectangle{
                id: labelContainer
                width: parent.width
                height: visible ? 20 : 0
                clip: true
                visible: lineEdit.text !== "" && placeholderContainerVisible

                Text {
                    id: altPlaceholderText
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    text: lineEdit.placeholderText
                    leftPadding: 10
                    font.pixelSize: 14
                    font.family: AppUtil.font1.name
                    color: control.focus ? "#39C4EB" : "#323232"
                }

                //end of labelContainer
            }

            Row{
                width: parent.width
                height: parent.height - labelContainer.height

                Rectangle{
                    id: iconContainer
                    width: iconEnabled ? parent.height : 0
                    height: parent.height

                    Image {
                        id: lineEditIcon
                        width: 30
                        height: 30
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    id: prefixContainer
                    width: visible ? parent.height : 0
                    height: parent.height
                    visible: false

                    Text {
                        id: prefixText
                        text: ""
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 16
                        font.family: AppUtil.font1.name
                        color: "#323232"
                    }

                }

                Rectangle{
                    width: (parent.width-iconContainer.width - prefixContainer.width - sufixContainer.width -
                            validityIndicatorCnt.width -actionButton.width)
                    height: parent.height

                    TextField{
                        id: control
                        width: parent.width
                        height: parent.height
                        font.family: AppUtil.font1.name
                        font.pixelSize: 16
                        leftPadding: 15
                        clip: true
                        selectionColor: "#fddd5c"
                        selectedTextColor: "#353637"
                        verticalAlignment: TextField.AlignVCenter

                        background: Rectangle{
                            border.width: 0
                            clip: true
                        }

                        onTextChanged: {

                            validateString(control.text);
                            if(!validityIndicatorCnt.visible && validityIndicatorEnabled && control.enabled){
                                validityIndicatorCnt.visible = true;
                            }
                        }
                        //end of textfield
                    }
                }

                Rectangle{
                    id: sufixContainer
                    width: visible ? parent.height-10 : 0
                    height: parent.height
                    visible: false

                    Text {
                        id: sufixText
                        text: ""
                        anchors.fill: parent
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 16
                        font.family: AppUtil.font1.name
                        color: "#323232"
                    }
                }

                Rectangle{
                    id: validityIndicatorCnt
                    visible: false
                    height: parent.height
                    width: visible ? validityIndicator.width + 10 : 0

                    Image {
                        id: validityIndicator
                        width: 25
                        height: 25
                        anchors.centerIn: parent
                        source: textValid ? "qrc:/assets/images/icons/checkmark_grey.png" : "qrc:/assets/images/icons/error_grey.png"
                    }
                }

                Rectangle{
                    id: actionButton
                    width: visible ? parent.height : 0
                    height: parent.height
                    visible: false

                    Image {
                        id: actionButtonIcon
                        width: 30
                        height: 30
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        enabled: control.enabled
                        onClicked: actionButtonClicked()
                    }
                }

                //end of row
            }

            //end of column
        }

    }

    Rectangle{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: 1.5
        width: parent.width - 20
        radius: height/2
        color: control.focus ? "#39C4EB" : "#323232"
    }
}

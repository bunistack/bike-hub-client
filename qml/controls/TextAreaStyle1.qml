import QtQuick 2.7
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import AppUtil 1.0

TextArea {
    id: control
    width: 320
    placeholderText: "Enter description"
    wrapMode: TextArea.Wrap
    font.pixelSize: 14
    color: "#353637"
    topPadding: placeholderTextContainer.visible ? 20 : 5
    bottomPadding: bottomRectangle.visible ? 20 : 5
    font.family: AppUtil.font1.name    

    property int maximumLength: 10000
    property bool textValid: true
    property bool maximumLengthRectVisible: true
    property bool placeholderTextContainerVisible: true

    property bool checkTextValidity: true

    onTextChanged: {

        textValid = true;

        if(length > maximumLength){
            var txt = text;
            txt = txt.slice(0,maximumLength);
            text = txt;
            cursorPosition = length;
        }
    }

    function isEmpty(){
        var fieldText = text;

        var reg = "^( )+$";
        var patt = new RegExp(reg);

        if(fieldText===""){

            if(checkTextValidity)
                textValid = false;

            return true;
        }

        var result = patt.test(fieldText);

        if(result){

            if(checkTextValidity)
                textValid = false;

            return true;
        }else{
            textValid = true;
            return false;
        }
    }

    function reset(){
        clear();
        textValid = true;
    }

    background: Rectangle {
        anchors.fill: parent

        Rectangle{
            id: placeholderTextContainer
            width: parent.width
            height: visible ? 20 : 0
            visible: placeholderTextContainerVisible ? text !== "" : false
            color: Qt.rgba(0,0,0,0)
            anchors.top: parent.top

            Text {
                text: placeholderText
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                font.family: AppUtil.font1.name
                font.pixelSize: 14
                color: control.focus ? "#39C4EB" : "#323232"
                leftPadding: 8
            }
        }

        Rectangle{
            id: bottomRectangle
            width: parent.width
            height: visible ? 20 : 0
            color: Qt.rgba(0,0,0,0)
            anchors.bottom: parent.bottom
            visible: maximumLengthRectVisible

            Text {
                text: control.length + " / " + maximumLength
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                font.family: AppUtil.font1.name
                font.pixelSize: 12
                color: "#323232"
                rightPadding: 8
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

        //end of background
    }

    //end of root
}

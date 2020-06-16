import QtQuick 2.12
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import AppUtil 1.0

ComboBox {
    id: root
    width: 320
    height: 70
    font.pixelSize: 14
    font.family: AppUtil.font1.name

    property alias label: labelText.text

    property bool labelVisible: true

    function setText(text){
        currentIndex = find(text);
    }

    contentItem: Text {
        leftPadding: 15
        rightPadding: root.indicator.width + root.spacing
        topPadding: labelContainer.height
        text: root.displayText
        font: root.font
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    delegate: ItemDelegate {
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter

        contentItem: Text {
            text: modelData
            font: root.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }

        highlighted: root.highlightedIndex === index
    }

    background: Rectangle{
        id: container
        anchors.fill: parent
        anchors.margins: 4
        radius: 6
        clip: true

        Rectangle{
            id: labelContainer
            width: parent.width
            height: labelVisible ? 16 : 0
            anchors.top: parent.top
            anchors.topMargin: 5
            clip: true

            Text {
                id: labelText
                text:  "Combo Box"
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                leftPadding: 10
                font.pixelSize: 14
                font.family: AppUtil.font1.name
                color: root.focus ? "#39C4EB" : "#323232"
            }

            //end of labelContainer
        }

        Rectangle{
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            height: 1.5
            width: parent.width - 20
            radius: height/2
            color: root.focus ? "#39C4EB" : "#323232"
        }

        //end of background
    }


    popup: Popup {
        y: root.height - 1
        width: root.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: root.popup.visible ? root.delegateModel : null
            currentIndex: root.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: ShadowedRectangle {
            anchors.fill: parent
            radius: 6
            //end of background
        }

        //end of Popup
    }

    //end of root
}

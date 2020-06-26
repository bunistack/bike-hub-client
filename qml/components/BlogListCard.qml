import QtQuick 2.12
import AppUtil 1.0
import Felgo 3.0

import "../controls"

ShadowedRectangle {
    id: root
    width: 320
    height: 250
    radius: 8

    property bool isOpen: false

    RoundedImage{
        anchors.fill: parent
        radius: parent.radius
        source: photo
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle{
        width: 300
        height: isOpen ? 150 : 50
        radius: 8
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter

        Behavior on height{
            NumberAnimation{
                duration: 300
                easing.type: Easing.InCurve
            }
        }

        Column{
            anchors.fill: parent
            topPadding: 5

            ListItemStyle1{
                width: 290
                height: 50
                anchors.horizontalCenter: parent.horizontalCenter
                label: "Title"
                text: title
                iconSource: "qrc:/assets/images/icons/pastel/news_pastel.png"
            }

            Text {
                text: textContent
                width: parent.width
                height: parent.height - parent.topPadding - 50
                wrapMode: Text.Wrap
                padding: 10
                font.pixelSize: 14
                font.family: AppUtil.font1.name
                elide: Text.ElideRight
                opacity: isOpen ? 1 : 0

                Behavior on opacity{
                    NumberAnimation{
                        duration: 500
                        easing.type: Easing.InCurve
                    }
                }
            }

            //end of Column
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {

            if(isOpen){
                isOpen = false;
            }else{
                isOpen = true;
            }
        }
    }

    //end of header
}


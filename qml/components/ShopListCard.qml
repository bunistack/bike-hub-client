import QtQuick 2.12
import AppUtil 1.0
import Felgo 3.0

import "../controls"

ShadowedRectangle {
    id: root
    width: 320
    height: 250
    radius: 8

    RoundedImage{
        anchors.fill: parent
        radius: parent.radius
        source: shopImage
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle{
        id: contentRectangle
        width: 300
        height: 130
        radius: 8
        opacity: 0.1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.horizontalCenter: parent.horizontalCenter

        Behavior on opacity{
            NumberAnimation{
                duration: 500
                easing.type: Easing.InCurve
            }
        }

        Column{
            anchors.fill: parent
            topPadding: 5
            //spacing: 10

            ListItemStyle1{
                width: 290
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                label: "Shop Name"
                text: shop
                iconSource: "qrc:/assets/images/icons/pastel/store_pastel.png"
            }

            ListItemStyle1{
                width: 290
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                label: "Location"
                text: location
                iconSource: "qrc:/assets/images/icons/pastel/medium/city_pastel.png"
            }

            Row{
                width: 290
                height: 40

                ListItemStyle1{
                    width: parent.width/2
                    height: parent.height
                    label: "Opens"
                    text: opens
                    iconSource: "qrc:/assets/images/icons/pastel/medium/time_pastel.png"
                }

                ListItemStyle1{
                    width: parent.width/2
                    height: parent.height
                    label: "Closes"
                    text: closes
                    iconSource: "qrc:/assets/images/icons/pastel/medium/time_pastel.png"
                }
            }

            //end of Column
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {

            if(contentRectangle.opacity === 0.1){
                contentRectangle.opacity = 1;
            }else{
                contentRectangle.opacity = 0.1;
            }
        }
    }

    //end of header
}


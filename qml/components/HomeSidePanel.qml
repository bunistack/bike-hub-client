import QtQuick 2.12
import Felgo 3.0
import AppUtil 1.0
import SVG 1.0

import "../controls"

Rectangle {
    id: root
    width: isOpen ? panelWidth : 30

    property real panelWidth: 300
    property bool isOpen: true

    //width animation
    Behavior on width{
        NumberAnimation{
            duration: 150
            easing.type: Easing.InCurve
        }
    }

    //background grey Rectangle
    Rectangle{
        width: parent.width-60
        height: parent.height
        color: "#fafafa"
    }

    //right side border
    Rectangle{
        width: 1.5
        height: parent.height
        color: "#f0f0f0"
        anchors.right: parent.right

        //width control
        IconButton{
            width: 40
            height: 40
            buttonRadius: width/2
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            backgroundColor: "#39C4EB"
            icon.source: "qrc:/assets/images/icons/arrow_grey.png"
            icon.color: "white"
            icon.width: 20
            icon.height: 20
            rotation: isOpen ? 0 : 180

            onClicked: {
                if(isOpen)
                    isOpen = false;
                else
                    isOpen = true;
            }
        }

    }

    ShadowedRectangle{
        width: parent.width - 10
        height: 400
        radius: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: -radius
        verticalOffset: 2
        horizontalOffset: 2
        shadowColor: Qt.rgba(150/255,150/255,150/255,0.3)
        opacity: isOpen ? 1 : 0

        Behavior on opacity{
            NumberAnimation{
                duration: 150
                easing.type: Easing.InCurve
            }
        }

        Column {
            anchors.fill: parent
            leftPadding: parent.radius + 10
            topPadding: 10
            spacing: 15

            //user info
            Row{
                height: 80
                width: parent.width

                RoundedImage{
                    id: profile_pic
                    width: parent.height
                    height: parent.height
                    source: SVG.profile_picture
                }

                Column{
                    width: parent.width - profile_pic.width
                    height: parent.height
                    leftPadding: 20
                    spacing: 5

                    ListItemStyle1{
                        width: parent.width
                        height: 40
                        label: "Active Since"
                        text: "2019-09-20"
                        iconSource: "qrc:/assets/images/icons/pastel/medium/calendar_pastel.png"
                    }

                    ListItemStyle1{
                        width: parent.width
                        height: 40
                        label: "DOB"
                        text: "2000-08-04"
                        iconSource: "qrc:/assets/images/icons/pastel/medium/birthday_cake_pastel.png"
                    }

                    //end of column
                }

                //end of row
            }

            //quick info
            Column{
                width: parent.width
                height: childrenRect.height
                spacing: 10
                topPadding: 20

                Repeater{
                    model: quickItemsModel

                    ListItemStyle2{
                        width: 200
                        height: 60
                        anchors.horizontalCenter: parent.horizontalCenter
                        icon.source: iconSource
                        iconSize: 40
                        label.text: itemLabel
                        text.text: itemText
                    }
                }
            }
        }

    }

    ListModel{
        id: quickItemsModel

        ListElement{
            iconSource: "qrc:/assets/images/icons/pastel/orders_pastel.png"
            itemLabel: "Orders"
            itemText: "8"
        }

        ListElement{
            iconSource: "qrc:/assets/images/icons/pastel/store_pastel.png"
            itemLabel: "Shops"
            itemText: "20"
        }

        ListElement{
            iconSource: "qrc:/assets/images/icons/pastel/news_pastel.png"
            itemLabel: "Latest Updates"
            itemText: "12"
        }
    }

    //end of root
}

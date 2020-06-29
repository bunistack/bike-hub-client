import QtQuick 2.12
import QtQuick.Controls 2.5
import Felgo 3.0
import AppUtil 1.0
import SVG 1.0

import "../controls"

Drawer {
    id: root

    property alias backgroundColor: backgroundItem.color
    property alias listModel: listView.model

    property int currentListIndex: 0

    signal menuClicked(int index)

    background: Rectangle{
        id: backgroundItem

        Rectangle{
            id: header
            width: parent.width
            height: 200

            Image{
                width: parent.width/1.9
                height: parent.height/1.9
                sourceSize.width: width
                sourceSize.height: height
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectCrop
                source: SVG.biking
            }

            Column {
                anchors.fill: parent
                leftPadding: 10
                topPadding: 30
                spacing: 10

                RoundedImage{
                    id: headerAvatarImage
                    width: 100
                    height: 100
                    radius: width/2
                    source: SVG.profile_picture
                    fillMode: Image.PreserveAspectCrop
                }

                Column {
                    width: 280
                    height: 55
                    padding: 7

                    Text {
                        text: "Herbert Amukhuma"
                        width: parent.width
                        elide: Text.ElideRight
                        font.family: AppUtil.font1.name
                        font.bold: true
                        font.pixelSize: 16
                        color: "#323232"
                    }

                    Text {
                        text: "herbertamukhuma@gmail.com"
                        width: parent.width
                        elide: Text.ElideRight
                        font.family: AppUtil.font1.name
                        font.pixelSize: 16
                        color: "#646464"
                    }

                }
            }

            //end of header
        }

        Rectangle{
            id: listViewContainer
            width: parent.width
            height: (parent.height - header.height)
            anchors.top: header.bottom

            ListView {
                id: listView
                anchors.fill: parent
                clip: true

                delegate: Rectangle{
                    width: parent.width
                    height: 60
                    color: currentListIndex === index ? "#f5f5f5" : (itemMouseArea.containsMouse ? "#f5f5f5" : "#ffffff")
                    clip: true

                    //top and bottom borders
                    Rectangle{
                        width: parent.width
                        height: 1
                        anchors.top: parent.top
                        color: "#e1e1e1"
                        visible: index === 0
                    }

                    Rectangle{
                        width: parent.width
                        height: 1
                        anchors.bottom: parent.bottom
                        color: "#e1e1e1"
                    }

                    Row{
                        anchors.fill: parent
                        leftPadding: 20

                        Icon{
                            size: 30
                            anchors.verticalCenter: parent.verticalCenter
                            icon: iconSource
                            color: currentListIndex === index ? "#39C4EB" : "#323232"
                        }

                        Text {
                            text: listItemText
                            font.family: AppUtil.font1.name
                            font.pixelSize: 15
                            font.bold: true
                            color: currentListIndex === index ? "#39C4EB" : "#323232"
                            wrapMode: Text.Wrap
                            anchors.verticalCenter: parent.verticalCenter
                            leftPadding: 30
                        }
                    }

                    MouseArea{
                        id: itemMouseArea
                        anchors.fill: parent
                        hoverEnabled: true

                        onClicked: {
                            currentListIndex = index;
                            menuClicked(index);
                        }
                    }

                    //end of ListView delegate
                }

                //end of ListView
            }

            //end of ListView container
        }

        //end of background
    }

    //end of root
}

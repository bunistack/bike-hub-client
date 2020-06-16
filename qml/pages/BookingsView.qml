import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0

import "../controls"
import "../components"
import "../models"

CustomPage {
    id: root

    Column{
        anchors.fill: parent

        ShadowedRectangle {
            id: header
            width: parent.width
            height: 50
            z: 1

            Row{
                width: childrenRect.width
                height: parent.height
                spacing: 15
                leftPadding: 15

                Image{
                    width: 30
                    height: 30
                    visible: navigationDrawer.interactive
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/assets/images/icons/hamburger_menu_grey.png"

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: navigationDrawer.open()
                    }
                }

                Text {
                    text: "Bookings"
                    font.family: AppUtil.font1.name
                    font.bold: true
                    font.pixelSize: 16
                    verticalAlignment: Text.AlignVCenter
                    height: parent.height
                }
            }

            Row{
                width: childrenRect.width
                height: parent.height
                spacing: 15
                anchors.margins: 10
                anchors.right: parent.right

                Image{
                    width: 30
                    height: 30
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/assets/images/icons/menu_dotted_grey.png"

                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: menu.open()
                    }

                    CustomMenu {
                        id: menu
                        y: parent.y
                        menuModel: ListModel {

                            ListElement{
                                itemText: "Book"
                                itemIcon: "qrc:/assets/images/icons/ticket_grey.png"
                            }
                        }

                        onMenuItemClicked: {
                            switch(index){
                            case 0:
                                bookingInput.run("book",-1);
                                break;
                            default:
                                break;
                            }
                        }
                    }

                    //end of menu button
                }


                //end of right side row
            }

            //end of header
        }

        BookingsList{
            width: parent.width
            height: parent.height - header.height
        }

        //end of Column
    }

    BookingsModel{
        id: bookingsModel
    }

    BookingInput{
        id: bookingInput
    }

    //end of root
}

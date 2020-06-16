import QtQuick 2.12
import AppUtil 1.0

import "../controls"

ShadowedRectangle {
    id: root
    width: 320
    height: 210
    radius: 8    

    Column{
        anchors.fill: parent
        spacing: 10

        Row{
            width: parent.width
            height: 100

            Item {
                width: parent.height
                height: parent.height

                Image {
                    anchors.fill: parent
                    anchors.margins: 20
                    sourceSize: Qt.size(width,height)
                    source: bike_type === "motorbike" ? "qrc:/assets/images/icons/pastel/motor_bike_pastel.png" : "qrc:/assets/images/icons/pastel/bicycle_pastel.png"
                }
            }

            Column{
                height: parent.height
                width: parent.width - parent.height
                topPadding: 20
                spacing: 10

                Image {
                    width: 120
                    height: (sourceSize.height/sourceSize.width) * width
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "qrc:/assets/images/icons/pastel/barcode_pastel.png"
                }

                Text {
                    text: "BK00" + (index + 1)
                    width: parent.width
                    height: 18
                    font.pixelSize: 16
                    font.bold: true
                    font.weight: Font.ExtraBold
                    font.family: AppUtil.font1.name
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }

        ListItemStyle1{
            width: 300
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            label: "Appointment Time"
            text: Qt.formatDateTime(appointment_time,"ddd d MMM yyyy hh:mm")
            iconSource: "qrc:/assets/images/icons/pastel/medium/time_pastel.png"
        }

        ListItemStyle1{
            width: 300
            height: 40
            anchors.horizontalCenter: parent.horizontalCenter
            label: "Repair Shop"
            text: shop
            iconSource: "qrc:/assets/images/icons/pastel/store_pastel.png"
        }

        //end of Column
    }

    //end of header
}


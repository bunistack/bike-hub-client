import QtQuick 2.7
import QtQuick.Controls 2.2
import AppUtil 1.0
import SVG 1.0

import "../controls"

Popup {
    id: root
    modal: true
    width: 320
    height: 350
    x: (parent.width-width)/2
    y: (parent.height-height)/2

    background: Rectangle{
        color: "white"
        radius: 6
    }

    property string inputAction: "book"

    property int bookingIndex: -1

    function populateInputs(){
        let booking = bookingsModel.get(bookingIndex);
        bike_type_combo.currentIndex = bike_type_combo.find(booking.bike_type);
        shop_edit.text = booking.shop;
        time_edit.text = booking.appointment_time;
    }

    function resetInputs(){
        bike_type_combo.currentIndex = 0;
        shop_edit.reset();
        time_edit.reset();
    }

    function run(action, index){
        inputAction = action;
        bookingIndex = index;

        if(action === "update_booking"){
            populateInputs();
        }else{
            resetInputs();
        }

        root.open();
    }

    Column{
        anchors.fill: parent
        anchors.margins: 2
        spacing: 10

        Row{
            width: parent.width
            height: 25

            Text {
                text: "Book"
                width: parent.width - parent.height
                height: parent.height
                verticalAlignment: Text.AlignVCenter
                color: "#323232"
                font.pixelSize: 18
                font.family: AppUtil.font1.name
                leftPadding: 3
            }

            Image {
                id: delete_icon
                source: "qrc:/assets/images/icons/trash_grey.png"
                width: parent.height
                height: parent.height
                visible: inputAction === "update_booking"
            }
        }

        ComboBoxStyle1{
            id: bike_type_combo
            width: 300
            anchors.horizontalCenter: parent.horizontalCenter
            label: "Bike Type"
            model: ["bicycle","motorbike"]
        }

        TextFieldStyle1{
            id: shop_edit
            width: 300
            anchors.horizontalCenter: parent.horizontalCenter
            lineEdit.placeholderText: "Store"
            icon.source: "qrc:/assets/images/icons/store_grey.png"
        }

        TextFieldStyle1{
            id: time_edit
            width: 300
            anchors.horizontalCenter: parent.horizontalCenter
            lineEdit.placeholderText: "Appointment Time"
            icon.source: "qrc:/assets/images/icons/time_grey.png"
            regex: "^\\d{4}-[01]\\d-[0-3]\\d [0-2]\\d:[0-5]\\d:[0-5]\\d(?:\\.\\d+)?$"
        }

        MaterialButton{
            width: 150
            height: 40
            text: "Book"
            font.family: AppUtil.font1.name
            font.pixelSize: 16
            colorUp: "white"
            backgroundColor: "#39C4EB"
            anchors.left: parent.left

            onClicked: {

                if(!time_edit.textValid){
                    return;
                }

                bookingsModel.append({
                                         "bike_type": bike_type_combo.currentText,
                                         "appointment_time": time_edit.text,
                                         "shop": shop_edit.text
                                     });

                root.close();
            }
        }


        //end of Column
    }

    //end of root
}

import QtQuick 2.12
import QtQuick.Controls 2.12
import AppUtil 1.0
import QtGraphicalEffects 1.0

Menu {
    height: menuModel !== null ? 40 * menuModel.count + (2 * topPadding): 0
    width: 200

    property ListModel menuModel

    signal menuItemClicked(int index)

//    ListModel{
//        id: menuModel

//        ListElement{
//            itemText: "Add Student"
//            itemIcon: "qrc:/assets/images/icons/add-person.png"
//        }

//    }

    topPadding: 10
    bottomPadding: 10

    background: ShadowedRectangle{
        anchors.fill: parent
        contentItemMargins: 4
        contentRadius: 4

        contentItem: Rectangle{
            id: shadowedRect
            anchors.fill: parent
            radius: 4
            clip: true
        }
    }

    Repeater{
        model: menuModel !== null ? menuModel : undefined

        MenuItem{
            id: menuItem
            height: 40
            width: shadowedRect.width
            anchors.horizontalCenter: parent.horizontalCenter
            hoverEnabled: true

            background: Rectangle {

                color: menuItem.hovered ? "#f0f0f0" : "white"

                Row {
                    anchors.fill: parent
                    spacing: 20
                    padding: 7

                    Image {
                        source: itemIcon
                        width: 30
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        smooth: true
                    }

                    Text {
                        text: itemText
                        font.family: AppUtil.font1.name
                        font.pixelSize: 15
                        anchors.verticalCenter: parent.verticalCenter
                        color: "#182238"
                    }
                }
            }

            onClicked: menuItemClicked(index)

            //end of menuItem
        }

    }

    //end of menu
}


import QtQuick 2.12
import QtQuick.Controls 2.5
import AppUtil 1.0
import SVG 1.0
import Felgo 3.0

import "../controls"
import "../models"
import "../components"

FelgoPage {
    id: root

    property bool isPortrait: width < 1200

    NavigationDrawer {
        id: navigationDrawer
        edge: Qt.LeftEdge
        width: 300
        height: parent.height
        modal: isPortrait || Theme.isAndroid
        interactive: root.isCurrentStackPage ? (isPortrait || Theme.isAndroid) : false
        visible: root.isCurrentStackPage ? (!isPortrait || !Theme.isAndroid) : false
        position: root.isCurrentStackPage ? (isPortrait || Theme.isAndroid ? 0 : 1) : 0

        listModel: NavigationDrawerListModel{}

        onMenuClicked: {

            switch(index){
            case 0:
                navigationStackView.clearAndPush(Qt.resolvedUrl("./Home.qml"));
                break;
            case 1:
                navigationStackView.clearAndPush(Qt.resolvedUrl("./Bookings.qml"));
                break;
            case 2:
                navigationStackView.clearAndPush(Qt.resolvedUrl("./Shops.qml"));
                break;
            case 3:
                navigationStackView.clearAndPush(Qt.resolvedUrl("./Blog.qml"));
                break;
            case 4:
                navigationStackView.clearAndPush(Qt.resolvedUrl("./About.qml"));
                break;
            }

            if(isPortrait || Theme.isAndroid){
                navigationDrawer.close();
            }

        }

        //end of drawer
    }

    //StackView for the different drawer options
    CustomStackView {
        id: navigationStackView
        anchors.fill: parent
        anchors.leftMargin: isPortrait || Theme.isAndroid ? 0 : navigationDrawer.width

        Component.onCompleted: {
            push(Qt.resolvedUrl("./Home.qml"));
        }
    }

    //end of root
}

import QtQuick 2.7
import QtQuick.Controls 2.2

import "../controls"

Rectangle {
    clip: true

    CustomStackView {
        id: homeNavigationStack
        anchors.fill: parent
        initialItem: homeView

        HomeView {
            id: homeView
        }
    }

    //end of root
}

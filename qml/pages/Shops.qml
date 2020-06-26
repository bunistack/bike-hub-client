import QtQuick 2.7
import QtQuick.Controls 2.2

import "../controls"

Rectangle {
    clip: true

    CustomStackView {
        id: shopsNavigationStack
        anchors.fill: parent
        initialItem: shopsView

        ShopsView {
            id: shopsView
        }
    }

    //end of root
}

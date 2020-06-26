import QtQuick 2.7
import QtQuick.Controls 2.2

import "../controls"

Rectangle {
    clip: true

    CustomStackView {
        id: blogNavigationStack
        anchors.fill: parent
        initialItem: blogView

        BlogView {
            id: blogView
        }
    }

    //end of root
}

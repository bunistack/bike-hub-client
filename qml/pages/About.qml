import QtQuick 2.7
import QtQuick.Controls 2.2

import "../controls"

Rectangle {
    clip: true

    CustomStackView {
        id: aboutNavigationStack
        anchors.fill: parent
        initialItem: aboutView

        AboutView {
            id: aboutView
        }
    }

    //end of root
}

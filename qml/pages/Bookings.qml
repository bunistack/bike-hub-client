import QtQuick 2.7
import QtQuick.Controls 2.2

import "../controls"

Rectangle {
    clip: true

    CustomStackView {
        id: bookingsNavigationStack
        anchors.fill: parent
        initialItem: bookingsView

        BookingsView {
            id: bookingsView
        }
    }

    //end of root
}

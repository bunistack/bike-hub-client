import Felgo 3.0
import QtQuick 2.0

App {

    NavigationStack {

        Page {
            title: qsTr("Main Page")

            Image {
                source: "../assets/felgo-logo.png"
                anchors.centerIn: parent
            }
        }

    }
}

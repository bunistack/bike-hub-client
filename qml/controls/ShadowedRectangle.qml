import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.12

import "../controls"

Rectangle {
    id: root
    width: 320
    height: 150
    color: Qt.rgba(0,0,0,0)

    property alias contentItem: container.children
    property real contentItemMargins
    property real contentRadius: 6
    property bool shadowEnabled: true
    property alias shadowColor: shadow.color
    property alias dropShadow: shadow

    Rectangle{
        id: container
        anchors.fill: parent
        anchors.margins: contentItemMargins
        radius: contentRadius
        clip: true
        //end of container
    }

    DropShadow{
        id: shadow
        anchors.fill: shadowEnabled ? container : undefined
        cached: true
        radius: 8.0
        samples: 1+radius*2
        color: Qt.rgba(100/255,100/255,100/255,0.3)
        source: shadowEnabled ? container : undefined        
    }

    //end of root
}

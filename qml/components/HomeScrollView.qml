import QtQuick 2.12
import QtQuick.Controls 2.12

ScrollView{
    width: parent.width
    height: parent.height - header.height
    contentWidth: -1
    clip: true

    onWidthChanged: flow.width = width

    Flow{
        id: flow
        spacing: cols < 2 ? 10 : 40
        bottomPadding: cols < 2 ? 20 : 40
        topPadding: cols < 2 ? 20 : 40

        onWidthChanged: {

            cols = Math.floor(width/360);

            if(cols < 2){
                leftPadding = (width-320)/2;
                return;
            }

            leftPadding = (width - ((320*cols) + ((cols-1)*spacing)))/2;
        }

        //end of flow
    }

    //end of ScrollView
}


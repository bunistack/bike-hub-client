import QtQuick 2.12
import QtQuick.Controls 2.12

ScrollView{
    contentWidth: -1
    clip: true

    onWidthChanged: flow.width = width

    property int cols

    Flow{
        id: flow
        spacing: cols > 1 ? 30 : 20
        bottomPadding: 20
        topPadding: 20

        onWidthChanged: {

            cols = Math.floor(width/360);

            if(cols < 2){
                leftPadding = (width-320)/2;
                return;
            }

            leftPadding = (width - ((320*cols) + ((cols-1)*spacing)))/2;

        }

        Repeater{
            model: bookingsModel

            BookingsListCard {

            }
        }

        //end of Flow
    }

    //end of ScrollView
}

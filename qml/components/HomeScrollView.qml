import QtQuick 2.12
import QtQuick.Controls 2.12

import "../models"

ScrollView{
    contentWidth: -1
    clip: true

    onWidthChanged: flow.width = width

    Flow{
        id: flow
        spacing: 20
        bottomPadding: cols < 2 ? 10 : 20
        topPadding: cols < 2 ? 10 : 20

        onWidthChanged: {

            cols = Math.floor(width/135);

            if(cols < 2){
                leftPadding = (width-120)/2;
                return;
            }

            leftPadding = (width - ((120*cols) + ((cols-1)*spacing)))/2;
        }

        Repeater{
            model: HomeItemsModel{}

            HomeItemCard{
                icon: iconSource
                text: itemText

                onItemClicked: {
                    navigationStackView.clearAndPush(Qt.resolvedUrl(itemPage));
                }
            }
        }

        //end of flow
    }

    //end of ScrollView
}


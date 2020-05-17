import QtQuick 2.12
import Felgo 3.0

ListModel{
    id: model

    Component.onCompleted: {

        for(let i=0; i<elements.length; i++){
            model.append(elements[i]);
        }

    }

    property var elements: [
        {
            iconSource: IconType.home,
            listItemText: "Home"
        },
        {
            iconSource: IconType.ticket,
            listItemText: "Bookings"
        },

        {
            iconSource: IconType.shoppingcart,
            listItemText: "Shops"
        },
        {
            iconSource: IconType.newspapero,
            listItemText: "Blog"
        },
        {
            iconSource: IconType.infocircle,
            listItemText: "About"
        }
    ]

}


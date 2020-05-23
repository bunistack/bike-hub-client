import QtQuick 2.12

ListModel{

    ListElement{
        iconSource: "qrc:/assets/images/icons/pastel/orders_pastel.png"
        itemText: "Bookings"
        itemPage: "./Bookings.qml"
    }

    ListElement{
        iconSource: "qrc:/assets/images/icons/pastel/store_pastel.png"
        itemText: "Shops"
        itemPage: "./Shops.qml"
    }

    ListElement{
        iconSource: "qrc:/assets/images/icons/pastel/news_pastel.png"
        itemText: "Blog"
        itemPage: "./Blog.qml"
    }

    ListElement{
        iconSource: "qrc:/assets/images/icons/pastel/about_pastel.png"
        itemText: "About"
        itemPage: "./About.qml"
    }

}


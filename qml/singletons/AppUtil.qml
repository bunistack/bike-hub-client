pragma Singleton

import QtQuick 2.0

QtObject {

    /**************************************
     * function definitions start here
    **************************************/

    /*********************************************
     * function definitions end here
    **********************************************/



    /*********************************************
     * property definitions start here
    **********************************************/

    //defines Application font
    property QtObject font1: FontLoader{
        source: "qrc:/assets/fonts/Nunito-Regular.ttf"
    }

}

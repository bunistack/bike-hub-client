pragma Singleton

import QtQuick 2.0

QtObject {

    /**************************************
     * function definitions start here
    **************************************/

    //generates a request id
    function generateRequestID(){
        var request_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        request_string = shuffleString(request_string);
        return request_string.substring(1,15);
    }

    //shuffles a string
    function shuffleString(string) {
       var a = string.split(""),
       n = a.length;

       for(var i = n - 1; i > 0; i--) {
           var j = Math.floor(Math.random() * (i + 1));
           var tmp = a[i];
           a[i] = a[j];
           a[j] = tmp;
       }

       return a.join("");
    }

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

import Felgo 3.0
import QtQuick 2.0
import SVG 1.0

import "./controls"
import "./components"

App {
    id: mainAppWindow
    visible: false
    width: 960
    height: 600

    onSplashScreenFinished: {        
        mainNavigationStack.push(Qt.resolvedUrl("./pages/SplashScreen.qml"));
        visible = true;
    }

    FelgoNavigationStack{
        id: mainNavigationStack
        navigationBar.visible: false
        navigationBar.height: Theme.isAndroid ? (navigationBar.visible ? Theme.tabBar.height/2 : 0) : 0        
    }

    ReportBug{
        id: reportBug
    }

    ImageMessageDialog{
        id: imageMessageDialog
    }

    ImageErrorDialog{
        id: imageErrorDialog
    }

    PopupBusyIndicator{
        id: busy_indicator
        width: 200
        x: (parent.width-width)/2
        y: (parent.height-height)/2
        modal: true

        onTimeout: {
            close();
            var message;
            message = "The operation took too long to complete. Also check your internet connection.";
            imageErrorDialog.run(message,SVG.starled,null);
        }
    }

}

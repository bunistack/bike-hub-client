import Felgo 3.0
import QtQuick 2.0

import "./controls"

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

}

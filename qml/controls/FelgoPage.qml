import Felgo 3.0 as F
import QtQml 2.3
import QtQuick 2.12
import QtQuick.Controls 2.5

F.Page {

    onAppeared: {

        //functionality for isActive property
        isActiveTimer.restart();
        forceActiveFocus();

        //functionality for isStatusBarVisible property
        if(isStatusBarVisible){            
            root.navigationStack.navigationBar.visible = true;
        }else{
            root.navigationStack.navigationBar.visible = false;
        }
    }

    onDisappeared: {

        //functionality for isActive property
        isActiveTimer.stop();
        isActive = false;
    }

    //similar to isCurrentStackPage property, only that it is set to 'true' with a delay, defined by the isActiveDelay property
    property bool isActive: false
    property real isActiveDelay: 200

    //timer control for isActive property
    Timer{
        id: isActiveTimer
        interval: isActiveDelay

        onTriggered: {
            isActive = true;
        }
    }

    //SwipeView functionality
    property SwipeView swipeView

    //prevent page from popping if the current SwipeView has more than one page
    backNavigationEnabled: swipeView !== null ? swipeView.currentIndex < 1 : true

    //handles back key navigation for the SwipeView
    Keys.onReleased: {

        if(event.key === Qt.Key_Back && isActive && swipeView !== null){
            event.accepted = true;
            swipeView.decrementCurrentIndex();
        }
    }

    //status bar control
    property bool isStatusBarVisible: true

    //end of root
}

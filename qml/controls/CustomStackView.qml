import QtQuick 2.12
import QtQuick.Controls 2.12

StackView {

    function clearAndPush(item,properties){
        clear();

        if(properties === null){
            push(item);
        }else{
            push(item,properties);
        }

    }
}

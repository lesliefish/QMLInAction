import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {

    visible: true
    width: 1024
    height: 768
    title: qsTr("TextEdit demo");

    Rectangle{
        id:mainRect;
        anchors.fill: parent;

        color: "black"

        property var lastItem: undefined;
        property var curItem: undefined;
        property var textEditItemList: [];

        property var testString:[
            "真理惟一可靠的标准就是永远自相符合。"
            ,"Saying and doing are two different things."
            ,"Two heads are better than one."
            ,"Time flies."
            ,"勿谓言之不预！"
            ,"Good company on the road is the shortest cut."
            ,"Time to go."
            ,"It is never too late to learn."
            ,"请输入您的文字"
            ,"1+1=2?"
            ,"未来之歌"];

        // toJson
        function toJson(){
            var json = {};
            json["itemList"] = [];
            for(var i = 0; i < textEditItemList.length; ++i) {
                json["itemList"].push(textEditItemList[i].toJson());
            }
            console.log("json:", JSON.stringify(json));
        }

        // 选中的item更改后事件处理
        function onCurrentItemChanged(curItemId) {
            for(var i = 0; i < textEditItemList.length; ++i){
                if(textEditItemList[i].itemId === curItemId) {
                    lastItem = curItem;
                    curItem = textEditItemList[i];
                    lastItem.setDisplayState();
                }
            }
        }

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                for(var i = 0; i < textEditItemList.length; ++i){
                    if(lastItem !== undefined){
                        lastItem.setDisplayState();
                    }

                    if(curItem !== undefined){
                        curItem.setDisplayState();
                    }

                    lastItem = undefined;
                    curItem = undefined;
                }

                //test
                toJson();
            }
        }

        Rectangle {
            anchors.right: parent.right;
            anchors.top: parent.top;
            width: 200;
            height: 36;
            color: "transparent";
            Text {
                anchors.centerIn: parent;
                text: qsTr("添加");
                font.family: "microsoft yahei";
                color: "white";
            }

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    for(var i = 0; i < 15; ++i) {
                        var component = Qt.createComponent("TextEditItem.qml");
                        if(component.status === Component.Ready){
                            var obj = component.createObject(mainRect, {"x": Math.round(Math.random()*10)*100, "y": Math.round(Math.random()*10)*100});
                            obj.text = mainRect.testString[Math.round(Math.random()*10)];
                            obj.rotation = 10*Math.round(Math.random()*10)*(Math.round(Math.random()*10)%2 == 0 ? 1 : -1);
                            obj.scale = Math.round(Math.random()*10);
                            obj.fontColor = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
                            mainRect.textEditItemList.push(obj);
                            obj.signalClicked.connect(mainRect.onCurrentItemChanged);
                        }
                    }

                    parent.z = mainRect.textEditItemList.length*10;

                    mainRect.grabToImage(function(result) {
                        result.saveToFile("test.png");
                    });
                }
            }
        }
    }


}

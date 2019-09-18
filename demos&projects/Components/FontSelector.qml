import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id : fontSelector;

    property string curSelectedFont: "";//当前选中的字体

    signal fontSelectChanged(string newFont);
    //设置某字体，然后根据调整列表中当前选中项为当前字体
    function setFont(newFont){
        tumbler.changeIndexByFont(newFont);
    }

    Tumbler {
        id:tumbler
        implicitHeight: 300;
        implicitWidth: 120;
        anchors.centerIn : parent
        model: fontListModel

        // 列表背景
        background: Item {
            Rectangle {
                opacity: tumbler.enabled ? 0.9 : 1
                border.color: "#000000"
                width: tumbler.width
                height: tumbler.height
                anchors.top: parent.top
                color: "black";
                radius: 5;
            }
        }

        //具体Item的代理
        delegate: Rectangle{
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (tumbler.visibleItemCount / 2) // 这行代码控制列表上下的item透明度逐渐降低，渐隐效果
            color : tumbler.currentIndex === index ? "darkred" : "transparent";// 根据是否当前选中item调整背景色
            Text {
                anchors.fill: parent
                text: displayData;      // item显示的文字使用fontListModel的displayData
                horizontalAlignment: Text.AlignHCenter;
                verticalAlignment: Text.AlignVCenter;
                font.family: realData;  // item显示的字体使用fontListModel的realData
                font.bold: tumbler.currentIndex === index; // 根据是否当前选中item调整字体是否加粗
                font.pointSize: tumbler.currentIndex === index ? 20 : 14;// 根据是否当前选中item调整字体大小
                color: tumbler.currentIndex === index ? "lightblue" : "white";// 根据是否当前选中item调整字体颜色
            }
        }


        // 当前选中项更改事件
        onCurrentIndexChanged: {
            fontSelector.curSelectedFont = tumbler.model.get(tumbler.currentIndex).realData;
            fontSelector.fontSelectChanged(fontSelector.curSelectedFont);//向外发信号
            //console.log(fontSelector.curSelectedFont);
            //console.log(tumbler.model.get(tumbler.currentIndex).realData)
            //console.log(tumbler.model.get(tumbler.currentIndex).displayData)
            //console.log(tumbler.model.get(tumbler.currentIndex).index)
        }

        // 根据字体名称设置当前选中的item,遍历Model,数据对比
        function changeIndexByFont(fontName){
            for(var i = 0; i < tumbler.model.count; ++i){
                if(tumbler.model.get(i).realData === fontName){
                    tumbler.currentIndex = i;
                    break;
                }
            }
        }
    }

    ListModel{
        id:fontListModel;
        ListElement{
            index:0
            realData:"SimHei"
            displayData:qsTr("黑体")
        }
        ListElement{
            index:1
            realData:"STFangsong"
            displayData:qsTr("华文仿宋")
        }
        ListElement{
            index:2
            realData:"STXihei"
            displayData:qsTr("华文细黑")
        }
        ListElement{
            index:3
            realData:"STXingkai"
            displayData:qsTr("华文行楷")
        }
        ListElement{
            index:4
            realData:"STXinwei"
            displayData:qsTr("华文新魏")
        }
        ListElement{
            index:5
            realData:"STLiti"
            displayData:qsTr("华文隶书")
        }
        ListElement{
            index:6
            realData:"STKaiti"
            displayData:qsTr("华文楷体")
        }
        ListElement{
            index:7
            realData:"STHupo"
            displayData:qsTr("华文琥珀")
        }
        ListElement{
            index:8
            realData:"STCaiyun"
            displayData:qsTr("华文彩云")
        }
        ListElement{
            index:9
            realData:"microsoft yahei"
            displayData:qsTr("微软雅黑")
        }
    }

}

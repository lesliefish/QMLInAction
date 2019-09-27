import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Window {
    visible: true
    width: Screen.width-100;
    height: Screen.height-100;
    title: qsTr("Grid View 使用");
    color: "#111111";

    Component {
        id: highlightBar
        Rectangle {
            width: gridView.cellWidth;
            height: gridView.cellHeight
            color: "red";
            radius: 5;
            x: gridView.currentItem.x;
            y: gridView.currentItem.y;
            opacity: 0.3;
            Behavior on x {
                NumberAnimation { duration: 400 }
            }
            Behavior on y {
                NumberAnimation { duration: 400 }
            }
        }
    }

    GridView {
        id:gridView;
        cellWidth: width/4;
        cellHeight: cellWidth*0.618;
        anchors.fill: parent;
        highlight: highlightBar;
        highlightFollowsCurrentItem: false
        focus: true;

        property var pictures: ["Chrysanthemum", "Desert", "Hydrangeas", "Jellyfish", "Koala", "Lighthouse", "Penguins", "Tulips"];

        ListModel {
            id:listModel;
        }

        model: listModel;
        delegate: ItemDelegate {}

        // 添加一个
        function addOne() {
            var json = {};
            var name = pictures[Math.round(Math.random()*10)%7];
            json['isChecked'] = false;
            json['name'] = name;
            json['imagePath'] = "file:///C:/Users/Public/Pictures/Sample Pictures/" + name + ".jpg";
            gridView.model.append(json);
        }

        // 删除选中
        function deleteSelected() {
            for( var i = 0;i < listModel.count; i++ ) {
                var model = listModel.get(i);
                if(model.isChecked){
                    listModel.remove(i);
                    i-=1;
                }
            }
        }

        // 选中全部
        function selectAll() {
            for( var i = 0;i < listModel.count; i++ ) {
                var model = listModel.get(i);
                    model.isChecked=true;
            }
        }
    }


    Rectangle {
        id:operateTool;
        width: parent.width;
        height: parent.height/20;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        color: "black";
        opacity: 0.7;
        Rectangle {
            anchors.fill: parent;
            height: operateTool.height;
            color: "transparent";
            Row {
                MyButton{
                    id:addBtn;
                    width: operateTool.width/3;
                    height: operateTool.height;
                    text: qsTr("添加一个");

                    Component.onCompleted: {
                        addBtn.signalClicked.connect(gridView.addOne);
                    }
                }

                Rectangle {
                    anchors.top: parent.top;
                    anchors.topMargin: operateTool.height/4;
                    height: operateTool.height/2;
                    radius: width/2;
                    width: 2;
                    opacity: 0.5;
                }

                MyButton{
                    id:deleteBtn;
                    width: operateTool.width/3;
                    height: operateTool.height;
                    text: qsTr("删除选中");
                    Component.onCompleted: {
                        deleteBtn.signalClicked.connect(gridView.deleteSelected);
                    }
                }

                Rectangle {
                    anchors.top: parent.top;
                    anchors.topMargin: operateTool.height/4;
                    height: operateTool.height/2;
                    radius: width/2;
                    width: 2;
                    opacity: 0.5;
                }

                MyButton{
                    id:selectAllBtn;
                    width: operateTool.width/3;
                    height: operateTool.height;
                    text: qsTr("全选");
                    Component.onCompleted: {
                        selectAllBtn.signalClicked.connect(gridView.selectAll);
                    }
                }
            }
        }
    }
}

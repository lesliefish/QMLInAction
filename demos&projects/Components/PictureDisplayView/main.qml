import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: Screen.width-100
    height: Screen.height-100;
    title: qsTr("列表展示");
    color: "black";

    MouseArea {
        anchors.fill: parent;
        onDoubleClicked : {
            Qt.quit();
        }
    }

    Rectangle {
        color: "transparent";
        anchors.top: parent.top;
        anchors.right: parent.right;
        anchors.rightMargin: 20;
        width: parent.width / 5;
        height: parent.height;

        property var pictures: ["Chrysanthemum", "Desert", "Hydrangeas", "Jellyfish", "Koala", "Lighthouse", "Penguins", "Tulips"];

        GridView {
            id:gridView;
            cellWidth:parent.width;
            cellHeight: parent.height/4;
            anchors.fill:parent;
            highlightFollowsCurrentItem: false
            model: ListModel{}
            delegate: ItemDelegate{}

            Component.onCompleted: {
                for(var i = 0; i < 20; i++){
                    var json = {};
                    var name = parent.pictures[Math.round(Math.random()*10)%7];
                    json['isChecked'] = false;
                    json['name'] = name;
                    json['imagePath'] = "file:///C:/Users/Public/Pictures/Sample Pictures/" + name + ".jpg";
                    gridView.model.append(json);
                }
            }
        }

    }
}

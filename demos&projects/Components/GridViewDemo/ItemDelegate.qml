import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Item {
    id:wrapper;

    Rectangle {
        id:itemRect;
        color:"transparent";
        width: gridView.cellWidth;
        height: gridView.cellHeight;
        //border.color: "darkgreen";
        //border.width: 1;

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                wrapper.GridView.view.currentIndex=index;
            }
        }

        Image {
            id:imageItem;
            source: imagePath;
            anchors.top:parent.top;
            anchors.topMargin: parent.height*1/10;
            width: parent.width*3/4;
            height: parent.height*2/3;
            anchors.horizontalCenter: parent.horizontalCenter;
            //fillMode: Image.PreserveAspectFit;
        }

        Text {
            id : textItem;
            width: parent.width;
            anchors.top : imageItem.bottom;
            anchors.topMargin: parent.height*1/20;
            text: name;
            color: "#888888";
            font.family: "microsoft yahei";
            horizontalAlignment: Text.AlignHCenter;
            font.pixelSize: 18;
        }

        Rectangle {
            anchors.top : textItem.bottom;
            anchors.topMargin: parent.height*1/20;
            anchors.horizontalCenter: parent.horizontalCenter;
            color: "lightgreen";
            height : 1;
            opacity: 0.3;
            width: imageItem.width;
        }

        CheckBox {
            id:checkBox
            checked: isChecked;
            anchors.right:itemRect.right;
            anchors.rightMargin: parent.height*1/10/2;
            anchors.top:imageItem.top;
            anchors.topMargin: -parent.height*1/10/2;
            style: CheckBoxStyle {
                indicator: Rectangle {
                    implicitWidth: 32
                    implicitHeight: 32
                    radius: implicitWidth/2;
                    color: "transparent";
                    border.color: control.activeFocus ? "darkblue" : "gray"
                    border.width: 1
                    Rectangle {
                        visible: isChecked;
                        color: "red";
                        border.color: "#333";
                        radius: parent.width/2;
                        anchors.margins: 4;
                        anchors.fill: parent;
                    }
                }
            }

            onClicked: {
                isChecked = checkBox.checked;
            }
        }
    }
}

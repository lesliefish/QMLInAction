import QtQuick 2.0

Item {
    id:buttonItem;
    property string text: "";
    signal signalClicked();
    Rectangle {
        anchors.fill: parent;
        color: "transparent";
        MouseArea {
            anchors.fill: parent;
            onClicked: {
                buttonItem.signalClicked(); // 点击事件传上去
            }

            onPressed: {
                parent.color = "darkred";
            }

            onReleased: {
                parent.color = "transparent";
            }
        }

        Text {
            id: addOne;
            text: buttonItem.text;
            anchors.centerIn : parent;
            color: "white";
            font.family: "microsoft yahei";
            font.pointSize: 18;
        }
    }
}

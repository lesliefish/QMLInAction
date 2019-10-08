import QtQuick 2.9

Item {
    id:myButtonItem;
    width: 150;
    height: 32;
    property string text: "";

    signal signalClicked();

    Rectangle {
        id:rect;
        anchors.fill: parent;
        color: "green";
        radius: 5;

        Text {
            id: text
            anchors.centerIn: parent;
            color : "white";
            font.family: "microsoft yahei";
            font.pointSize: 14;
            text: myButtonItem.text;
            horizontalAlignment:Text.AlignHCenter;
            verticalAlignment:Text.AlignHCenter;
        }

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                myButtonItem.signalClicked();
            }

            onPressed: {
                rect.color = "red";
                console.log("aa");
            }

            onReleased: {
                rect.color = "green";
            }
        }
    }
}

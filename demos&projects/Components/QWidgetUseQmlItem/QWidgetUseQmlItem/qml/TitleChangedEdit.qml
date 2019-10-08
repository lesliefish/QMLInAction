import QtQuick 2.9

Item {
    id:titleChangedEdit;
    height: 32;
    width: 310;
    signal titleChanged(string newTitle);

    Rectangle {
        border.color: "black";
        border.width: 1;
        anchors.fill: parent;
        color: "transparent";
        radius: 5;
        TextInput {
            anchors.fill: parent;
            text: "Edit to modify window title";
            color : "black";
            font.family: "microsoft yahei";
            font.pointSize: 11;
            selectByMouse: true;
            padding : 5;
            horizontalAlignment:Text.AlignHCenter;
            verticalAlignment:Text.AlignHCenter;

            onTextChanged: {
                titleChangedEdit.titleChanged(text);
            }
        }
    }
}

import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("EditControlBorder");
    color: "black"

    TextEdit {
        id:textControl
        scale: parent.scale;
        anchors.centerIn: parent
        text: "I have a pen";
        font.family: "STXingKai";
        color: "white";
        font.pointSize: 36;
        selectByMouse: true;
        selectedTextColor: "green";
        selectionColor: "lightblue";
        padding: 10;


        PinchArea{
            anchors.fill: parent;
            pinch.target: textControl;
            pinch.maximumScale: 20;
            pinch.minimumScale: 0.2;
            pinch.minimumRotation: -180;
            pinch.maximumRotation: 180;
        }

        EditControlBorder{
            anchors.fill: textControl;
            z:-1
        }
    }
}

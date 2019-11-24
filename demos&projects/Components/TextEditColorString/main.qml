import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id:rect;
        anchors.fill: parent;
        color: "#FFFFFF";
    }

    Component.onCompleted: {
        console.log(rect.color);

        var json = {};
        json["color"] = rect.color;
        json["strColor"] = String(rect.color);

        console.log(JSON.stringify(json, null, 4));
    }
}

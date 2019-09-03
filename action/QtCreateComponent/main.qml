import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt Create Component")

    Rectangle {
        id : rootItem
        anchors.fill: parent
        color: "white"
        property int colorPickerCount: 0
        property Component colorPickerComponent: null

        Text {
            id: displayText
            text: qsTr("Here is the text")
            anchors.centerIn: parent
            font.pixelSize: 30
            font.family: "microsoft yahei"
        }

        function changeTextColor(clr) {
            displayText.color = clr
        }

        function createColorPicker(clr) {
            if(rootItem.colorPickerComponent == null){
                rootItem.colorPickerComponent = Qt.createComponent("ColorPicker.qml")
            }

            var colorPicker;
            if(rootItem.colorPickerComponent.status == Component.Ready) {
                colorPicker = rootItem.colorPickerComponent.createObject(rootItem, { "color" : clr, "x":rootItem.colorPickerCount*155, "y":10})
                colorPicker.signalColorPicked.connect(rootItem.changeTextColor)
            }

            rootItem.colorPickerCount++
        }

        Button {
            text: "Add"
            anchors.bottom: rootItem.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: rootItem.horizontalCenter

            onClicked: {
                rootItem.createColorPicker(Qt.rgba(Math.random(), Math.random(), Math.random(),1))
            }
        }
    }


}

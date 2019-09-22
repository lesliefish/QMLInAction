import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id:mainWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("ColorSelector")


    Rectangle{
        anchors.fill: parent;
        ColorSelector{
            id:colorSelector
        }

        Connections{
            target: colorSelector;
            onColorChanged:{
                mainWindow.title = "current color is " + newColor;
            }
        }
    }
}

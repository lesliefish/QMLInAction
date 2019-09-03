import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Dynamic Component")

    Rectangle {
        id:rootItem
        anchors.fill: parent
        color: "#EEEEEE"
        property bool isColorPickerShow : false
        Text {
            id: coloredText
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            text: qsTr("Here is the text")
            font.pointSize: 32
        }

        Button {
            id : ctrlButton
            text : "Show"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 10

            onClicked: {
                if(rootItem.isColorPickerShow){
                    redLoader.source = ""
                    blueLoader.source = ""
                    rootItem.isColorPickerShow = false
                    ctrlButton.text = "Show"
                }else{
                    redLoader.source = "ColorPicker.qml"
                    //redLoader.item.signalColorPicked.connect(onPickedRed)
                    blueLoader.source = "ColorPicker.qml"
                    //blueLoader.item.signalColorPicked.connect(onPickedBlue)
                    redLoader.focus = true
                    rootItem.isColorPickerShow = true
                    ctrlButton.text = "Hide"
                }
            }
        }


        Loader {
            id : redLoader
            anchors.bottom: ctrlButton.top
            anchors.bottomMargin: 20
            anchors.left: ctrlButton.left

            onLoaded: {
                if(item != null){
                    item.color = "red"
                    item.focus = true
                }
            }

            onFocusChanged: {
                if(item != null) {
                    item.focus = focus
                }
            }
        }

        Loader {
            id : blueLoader
            anchors.left : redLoader.right
            anchors.leftMargin: 20
            anchors.bottom: ctrlButton.top
            anchors.bottomMargin: 20

            onLoaded: {
                if(item != null){
                    item.color = "blue"
                    item.focus = true
                }
            }

            onFocusChanged: {
                if(item != null) {
                    item.focus = focus
                }
            }
        }

        Connections {
            target: redLoader.item
            onSignalColorPicked:{
                coloredText.color = clr
                if(!redLoader.focus) {
                    redLoader.focus = true
                    blueLoader.focus = false
                }
            }
        }

        Connections {
            target: blueLoader.item
            onSignalColorPicked:{
                coloredText.color = clr
                if(!blueLoader.focus) {
                    blueLoader.focus = true
                    redLoader.focus = false
                }
            }
        }
    }
}

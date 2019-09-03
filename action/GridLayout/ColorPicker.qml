import QtQuick 2.9

Rectangle {
    id : colorPicker
    width: 150
    height : 80

    signal signalColorPicked(color clr)

    function configueBorder() {
        colorPicker.border.width = colorPicker.focus ? 2 : 0
        colorPicker.border.color = colorPicker.focus ? "yellow" : "grey"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            colorPicker.signalColorPicked(colorPicker.color)
            mouse.accepted = true
            colorPicker.focus = true
        }
    }

    Keys.onReturnPressed: {
        colorPicker.signalColorPicked(colorPicker.color)
        event.acceped = true
    }

    Keys.onSpacePressed: {
        colorPicker.signalColorPicked(colorPicker.color)
        event.acceped = true
    }

    onFocusChanged: {
        configueBorder()
    }

    Component.onCompleted: {
        configueBorder()
    }
}

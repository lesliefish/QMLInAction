import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
      id : rect
      color : "white"
      anchors.fill: parent
    }

    Canvas {
        id: canvas
        parent: rect
        z:1
        anchors.left : rect.left
        width: rect.width/2
        height: rect.height
        renderStrategy: Canvas.Threaded
        property real lastX
        property real lastY
        property color color: "green"

        onPaint: {
            var ctx = getContext('2d')
            ctx.lineWidth = 5
            ctx.strokeStyle = canvas.color
            ctx.beginPath()
            ctx.moveTo(lastX, lastY)
            lastX = area.mouseX
            lastY = area.mouseY
            ctx.lineTo(lastX, lastY)
            ctx.stroke()
        }
        MouseArea {
            id: area
            anchors.fill: parent
            onPressed: {
                canvas.lastX = mouseX
                canvas.lastY = mouseY
                console.log(canvas.lastX)
            }
            onPositionChanged: {
                canvas.requestPaint()
            }
        }
    }
}

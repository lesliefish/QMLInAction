import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("TabView")
    Component.onCompleted:  {
        showFullScreen()
    }

    Rectangle {
        id : rootItem
        anchors.fill: parent
        color: "darkred"

        Component {
            id:tabContent
            Rectangle {
                anchors.fill: parent
                color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
            }
        }

        Component.onCompleted:  {
            tabView.addTab("Tab " + (tabView.count + 1), tabContent)
            tabView.addTab("Tab " + (tabView.count + 1), tabContent)
        }

        TabView {
            id : tabView
            anchors.top : parent.top
            anchors.topMargin: 80
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 8
            anchors.bottomMargin: 8
            anchors.right: parent.right
            anchors.rightMargin: 8

            style: TabViewStyle {
                frameOverlap: 1 //
                tab: Rectangle {
                    color: styleData.selected ? "black" :"#222222"
                    implicitWidth: 200
                    implicitHeight: 40
                    radius: 2
                    Text {
                        id: text
                        anchors.margins: 8
                        anchors.centerIn: parent
                        text: styleData.title
                        color: styleData.selected ? "lightblue" : "white"
                        font.family: "microsoft yahei"
                        font.pixelSize: 24
                        font.bold: styleData.selected
                    }
                }
            }
        }

        Button {
            id : editButton
            height: 30
            anchors.left: tabView.left
            anchors.leftMargin: 410
            anchors.top: tabView.top
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 25
                    radius: 4
                    color: "darkred"
                }

                label:Label {
                    text: "Edit"
                    font.pixelSize: 22
                    font.family: "microsoft yahei"
                    font.bold: control.hovered
                    color: control.pressed ? "white" : "yellow"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment:Text.AlignVCenter
                }
            }

            onClicked: {
                console.log("clicked")
            }
        }
    }
}

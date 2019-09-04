import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 500
    title: qsTr("List View")

    Button {
        id : addButon
        anchors.right: parent.right
        anchors.top:parent.top
        text: "Add"
        z:1
        property bool bAdd : true
        onClicked: {
            if(bAdd){
                listView.model.append({
                                          "name":"华为",
                                          "cost":"3333",
                                          "manufacturer":"HuaWei"
                                      })
                bAdd = false
            }
            else
            {
                listView.model.remove(0,1)
                bAdd = true
            }

        }

    }

    ListView {
        id : listView
        anchors.fill: parent
        delegate: phoneDelegate

        add : Transition {
            ParallelAnimation {
                NumberAnimation {
                    property : "opacity"
                    from : 0
                    to : 1
                    duration: 500
                }

                NumberAnimation {
                    property: "y"
                    from : 0
                    duration: 200
                }
            }
        }

        addDisplaced: Transition {
            NumberAnimation { properties: "x,y"; duration: 1000 }
        }

//        populate: Transition {
//            NumberAnimation { properties: "opacity"; from:0; to:1; duration: 1000 }
//        }

        remove: Transition {
            ParallelAnimation {
                NumberAnimation { property: "opacity"; to: 0; duration: 1000 }
                NumberAnimation { properties: "x,y"; to: 100; duration: 1000 }
            }
        }

        model : ListModel {
            id : listModel
            ListElement {
                name:"iphone"
                cost:"1000"
                manufacturer:"Apple"
            }
            ListElement {
                name:"iphone2"
                cost:"2000"
                manufacturer:"Apple"
            }
        }

        focus: true
        highlight: Rectangle {
            color : "lightblue"
        }
    }



    Component {
        id : phoneDelegate
        Item {
            id:wrapperItem
            height: 48
            width:parent.width

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    wrapperItem.ListView.view.currentIndex = index
                }
            }

            RowLayout  {
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                spacing: 2

                Text {
                    id: coll
                    text: name
                    color: wrapperItem.ListView.isCurrentItem ? "green" : "black"
                    Layout.preferredWidth: 120
                    font.family: "microsoft yahei"
                    font.pixelSize: wrapperItem.ListView.isCurrentItem ? 18 : 12
                }

                Text {
                    text: cost
                    color: wrapperItem.ListView.isCurrentItem ? "green" : "black"
                    Layout.preferredWidth: 120
                    font.family: "microsoft yahei"
                    font.pixelSize: wrapperItem.ListView.isCurrentItem ? 18 : 12
                }

                Text {
                    text: manufacturer
                    color: wrapperItem.ListView.isCurrentItem ? "green" : "black"
                    Layout.preferredWidth: 120
                    font.family: "microsoft yahei"
                    font.pixelSize: wrapperItem.ListView.isCurrentItem ? 18 : 12
                }
            }
        }
    }
}

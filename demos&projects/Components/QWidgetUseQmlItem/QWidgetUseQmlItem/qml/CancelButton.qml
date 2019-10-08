import QtQuick 2.9

Item {
    id:baseItem;
    signal clicked();

    MyButton {
        id : cancelButton;
        text: "Cancel";
    }

    Connections {
        target: cancelButton;
        onSignalClicked : {
            baseItem.clicked();
        }
    }
}

import QtQuick 2.14
import QtQuick.Window 2.12

Item {
    id: menuId
    height: 40
    width: 815

    Rectangle {
        id: menuBase
        height: 40
        radius: 3
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0; color: "#1e2d4b"}
            GradientStop { position: 1; color: "#323e70"}
        }
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left


        Text {
            id: handlerText
            color: "#ffffff"
            text: qsTr("MENU__ITEM")
            anchors.top: parent.top
            anchors.left: menuBase.right; anchors.leftMargin: 14
            anchors.bottom: parent.bottom
            font.family: "Roboto"
            verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }
    }
}

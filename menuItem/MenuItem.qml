import QtQuick 2.14
import QtQuick.Window 2.12

import "buttons" as Buttons

Item {
    id: menuId
    height: 96
    width: 815

    Rectangle {
        id: menuBase
        anchors.fill: parent

        radius: 3
        border.color: "green"
        border.width: 2

        Row{
            id: menuRow
            Buttons.SearchButton{
                id: searchHddButton
                anchors.top: parent.top; anchors.topMargin: 24
                anchors.left: parent.left; anchors.leftMargin: 24
            }
        }
    }
}

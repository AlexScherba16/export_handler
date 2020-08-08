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
            leftPadding: 24
            Buttons.SearchButton{
                id: searchHddButton
                anchors.top: menuRow.top; anchors.topMargin: 24

                onSearchHdd: {
                    if(cppBackend == null){
                        console.error("[MenuItem] cppBackend == null")
                        return;
                    }

                    console.log("[MenuItem] invoke hdd searching")
                    cppBackend.searchConnectedDevises()
                }
            }
        }
    }
}

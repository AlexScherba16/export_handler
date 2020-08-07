import QtQuick 2.15
import QtQuick.Window 2.12

import "handlerItem" as WindowHandler
import "menuItem" as WindowMenu


Window {
    id: window
    visible: true
    width: 815
    minimumWidth: 400
    height: 400

    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint |
           Qt.WindowMinimizeButtonHint |
           Qt.Window

    property int previousX
    property int previousY

    Column{
        WindowHandler.HandlerItem{
            id: windowHandlerId
            width: window.width
        }

        WindowMenu.MenuItem{
            id: windowMenuId
            width: window.width

        }
    }



    // resize handler
    MouseArea {
        id: rightSide
        width: 5
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        cursorShape: Qt.SizeHorCursor
        onPressed: previousX = mouseX
        onMouseXChanged: {
            var dx = mouseX - previousX
            window.setWidth(parent.width + dx)
        }
    }

    MouseArea {
        height: 5
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        cursorShape: Qt.SizeVerCursor
        onPressed: previousY = mouseY
        onMouseYChanged: {
            var dy = mouseY - previousY
            window.setY(window.y + dy)
            window.setHeight(window.height - dy)
        }
    }
}


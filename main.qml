import QtQuick 2.14
import QtQuick.Window 2.12

import io.ics.backend 1.0

import "handlerItem" as WindowHandler
import "menuItem" as WindowMenu


Window {
    id: window
    visible: true
    width: 815
    minimumWidth: 400
    minimumHeight: 400
    height: 400

    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint |
           Qt.WindowMinimizeButtonHint |
           Qt.Window

    property int previousX
    property int previousY

    Column{
        id: column
        WindowHandler.HandlerItem{
            id: windowHandlerId
            width: window.width
        }

        WindowMenu.MenuItem{
            id: windowMenuId
            width: window.width
        }
    }

    Backend{
        id: cppBackend
        onHddsChanged: {
            console.log("[window] onHddsChanged", cppBackend.hdds)
            enableChildItems(true)
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
            var neWidth = parent.width + mouseX - previousX
            if (neWidth <= window.minimumWidth)
                neWidth = window.minimumWidth
            window.setWidth(neWidth)
        }
    }

    MouseArea {
        id: leftSide
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
            var newHeigh = window.height - dy
            if(newHeigh <= window.minimumHeight)
                 newHeigh = window.minimumHeight
            window.setHeight(newHeigh)
        }
    }
    function enableChildItems(itemsState){
        windowHandlerId.enabled = itemsState
    }
}


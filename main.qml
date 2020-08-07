import QtQuick 2.15
import QtQuick.Window 2.12

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

    Rectangle {
        id: handlerId
        height: 40
        radius: 3
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0; color: "#1e2d4b"}
            GradientStop { position: 1; color: "#323e70"}
        }
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left

        Image {
            id: handlerImage
            x: 25; y: 5; width: 30
            anchors.top: parent.top; anchors.topMargin: 5
            anchors.bottom: parent.bottom; anchors.bottomMargin: 5
            anchors.left: parent.left; anchors.leftMargin: 25
            fillMode: Image.PreserveAspectFit
            source: "logo.png"

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: handlerImage.source = "logo_hover.png"
                onExited: handlerImage.source = "logo.png"
            }
        }

        Text {
            id: handlerText
            color: "#ffffff"
            text: qsTr("TEST_VIDEO_EXPORT")
            anchors.top: parent.top
            anchors.left: handlerImage.right; anchors.leftMargin: 14
            anchors.bottom: parent.bottom
            font.family: "Roboto"
            verticalAlignment: Text.AlignVCenter; horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 16
        }

        Image {
            id: minimizeImage
            x: 775; y: 5; width: 30
            anchors.top: parent.top;  anchors.topMargin: 5
            anchors.bottom: parent.bottom; anchors.bottomMargin: 5
            anchors.right: maximizeImage.left; anchors.rightMargin: 10

            source: "minimize.png"
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 300; sourceSize.width: 300

            MouseArea {
                anchors.fill: parent; hoverEnabled: true
                onEntered: minimizeImage.source = "minimize_hover.png"
                onExited: minimizeImage.source = "minimize.png"
                onClicked: window.showMinimized()
            }
        }

        Image {
            id: maximizeImage
            x: 775; y: 5; width: 30
            anchors.top: parent.top; anchors.topMargin: 5
            anchors.bottom: parent.bottom; anchors.bottomMargin: 5
            anchors.right: exitImage.left; anchors.rightMargin: 10

            source: "maximize.png"
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 300; sourceSize.width: 300

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: maximizeImage.source = "maximize_hover.png"
                onExited: maximizeImage.source = "maximize.png"
                onClicked: window.showMaximized()
            }
        }

        Image {
            id: exitImage
            width: 30
            anchors.top: parent.top; anchors.topMargin: 5
            anchors.bottom: parent.bottom; anchors.bottomMargin: 5
            anchors.right: parent.right; anchors.rightMargin: 10
            sourceSize.height: 300; sourceSize.width: 300
            fillMode: Image.PreserveAspectFit
            source: "exit.png"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: exitImage.source = "exit_hover.png"
                onExited: exitImage.source = "exit.png"
                onClicked: Qt.quit()
            }
        }


        MouseArea {
            z: -1
            anchors.fill: parent

            onPressed: {
                previousX = mouseX
                previousY = mouseY
            }

            onMouseXChanged: {
                var dx = mouseX - previousX
                window.setX(window.x + dx)
            }

            onMouseYChanged: {
                var dy = mouseY - previousY
                window.setY(window.y + dy)
            }

            onDoubleClicked: {
                switch(window.visibility){
                    case Window.Windowed: window.showMaximized(); break;
                    case Window.Maximized: window.showNormal(); break;
                }
            }
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

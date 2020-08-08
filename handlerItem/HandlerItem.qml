import QtQuick 2.14
import QtQuick.Window 2.12

Item {
    id: handlerId
    height: 40
    width: 815

    signal moveTo(int xPosition, int yPosition)
    signal setMax()
    signal setMin()
    signal close()

    Rectangle {
        id: handlerBase
        radius: 3
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0; color: "#1e2d4b"}
            GradientStop { position: 1; color: "#323e70"}
        }

        Image {
            id: handlerImage
            x: 25; y: 5; width: 30
            anchors.top: parent.top; anchors.topMargin: 5
            anchors.bottom: parent.bottom; anchors.bottomMargin: 5
            anchors.left: parent.left; anchors.leftMargin: 25
            fillMode: Image.PreserveAspectFit
            source: "../images/logo.png"

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: handlerImage.source = "../images/logo_hover.png"
                onExited: handlerImage.source = "../images/logo.png"
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

            source: "../images/minimize.png"
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 300; sourceSize.width: 300

            MouseArea {
                anchors.fill: parent; hoverEnabled: true
                onEntered: minimizeImage.source = "../images/minimize_hover.png"
                onExited: minimizeImage.source = "../images/minimize.png"
                onClicked: window.showMinimized()
            }
        }

        Image {
            id: maximizeImage
            x: 775; y: 5; width: 30
            anchors.top: parent.top; anchors.topMargin: 5
            anchors.bottom: parent.bottom; anchors.bottomMargin: 5
            anchors.right: exitImage.left; anchors.rightMargin: 10

            source: "../images/maximize.png"
            fillMode: Image.PreserveAspectFit
            sourceSize.height: 300; sourceSize.width: 300

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: maximizeImage.source = "../images/maximize_hover.png"
                onExited: maximizeImage.source = "../images/maximize.png"
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
            source: "../images/exit.png"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: exitImage.source = "../images/exit_hover.png"
                onExited: exitImage.source = "../images/exit.png"
                onClicked: Qt.quit()
            }
        }

        MouseArea {
            id: handlerMouseArea
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

}

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12


Button{
    id: searchButton
    implicitWidth: 96
    implicitHeight: 48

    signal searchHdd()

    background:Rectangle {
        anchors.fill: searchButton
        radius: 3
        color: "#FFFFFF"

        RectangularGlow {
            id: effect
            anchors.fill: parent
            glowRadius: 1
            spread: 0.2
            color: "black"
            cornerRadius: parent.radius + glowRadius
            z: -1
        }

        Text{
            id: buttonLabel
            font.family: "Roboto"
            font.styleName: "normal"
            font.weight: Font.Normal
            font.pixelSize: 12

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "Поиск hdd"
            color: "#17181B"
        }

        MouseArea{
            id: buttonMouseArea
            anchors.fill: parent
            hoverEnabled: true

            onPressed: {
                buttonLabel.font.weight = Font.Normal
                parent.border.color = "black"
                parent.border.width = 1
            }
            onEntered: buttonLabel.font.weight = Font.Bold
            onExited: buttonLabel.font.weight = Font.Normal

            onReleased: {
                buttonLabel.font.weight = buttonMouseArea.containsMouse ? Font.Bold :
                                                                          Font.Normal
                parent.border.width = 0
                searchButton.searchHdd()
            }
        }
    }
}

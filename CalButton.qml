import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    property var btnTxt: ""
    Layout.alignment: Qt.AlignCenter
    Layout.preferredWidth: parent.width/4
    Layout.preferredHeight: parent.height
    border.width: 1
    border.color: "gray"
    color: "#EEEEEE"

    Text {
        anchors.centerIn: parent
        text: btnTxt
    }

    MouseArea {
        anchors.fill: parent
        onClicked: value_input(btnTxt)
    }
}

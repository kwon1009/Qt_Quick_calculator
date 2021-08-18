import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "."

Window {
    property string calLine: "";

    width: 210
    height: 310
    visible: true
    title: qsTr("Calculator")

    // signal
    signal sg_history();
    signal sg_calculate(string calLine);

    // slot
    function slot_get_history(history) {
        calLine = history;
    }
    function slot_display(result) {
        calLine = result;
    }

    // function
    function value_input(str) { calLine += str; }
    function value_clear() { calLine = ""; }
    function value_back() { calLine = calLine.substring(0, calLine.length-1); }

    // display
    Rectangle {
        id: display
        width: 190
        height: 40
        x: 10
        y: 10
        border.color: "gray"
        border.width: 1

        Text {
            anchors.centerIn: parent
            text: calLine
        }
    }

    // buttons
    Rectangle {
        id: btns
        x: 10
        y: 60
        width: parent.width-35
        height: parent.height-70

        // column layout
        ColumnLayout {
            anchors.fill: parent
            spacing: 5

            // first row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                Rectangle {
                    id: btn_ac
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#FFAA99"

                    Text {
                        anchors.centerIn: parent
                        text: "AC"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_clear()
                        }
                    }
                }

                Rectangle {
                    id: btn_history
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "H"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sg_history()
                        }
                    }
                }

                // operators
                Rectangle {
                    id: btn_equal
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "="
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            sg_calculate(calLine)
                        }
                    }
                }

                Rectangle {
                    id: btn_back
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#FFFAA6"

                    Text {
                        anchors.centerIn: parent
                        text: "BK"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_back()
                        }
                    }
                }
            }

            // second row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                // numbers
                Rectangle {
                    id: btn_1
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "1"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("1")
                        }
                    }
                }

                Rectangle {
                    id: btn_2
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "2"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("2")
                        }
                    }
                }

                Rectangle {
                    id: btn_3
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "3"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("3")
                        }
                    }
                }

                Rectangle {
                    id: btn_add
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "+"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("+")
                        }
                    }
                }
            }

            // third row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                Rectangle {
                    id: btn_4
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "4"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("4")
                        }
                    }
                }

                Rectangle {
                    id: btn_5
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "5"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("5")
                        }
                    }
                }

                Rectangle {
                    id: btn_6
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "6"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("6")
                        }
                    }
                }

                Rectangle {
                    id: btn_sub
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "-"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("-")
                        }
                    }
                }
            }

            // fourth row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                Rectangle {
                    id: btn_7
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "7"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("7")
                        }
                    }
                }

                Rectangle {
                    id: btn_8
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "8"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("8")
                        }
                    }
                }

                Rectangle {
                    id: btn_9
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "9"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("9")
                        }
                    }
                }

                Rectangle {
                    id: btn_mul
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "*"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("*")
                        }
                    }
                }
            }

            // fifth row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                Rectangle {
                    id: btn_0
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/2+4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "0"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("0")
                        }
                    }
                }

                Rectangle {
                    id: btn_dot
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "."
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input(".")
                        }
                    }
                }

                Rectangle {
                    id: btn_div
                    Layout.alignment: Qt.AlignCenter
                    Layout.preferredWidth: parent.width/4
                    Layout.preferredHeight: parent.height
                    border.width: 1
                    border.color: "gray"
                    color: "#EEEEEE"

                    Text {
                        anchors.centerIn: parent
                        text: "/"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            value_input("/")
                        }
                    }
                }
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

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

        // functions
        Rectangle {
            id: btn_ac
            width: 40
            height: 40
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
            id: btn_back
            width: 40
            height: 40
            color: "#FFFAA6"
            anchors.left: btn_equal.right
            anchors.leftMargin: 10

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

        Rectangle {
            id: btn_history
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.left: btn_ac.right
            anchors.leftMargin: 10

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
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.left: btn_history.right
            anchors.leftMargin: 10

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
            id: btn_add
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.left: btn_3.right
            anchors.leftMargin: 10
            anchors.top: btn_back.bottom
            anchors.topMargin: 10

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

        Rectangle {
            id: btn_sub
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.left: btn_3.right
            anchors.leftMargin: 10
            anchors.top: btn_add.bottom
            anchors.topMargin: 10

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

        Rectangle {
            id: btn_mul
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.left: btn_3.right
            anchors.leftMargin: 10
            anchors.top: btn_sub.bottom
            anchors.topMargin: 10

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

        Rectangle {
            id: btn_div
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.left: btn_3.right
            anchors.leftMargin: 10
            anchors.top: btn_mul.bottom
            anchors.topMargin: 10

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

        // numbers
        Rectangle {
            id: btn_1
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.top: btn_ac.bottom
            anchors.topMargin: 10

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
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.left: btn_1.right
            anchors.leftMargin: 10
            anchors.top: btn_ac.bottom
            anchors.topMargin: 10

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
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.left: btn_2.right
            anchors.leftMargin: 10
            anchors.top: btn_ac.bottom
            anchors.topMargin: 10

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
            id: btn_4
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.top: btn_1.bottom
            anchors.topMargin: 10

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
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.top: btn_1.bottom
            anchors.topMargin: 10
            anchors.left: btn_4.right
            anchors.leftMargin: 10

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
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.top: btn_1.bottom
            anchors.topMargin: 10
            anchors.left: btn_5.right
            anchors.leftMargin: 10

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
            id: btn_7
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.top: btn_4.bottom
            anchors.topMargin: 10

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
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.top: btn_4.bottom
            anchors.topMargin: 10
            anchors.left: btn_7.right
            anchors.leftMargin: 10

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
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.top: btn_4.bottom
            anchors.topMargin: 10
            anchors.left: btn_8.right
            anchors.leftMargin: 10

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
            id: btn_0
            width: 90
            height: 40
            color: "#EEEEEE"
            anchors.top: btn_7.bottom
            anchors.topMargin: 10

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
            width: 40
            height: 40
            color: "#EEEEEE"
            anchors.top: btn_7.bottom
            anchors.topMargin: 10
            anchors.left: btn_0.right
            anchors.leftMargin: 10

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
    }
}

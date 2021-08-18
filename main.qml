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

                CalButton {
                    id: btn_ac
                    color: "#FFAA99"
                    btnTxt: "AC"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_clear()
                    }
                }

                CalButton {
                    id: btn_history
                    btnTxt: "H"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: sg_history()
                    }
                }

                // operators
                CalButton {
                    id: btn_equal
                    btnTxt: "="
                    MouseArea {
                        anchors.fill: parent
                        onClicked: sg_calculate(calLine)
                    }
                }

                CalButton {
                    id: btn_back
                    color: "#FFFAA6"
                    btnTxt: "BK"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_back()
                    }
                }
            }

            // second row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                // numbers
                CalButton {
                    id: btn_1
                    btnTxt: "1"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("1")
                    }
                }

                CalButton {
                    id: btn_2
                    btnTxt: "2"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("2")
                    }
                }

                CalButton {
                    id: btn_3
                    btnTxt: "3"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("3")
                    }
                }

                CalButton {
                    id: btn_add
                    btnTxt: "+"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("+")
                    }
                }
            }

            // third row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                CalButton {
                    id: btn_4
                    btnTxt: "4"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("4")
                    }
                }

                CalButton {
                    id: btn_5
                    btnTxt: "5"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("5")
                    }
                }

                CalButton {
                    id: btn_6
                    btnTxt: "6"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("6")
                    }
                }

                CalButton {
                    id: btn_sub
                    btnTxt: "-"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("-")
                    }
                }
            }

            // fourth row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                CalButton {
                    id: btn_7
                    btnTxt: "7"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("7")
                    }
                }

                CalButton {
                    id: btn_8
                    btnTxt: "8"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("8")
                    }
                }

                CalButton {
                    id: btn_9
                    btnTxt: "9"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("9")
                    }
                }

                CalButton {
                    id: btn_mul
                    btnTxt: "*"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("*")
                    }
                }
            }

            // fifth row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                CalButton {
                    id: btn_0
                    Layout.preferredWidth: parent.width/2+4
                    btnTxt: "0"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("0")
                    }
                }

                CalButton {
                    id: btn_dot
                    btnTxt: "."
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input(".")
                    }
                }

                CalButton {
                    id: btn_div
                    btnTxt: "/"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: value_input("/")
                    }
                }
            }
        }
    }
}

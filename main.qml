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
        width: 190; height: 40
        x: 10; y: 10
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
        x: 10; y: 60
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
                    btnTxt: "AC"; color: "#FFAA99"
                    MouseArea { anchors.fill: parent; onClicked: value_clear() }
                }

                CalButton {
                    btnTxt: "H"
                    MouseArea { anchors.fill: parent; onClicked: sg_history() }
                }

                CalButton {
                    btnTxt: "="
                    MouseArea { anchors.fill: parent; onClicked: sg_calculate(calLine) }
                }

                CalButton {
                    btnTxt: "BK"; color: "#FFFAA6"
                    MouseArea { anchors.fill: parent; onClicked: value_back() }
                }
            }

            // second row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                // numbers
                CalButton { btnTxt: "1" }
                CalButton { btnTxt: "2" }
                CalButton { btnTxt: "3" }
                CalButton { btnTxt: "+" }
            }

            // third row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                CalButton { btnTxt: "4" }
                CalButton { btnTxt: "5" }
                CalButton { btnTxt: "6" }
                CalButton { btnTxt: "-" }
            }

            // fourth row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                CalButton { btnTxt: "7" }
                CalButton { btnTxt: "8" }
                CalButton { btnTxt: "9" }
                CalButton { btnTxt: "*" }
            }

            // fifth row
            RowLayout {
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: parent.height/5
                spacing: 4

                CalButton { btnTxt: "0"; Layout.preferredWidth: parent.width/2+4 }
                CalButton { btnTxt: "." }
                CalButton { btnTxt: "/" }
            }
        }
    }
}

import Quickshell
import QtQuick
import Quickshell.Io

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                top: 10
                left: 10
                right: 10
            }

            implicitHeight: 20

            ClockWidget {
                anchors.centerIn: parent
            }
        }
    }
}

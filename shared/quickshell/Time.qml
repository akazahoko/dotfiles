pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string time

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
        onDateChanged: {
            root.time = Qt.formatDateTime(clock.date, "ddd MMM d hh:mm AP t yyyy")
        }
    }

    Component.onCompleted: {
        root.time = Qt.formatDateTime(clock.date, "ddd MMM d hh:mm AP t yyyy")
    }
}

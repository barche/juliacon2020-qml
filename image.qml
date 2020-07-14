import QtQuick 2.6
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
import org.julialang 1.0

ApplicationWindow {
  title: "My Application"
  width: 520
  height: 570
  visible: true

  ColumnLayout {
    spacing: 6
    anchors.centerIn: parent

    Button {
      Layout.alignment: Qt.AlignCenter
      text: "Push Me"
      onClicked: Julia.showimage(juliaDisplay)
    }

    JuliaDisplay {
      id: juliaDisplay
      width: 512
      height: 512
    }
  }
}

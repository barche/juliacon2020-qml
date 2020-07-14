import QtQuick 2.6
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0

ApplicationWindow {
  visible: true
  onClosing: Qt.quit()

  ColumnLayout {
    Slider {
      value: variables.slidervalue
      onValueChanged: {
        variables.slidervalue = value
      }
    }

    Text {
      text: variables.slidervalue
    }
  }
}

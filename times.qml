import QtQuick 2.6
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
import QtQuick.Window 2.2
import org.julialang 1.0

ApplicationWindow {
  id: appRoot
  title: "Times Problems"
  width: 600
  height: 400
  visible: true

  property double fontSize: 0.35*questionBar.height

  ColumnLayout {
    spacing: 6
    anchors.fill: parent

    RowLayout {
      id: questionBar
      Layout.fillWidth: true
      Layout.alignment: Qt.AlignCenter
      Layout.topMargin: 5
      Layout.preferredHeight: appRoot.height*0.4

      Text {
        id: questionText
        text: problem.prompt
        font.pixelSize: appRoot.fontSize
      }

      TextField {
          id: answer
          Layout.preferredWidth: 0.2*appRoot.width
          Layout.preferredHeight: 0.5*appRoot.height*0.4
          font.pixelSize: appRoot.fontSize
          horizontalAlignment: TextInput.AlignHCenter
          validator: IntValidator {}
          focus: true
          onAccepted: Julia.submit(text)
      }

      Button {
        Layout.preferredWidth: 0.15*appRoot.width
        Layout.preferredHeight: answer.height
        text: "OK"
        onClicked: Julia.submit(answer.text)
        enabled: answer.acceptableInput
      }
    }

    Rectangle {
      id: feedback
      Layout.fillWidth: true
      Layout.fillHeight: true
      color: "white"

      state: problem.statusstring

      ColumnLayout {
        spacing: 6
        anchors.fill: parent
        Text {
          id: statusText
          text: qsTr("Please solve the problem")
          Layout.alignment: Qt.AlignCenter
          font.pixelSize: appRoot.fontSize/2
        }
      }

      states: [
        State {
          name: "Correct!"
          PropertyChanges { target: feedback; color: "green"}
          PropertyChanges {
            target: statusText;
            text: problem.resultstring + qsTr(" is correct, try the next one!")
          }
        },
        State {
          name: "Incorrect!"
          PropertyChanges { target: feedback; color: "red"}
          PropertyChanges {
            target: statusText;
            text: problem.resultstring + qsTr(" is incorrect, please try again.")
          }
        }
      ]
    }
  }

  Connections {
    target: problem
    function onResultstringChanged() { answer.clear(); }
  }
}

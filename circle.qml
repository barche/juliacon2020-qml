import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.0
import org.julialang 1.0
import "qmlplugins"  // for NamedSlider

ApplicationWindow {
	visible: true
	width: 640
	height: 480
	title: qsTr("Julia Display")

	ColumnLayout {
		anchors.fill: parent

		NamedSlider {
			text: "diameter"; from: 50; to: 640; value: 200
			onValueChanged: parameters.diameter = value
		}

		JuliaDisplay {
			id: circleDisplay
			Layout.fillWidth: true
			Layout.fillHeight: true
			Layout.minimumWidth: 100
			Layout.minimumHeight: 100
      onWidthChanged: Julia.paintcircle(width, height, circleDisplay);
      onHeightChanged: Julia.paintcircle(width, height, circleDisplay);
		}
	}

	Connections {
		target: parameters
		function onDiameterChanged() { Julia.paintcircle(circleDisplay.width, circleDisplay.height, circleDisplay); }
	}
}


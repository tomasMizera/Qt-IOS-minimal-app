import QtQuick
import QtQuick.Controls

import my_lib

Window {
  id: root

  width: 640
  height: 480
  visible: true
  title: qsTr("Minimal iOS example app")

  IosInterface {
    id: iosinterface
  }

  Item {
    width: root.width
    height: root.height

    Row {
      anchors.centerIn: parent

      Button {
        text: "Check permissions"

        onClicked: {
          iosinterface.callPermissionsCheck()
        }
      }

      Rectangle {
        color: "white"
        width: 20
        height: 20
      }

      Button {
        text: "Run native service"

        onClicked: {
          console.log( "waaa" )
        }
      }
    }
  }
}


/**
* File Name: ProfileArea.qml
* Author: Nibedit
* Date:   12-08-2017
* Copyright: All rights reserved with Nibedit. No part of this file can be reproduced without permission.
* Client can use the code subject to realization of payments. In case client creates paypal dispute and
* reverses amount paid, he/she will lose the rights to use.
**/

import QtQuick 2.0
import QtQuick.Layouts 1.2
import QtGraphicalEffects 1.0
Item {

    property int imageSize: 100
    RowLayout{
        anchors.fill: parent
        ColumnLayout {
            width:(parent.width-imageSize)/2
            height: imageSize
            anchors.fill: parent
            spacing: 10
            Text {
                text: qsTr("PEER RANKING")
                color: "black"
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
            }
            Rectangle {
                color:"gray"
                width: parent.width
                height: 2
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
            }

            Text {
                text: "78%"
                //anchors.fill: parent
                color: "black"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 16
                Layout.fillWidth: true
            }

        }

        Item {
            Layout.preferredWidth: imageSize
            Layout.preferredHeight:imageSize
            Layout.alignment: Qt.AlignCenter

            Image {
                id: control
                source:"qrc:/user.jpg"
                anchors.fill: parent
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: control.width
                        height: control.height
                        Rectangle {
                            anchors.centerIn: parent
                            height: Math.min(control.width, control.height)
                            width: height
                            radius: Math.min(width, height)
                            border.color:"black"
                            border.width: 2

                        }
                    }
                }
            }
        }
        ColumnLayout {
            //Layout.alignment: Qt.AlignCenter
            anchors.fill: parent
            width:(parent.width-imageSize)/2
            height: imageSize
            spacing: 10

            Text {
                text: qsTr("ACHIEVEMENT")
                color: "black"
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true

            }
            Rectangle {
                Layout.alignment: Qt.AlignCenter
                color:"gray"
                width: 100
                height: 2
            }

            Text {
                text: "575"
                color: "black"
                anchors.fill: parent
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
            }

        }
    }
}

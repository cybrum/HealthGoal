
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

    RowLayout {
        anchors.fill: parent
        Layout.alignment: Qt.AlignHCenter
        Column {
            Layout.alignment: Qt.AlignCenter
            width:100
            height:100

            Text {
                text: qsTr("Achivement")
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Image {
                source :"qrc:/separator.png"
                width:100
                height:4
            }
            Text {
                text: "570"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
        Item {
            width:100
            height:100
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
                        }
                    }
                }
            }
        }
        Column {
            width: 100
            height: 100
            Layout.alignment: Qt.AlignCenter
            Text {
                text: qsTr("Ranking")
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Image {
                source :"qrc:/separator.png"
                width: 100
                height:4
            }
            Text {
                text: "78%"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}

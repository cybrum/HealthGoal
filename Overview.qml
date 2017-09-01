/**
* File Name: Overview.qml
* Author: Nibedit
* Date:   12-08-2017
* Copyright: All rights reserved with Nibedit. No part of this file can be reproduced without permission.
* Client can use the code subject to realization of payments. In case client creates paypal dispute and
* reverses amount paid, he/she will lose the rights to use.
**/


import QtQuick 2.7
import QtQuick.Layouts 1.2

Flickable {
    id: root

    readonly property int hexagonLength: 120
    property int hexagonCount: root.width/(hexagonLength+20)

    ColumnLayout {

        anchors.fill: parent
        anchors.bottomMargin: 20
        ProfileArea {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: 100

        }
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Repeater {
                model: 2
                delegate: Tile  {
                    width: hexagonLength
                    height: hexagonLength
                }
            }
        }
        Row{
            spacing: 10

            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                model: 1
                delegate: Tile  {

                    width: hexagonLength*2
                    height: hexagonLength*2

                }
            }
        }
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                model: 2
                delegate: Tile  {
                    width: hexagonLength
                    height: hexagonLength
                }
            }
        }
    }
}


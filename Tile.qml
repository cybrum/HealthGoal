
/**
* File Name: Tile.qml
* Author: Nibedit
* Date:   12-08-2017
* Copyright: All rights reserved with Nibedit. No part of this file can be reproduced without permission.
* Client can use the code subject to realization of payments. In case client creates paypal dispute and
* reverses amount paid, he/she will lose the rights to use.
**/

import QtQuick 2.7
import QtQuick.Layouts 1.2

Image {
    id: root
    property bool isLargeHexagon: false

    source: "qrc:/hexagon_small.svg"
    width: 150; height: 150
    MouseArea {
        anchors.fill: root
        hoverEnabled: true
        onPressAndHold: {
            rowLayout.visible = true
        }
        onExited: {
             rowLayout.visible = false
        }
    }

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        visible: false
        Layout.margins: 10
        Image {
            id: closeImage
            source: "qrc:/close_button.svg"
            Layout.alignment: isLargeHexagon? Qt.AlignRight: Qt.AlignCenter
        }
        Image {
            id: expandImage
            visible: isLargeHexagon
            source: "qrc:/expand_button.svg"
            Layout.alignment: Qt.AlignLeft
        }
    }
}

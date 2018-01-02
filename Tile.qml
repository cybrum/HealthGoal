
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
import QtGraphicalEffects 1.0

Image {
    id: root

    property bool isLargeHexagon: false
    property bool isFadedHexagon: false
    property bool isExpanded: false
    property real hexagonLength: 160
    property real largeHexagonFactor:1.5 //as calculated

    source: isFadedHexagon? "qrc:/faded_add_new_hexagon.svg" :"qrc:/hexagon_small.svg"
    width: isLargeHexagon? (isExpanded?hexagonLength*largeHexagonFactor:hexagonLength): hexagonLength
    height: isLargeHexagon? (isExpanded?hexagonLength*largeHexagonFactor:hexagonLength): (isFadedHexagon?hexagonLength/largeHexagonFactor:hexagonLength)

    signal toggleSize(bool isLarge)
    //To Add: Pass true to add 2 small hexagons and false to add Large hexagon
    signal newHexagonAdded(bool isSmall)
    signal hexagonRemoved()

    layer.enabled: true
    layer.effect: DropShadow {
        transparentBorder: true
        horizontalOffset: 0
        verticalOffset: 0
    }

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
            id: addImage
            visible: isFadedHexagon
            source: "qrc:/add_button.svg"
            Layout.alignment:  Qt.AlignCenter
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    newHexagonAdded(true)
                }
            }
        }
        Image {
            id: closeImage
            visible: !isFadedHexagon
            source: "qrc:/close_button.svg"
            Layout.alignment: isLargeHexagon? Qt.AlignRight: Qt.AlignCenter
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.visible = false
                    hexagonRemoved()
                }
            }
        }
        Image {
            id: expandImage
            visible: isLargeHexagon
            source: "qrc:/expand_button.svg"
            Layout.alignment: Qt.AlignLeft
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(isExpanded) {
                        root.isExpanded = false
                    }else {
                        root.isExpanded = true
                    }
                    //Emit Signal
                    toggleSize(isExpanded)
                }
            }
        }
    }
}

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
                }
            }
        }
        Row{
            spacing: 10

            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                model: 1
                delegate: Tile  {
                    isLargeHexagon: true
                    isExpanded: true
                }
            }
        }
        Row {
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                model: 2
                delegate: Tile  {
                }
            }
        }
        Loader {
            id: addNew
            anchors.centerIn: parent
        }

        Component {
            id: hexagonComponent
            Row {
                spacing: 10
                anchors.horizontalCenter: parent.horizontalCenter
                Repeater {
                    model: 1
                    delegate: Tile  {
                        isLargeHexagon: true
                        isExpanded: true
                    }
                }
            }
        }
        Tile  {
            source: "qrc:/faded_add_new_hexagon.svg"
            anchors.horizontalCenter: parent.horizontalCenter
            isFadedHexagon:true
            onNewHexagonAdded :{
                //TODO
               // var newHexagon = hexagonComponent.createObject(root);
                addNew.sourceComponent = hexagonComponent
            }
        }
    }
}


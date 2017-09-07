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
    property int tileHeight: 120
    //Use Listview instead?
    ColumnLayout {

        anchors.fill: parent
        ProfileArea {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: false
            Layout.fillWidth: true
            anchors.top: parent.top
            Layout.minimumHeight: 100

        }
        Row {

            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Repeater {
                model: 2
                delegate: Tile  {
                    hexagonLength: tileHeight
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
                    hexagonLength: tileHeight
                }
            }
        }
        Row {
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                model: 2
                delegate: Tile  {
                    hexagonLength: tileHeight
                }
            }
        }
        Item{

            Layout.fillHeight: true
            Layout.fillWidth: true
            Loader {
                id: addNew
                anchors.fill: parent
                anchors.horizontalCenter: parent.horizontalCenter
//                onLoaded: {
//                    x = 100
//                }
            }

            Component {
                id: hexagonComponent
                Row {
                    spacing: 10
                    anchors.fill: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    Repeater {
                        model: 1
                        delegate: Tile  {
                            isLargeHexagon: true
                            isExpanded: true
                            hexagonLength: tileHeight
                        }
                    }
                }
            }
        }

    }
    Tile  {
        source: "qrc:/faded_add_new_hexagon.svg"
        anchors.horizontalCenter: parent.horizontalCenter
        isFadedHexagon:true
        anchors.bottom: parent.bottom
        hexagonLength: tileHeight
        onNewHexagonAdded :{
            //TODO
            var newHexagon = hexagonComponent.createObject(root);
            //addNew.sourceComponent = hexagonComponent
            newHexagon.x = 100//(root.width-addNew.width)/2
        }
    }
}


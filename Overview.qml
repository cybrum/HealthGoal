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


Rectangle {
    id: root
    width: 500; height: 400
    color: "white"
    property real tileHeight: 160
    property bool isLastRowLarge: false
    property real tileSpacing: tileHeight/10 //As calculated. UX designer may change value here .
    property real largeHexagonFactor:1.5 //as calculated
    property real yPos : 0

    // The delegate
    Component {
        id: delegate

        Item {
            id: delegateItem
            property string itemName: name
            property int modelSize: 0
            width: listView.width;
            height: itemName === "LargeHexagon"? tileHeight*largeHexagonFactor  :tileHeight
            // clip: true
            Row {
                spacing: tileSpacing
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

                Repeater {
                    id: repeater
                    model: {

                        if(name != "SmallHexagons") {
                            modelSize = 1
                            return 1;
                        } else {
                            modelSize = 2
                            return 2;
                        }
                    }

                    delegate: Tile  {
                        isLargeHexagon: itemName === "LargeHexagon"
                        hexagonLength:  tileHeight
                        isExpanded: itemName === "LargeHexagon"
                        onToggleSize:{
                            if(isExpanded) {
                                delegateItem.height = tileHeight*largeHexagonFactor
                            } else {
                                delegateItem.height = tileHeight
                            }
                        }
                        onNewHexagonAdded: {
                            delegateItem.height = tileHeight
                        }

                        onHexagonRemoved: {
                            modelSize --
                            //console.log("removed hexagon")
                            if(modelSize === 0) {
                                delegateItem.height = 0
                                //console.log("no hexagons in row")
                            }

                        }
                    }
                }
            }
        }
    }
    //!
    Item {

        anchors.fill: parent
        ProfileArea {
            id: profileArea
            anchors.top: parent.top
            height: 100
            width: root.width

        }
        Row {
            id: firstRow
            spacing: tileSpacing
            anchors {
                top: profileArea.bottom
                topMargin: tileSpacing
                horizontalCenter: parent.horizontalCenter
            }


            Repeater {
                id: repeater
                model: 2
                Tile  {
                    isLargeHexagon: false
                    hexagonLength:  tileHeight
                    isExpanded: false
                    onHexagonRemoved: {
                        if(repeater.count === 0) {
                            firstRow.height = 0
                        }
                    }
                }
            }
        }
        Tile  {
            id:secondRow
            anchors {
                top: firstRow.bottom
                topMargin:  firstRow.height === 0 ? tileSpacing : - tileSpacing*1.5
                horizontalCenter: parent.horizontalCenter
            }
            isLargeHexagon: true
            hexagonLength:  tileHeight
            isExpanded: true
            onHexagonRemoved: {
                    secondRow.height = 0
            }
        }

        Row {
            id: thirdRow
            spacing: tileSpacing
            anchors.top: secondRow.bottom
            anchors.topMargin: - tileSpacing* 1.5
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                id: repeater2
                model: 2
                Tile  {
                    isLargeHexagon: false
                    hexagonLength:  tileHeight
                    isExpanded: false
                }
            }
        }

        Tile  {
            id: fadedHexagon
            source: "qrc:/faded_add_new_hexagon.svg"
            anchors.horizontalCenter: parent.horizontalCenter
            height: tileHeight/largeHexagonFactor
            width: tileHeight
            isFadedHexagon:true
            isLargeHexagon: false
            anchors.bottom: parent.bottom
            hexagonLength: tileHeight
            onNewHexagonAdded :{

                if(isLastRowLarge){

                    isLastRowLarge = !isLastRowLarge
                } else {
                    //TODO: Warning! Test code. Not real implementation
                    var component = Qt.createComponent("Tile.qml");
                    var newHexagon = component.createObject(root);
                    newHexagon.y = thirdRow.y + thirdRow.height
                    newHexagon.x = (root.width - newHexagon.width)/2
                }
            }
        }
    }

    function createHexagonObject() {
        var component = Qt.createComponent("Tile.qml");
        var newHexagon = component.createObject(root);

        if (null === newHexagon) {
            // Error Handling
            console.log("Error creating hexagon");
        }
        return newHexagon;
    }
}



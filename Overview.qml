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
    property real tileSpacing: tileHeight/4 //As calculated. UX designer may change value here .
    property real largeHexagonFactor:1.5 //as calculated

    // The model:
    ListModel {
        id: hexagonModel

        ListElement {
            name: "SmallHexagons"; cost: 160

        }
        ListElement {
            name: "LargeHexagon"; cost: 250
        }
        ListElement {
            name: "SmallHexagons"; cost: 160
        }

    }

    // The delegate
    Component {
        id: listDelegate

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

            // Animate adding and removing of items:

            ListView.onAdd: SequentialAnimation {
                PropertyAction { target: delegateItem; property: "height"; value: 0 }
                NumberAnimation { target: delegateItem; property: "height"; to: delegateItem.height; duration: 250; easing.type: Easing.InOutQuad }
            }

            ListView.onRemove: SequentialAnimation {
                PropertyAction { target: delegateItem; property: "ListView.delayRemove"; value: true }
                NumberAnimation { target: delegateItem; property: "height"; to: 0; duration: 250; easing.type: Easing.InOutQuad }

                // Make sure delayRemove is set back to false so that the item can be destroyed
                PropertyAction { target: delegateItem; property: "ListView.delayRemove"; value: false }
            }
        }
    }

    ColumnLayout {

        anchors.fill: parent
        ProfileArea {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: false
            Layout.fillWidth: true
            anchors.top: parent.top
            Layout.minimumHeight: 100

        }
        // The view:
        ListView {
            id: listView
            //anchors.fill: parent
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: hexagonModel
            delegate: listDelegate
        }


        Tile  {
            id: fadedHexagon
            source: "qrc:/faded_add_new_hexagon.svg"
            //anchors.horizontalCenter: root.horizontalCenter
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: tileHeight/largeHexagonFactor
            Layout.preferredWidth: tileHeight
            //            Layout.fillWidth:false
            //            Layout.fillHeight:false
            isFadedHexagon:true
            isLargeHexagon: false
            anchors.bottom: parent.bottom
            hexagonLength: tileHeight
            onNewHexagonAdded :{


                if(isLastRowLarge){
                    hexagonModel.append({
                                            "name": "SmallHexagons",
                                            "cost": 160
                                        })
                } else {

                    hexagonModel.append({
                                            "name": "LargeHexagon",
                                            "cost": 250
                                        })
                }
                isLastRowLarge = !isLastRowLarge
            }
        }
    }
}



/**
* File Name: main.qml
* Author: Nibedit
* Date:   12-08-2017
* Copyright: All rights reserved with Nibedit. No part of this file can be reproduced without permission.
* Client can use the code subject to realization of payments. In case client creates paypal dispute and
* reverses amount paid, he/she will lose the rights to use.
**/

import QtQuick 2.7
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.2
import QtQuick.Controls 2.1
import QtQuick.Particles 2.0

Window {
    id: root
    visible: true

    //Customize for desktop
     width: Qt.platform.os == "Android" ? Screen.width : 440
     height: Qt.platform.os == "Android" ? Screen.height : 680

//    width: Screen.width
//    height:  Screen.height

    title: qsTr("HealthGoal")

    property int dpi: Screen.pixelDensity * 25.4
    property string pageName: qsTr("HealthGoal")

    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#EEEEFF" }
            GradientStop { position: 1.0; color: "lightblue" }
        }

        ParticleSystem {
            anchors.fill: parent
            ImageParticle {
                groups: ["stars"]
                color: "white"
                anchors.fill: parent
                source: "qrc:///particleresources/star.png"
            }
            Emitter {
                group: "stars"
                emitRate: 800
                lifeSpan: 2400
                size: 24
                sizeVariation: 8
                anchors.fill: parent
            }


            ImageParticle {
                anchors.fill: parent
                source: "qrc:///particleresources/star.png"
                alpha: 0
                alphaVariation: 0.2
                colorVariation: 1.0
            }

            Emitter {
                anchors.centerIn: parent
                emitRate: 400
                lifeSpan: 2400
                size: 48
                sizeVariation: 8
                velocity: AngleDirection {angleVariation: 180; magnitude: 60}
            }

            Turbulence {
                anchors.fill: parent
                strength: 2
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent

        SwipeView {
            id: swipeArea
            Layout.fillHeight: true
            Layout.fillWidth: true
            currentIndex: 1

            Social {
                id: firstPage
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            Overview {
                id: secondPage
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: root.width
            }
            Settings {
                id: thirdPage
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            onCurrentIndexChanged: {
               // console.log("index is ",currentIndex)
                switch(currentIndex)
                {
                case 0: pageName = qsTr("Social"); break;
                case 1: pageName = qsTr("Overview"); break;
                case 2: pageName = qsTr("Settings"); break;
                default: pageName = qsTr("HealthGoal")

                }
            }
        }
    }
}

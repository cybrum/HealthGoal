
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
    id: root

    //Property bindings
    property int imageSize: 100
    property string profileImageSource: "qrc:/user.jpg"
    property string separatorColor: "gray"
    property int separatorHeight: 2
    property int fontSize: 16
    property string textColor: "black"
    property string achievementScore: "575"
    property string peerRankingScore: "78%"

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        ColumnLayout {
            id: leftColumnLayout
            width: (rowLayout.width-imageSize)/2
            height: 300

            Text {
                id: peerRankingText
                text: qsTr("PEER RANKING")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: fontSize
                color: textColor
            }

            Rectangle {
                id: leftSeparator
                width: 110
                height: separatorHeight
                color: separatorColor
                Layout.fillWidth: true
            }

            Text {
                id: peerRankingScoreText
                text: peerRankingScore
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pixelSize: fontSize
                color: textColor
            }
        }

        Item {
            Layout.preferredWidth: imageSize
            Layout.preferredHeight:imageSize
            Layout.alignment: Qt.AlignCenter

            Image {
                id: profileImage
                source: profileImageSource
                anchors.fill: parent
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: profileImage.width+5
                        height: profileImage.height+5
                        Rectangle {
                            anchors.centerIn: parent
                            height: Math.min(profileImage.width, profileImage.height)
                            width: height
                            radius: Math.min(width, height)
                            border.color:"black"
                            border.width: 2

                        }
                    }
                }
                //comment this section to remove gray circle
                Image {
                    anchors.fill: parent
                    source:"qrc:/profile_circle.svg"
                }
                //!
            }
        }

        ColumnLayout {
            id: rightColumnLayout
            width: (rowLayout.width-100)/2
            height: 285

            Text {
                id: achievementText
                text: qsTr("ACHIEVEMENT")
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pixelSize: fontSize
                color: textColor
            }

            Rectangle {
                id: rightSeparator
                width: 110
                height: separatorHeight
                color: separatorColor
                Layout.fillWidth: true
            }


            Text {
                id: achievementScoreText
                text: achievementScore
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                font.pixelSize: fontSize
                color: textColor
            }
        }
    }
}




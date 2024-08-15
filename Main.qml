import QtQuick
import com.company.PlayerController
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Song Player")

    Rectangle{
        id:topbar
        anchors{
            top: parent.top
            left:parent.left
            right:parent.right
        }
        height: 50
        color:"#5F8575"
    }

    Rectangle{
        id:mainSection
        anchors{
            top:topbar.bottom
            bottom:bottombar.top
            left:parent.left
            right:parent.right
        }
        color:"#1e1e1e"
        AudioInfoBox{
            id:firstSong
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
                right:parent.right
                margins:20
            }
            infoProvider {
                songIndex: 0
                title:"Somebody Else"
                authorName:"The 1975"
                imageSource:"assets/image/song1.png"
                audioSource:"C:/Users/ceyda/OneDrive/Belgeler/ScytheStudio/SongPlayer/assets/audio/somebody_else.mp3"
            }

        }

        AudioInfoBox{
            id:secondSong
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
                right:parent.right
                margins:20
            }
            infoProvider {
                songIndex: 1
                title:"No Surprises "
                authorName:"Radiohead"
                imageSource:"assets/image/song2.jpg"
                audioSource:"C:/Users/ceyda/OneDrive/Belgeler/ScytheStudio/SongPlayer/assets/audio/Surprises.mp3"

            }


        }

        AudioInfoBox{
            id:thirdSong
            anchors{
                verticalCenter: parent.verticalCenter
                left:parent.left
                right:parent.right
                margins:20
            }
            infoProvider{
                songIndex: 2
                title:"Air on the G String"
                authorName:"Johann Sebastian Bach"
                imageSource:"assets/image/song3.jpg"
                //videoSource:"C:/Users/ceyda/OneDrive/Belgeler/ScytheStudio/SongPlayer/assets/videos/video_1.avi"
                audioSource:"C:/Users/ceyda/OneDrive/Belgeler/ScytheStudio/SongPlayer/assets/audio/air_on_the_g_string.mp3"
            }


        }
    }

    Rectangle{
        id:bottombar
        anchors{
            bottom:parent.bottom
            left:parent.left
            right:parent.right
        }
        height:100
        color:"#333333"
        Row {
            anchors.centerIn: parent
            spacing:20

            ImageButton{
                id:previousButton
                width: 64
                height: 64
                source:"assets/icons/previous_icon.png"
                onClicked: PlayerController.switchToPreviousSong()
            }
            ImageButton{
                id:playPauseButton
                width: 64
                height: 64
                source: PlayerController.playing ? "assets/icons/pause_icon.png":"assets/icons/play_icon.png"
                onClicked: PlayerController.playPause()
            }
            ImageButton{
                id:nextButton
                width: 64
                height: 64
                source:"assets/icons/next_icon.png"
                onClicked: PlayerController.switchToNextSong()

            }

        }
    }


}

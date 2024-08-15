import QtQuick

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
            songIndex: 0
            title:"Somebody Else "
            authorName:"The 1975"
            imageSource:"assets/image/song1.png"


        }

        AudioInfoBox{
            id:secondSong
            anchors{
            verticalCenter: parent.verticalCenter
            left:parent.left
            right:parent.right
            margins:20
            }
            songIndex: 1
            title:"Symphone No. 5 "
            authorName:"Beethoven"
            imageSource:"assets/image/song2.jpg"


        }

        AudioInfoBox{
            id:thirdSong
            anchors{
            verticalCenter: parent.verticalCenter
            left:parent.left
            right:parent.right
            margins:20
            }
            songIndex: 2
            title:"Air on the G String"
            authorName:"Johann Sebastian Bach"
            imageSource:"assets/image/song3.jpg"

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

          TextButton{
              id:previousButton
              width: 50
              height: 50
              text:"<"
              onClicked: playerConroller.switchToPreviousSong()
          }
          TextButton{
              id:playPauseButton
              width: 75
              height: 50
              text:playerConroller.playing ? "Pause" : "Play"
              onClicked: playerConroller.playPause()
          }
          TextButton{
              id:nextButton
              width: 50
              height: 50

              text:">"
              onClicked: playerConroller.switchToNextSong()

          }

        }
    }

    QtObject{
    id:playerConroller
    property int currentSongIndex:0
    property int songCount:3
    property bool playing: false

    function playPause(){
    playing= !playing
    }

    function switchToPreviousSong(){
    if(currentSongIndex>0){
        currentSongIndex--
    }else{
        currentSongIndex=songCount-1
    }

    }

    function switchToNextSong(){
        if(currentSongIndex + 1>=songCount){
           currentSongIndex=0
            }else{
           currentSongIndex++}
        }

}
}


cmake_minimum_required(VERSION 3.16)

project(SongPlayer VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Multimedia)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appSongPlayer
    main.cpp

)

qt_add_qml_module(appSongPlayer
    URI SongPlayer
    VERSION 1.0
    QML_FILES
        Main.qml
        QML_FILES
        QML_FILES AudioInfoBox.qml
        QML_FILES ImageButton.qml

        RESOURCES
        assets/image/song1.png
        assets/image/song2.jpg
        assets/image/song3.jpg

        assets/icons/app_icon.ico
        assets/icons/next_icon.png
        assets/icons/pause_icon.png
        assets/icons/play_icon.png
        assets/icons/previous_icon.png
        assets/videos/video_1.avi
        assets/audio/somebody_else.mp3
        assets/audio/Surprises.mp3
        assets/audio/air_on_the_g_string.mp3


        SOURCES
        PlayerController.h PlayerController.cpp
        SOURCES
        AudioInfo.h AudioInfo.cpp


)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appSongPlayer PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appSongPlayer
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appSongPlayer
    PRIVATE Qt6::Quick Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appSongPlayer
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

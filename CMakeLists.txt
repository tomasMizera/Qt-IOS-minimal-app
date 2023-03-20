cmake_minimum_required(VERSION 3.16)

project(dummy-qt-ios-app VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)


if (IOS OR MACOS)
  find_package(AppleFrameworks REQUIRED)
  find_library(CORE_LOCATION_FRAMEWORK CoreLocation)
  find_library(USER_NOTIFICATIONS_LIBRARY UserNotifications)
endif ()

qt_add_executable(appdummy-qt-ios-app
    iosinterface.h
    iosinterface.cpp
    ioslocationbgndservice.h ioslocationbgndservice.mm
    ioslocationimpl.h ioslocationimpl.mm
    main.cpp
)

target_sources(appdummy-qt-ios-app PRIVATE iosinterface.mm)

qt_add_qml_module(appdummy-qt-ios-app
    URI dummy-qt-ios-app
    VERSION 1.0
    QML_FILES main.qml 
)


target_link_libraries(appdummy-qt-ios-app PUBLIC ${CORE_LOCATION_FRAMEWORK})
#target_link_libraries(appdummy-qt-ios-app "-framework UserNotifications")


set_target_properties(appdummy-qt-ios-app PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)


if (IOS)
set_target_properties(
    appdummy-qt-ios-app
    PROPERTIES MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/Info.plist
  )
endif ()

if (MACOS OR IOS)
  target_link_libraries(
    appdummy-qt-ios-app PUBLIC AppleFrameworks::Security AppleFrameworks::CoreFoundation
                 AppleFrameworks::SystemConfiguration
  )
endif ()

target_link_libraries(appdummy-qt-ios-app
    PRIVATE Qt6::Quick)

install(TARGETS appdummy-qt-ios-app
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

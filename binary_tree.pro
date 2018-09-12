include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG += thread
CONFIG -= qt

HEADERS += \
    binary_tree.h

SOURCES += \
        main.cpp \
    binary_tree.cpp

include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console
CONFIG += c++1z I get CXX17
CONFIG -= app_bundle
CONFIG += thread
CONFIG -= qt

HEADERS += \
        tst_1.h \
    node.h \
    data.h \
    data.h

SOURCES += \
        main.cpp \
    data.cpp \
    node.cpp \
    data.cpp

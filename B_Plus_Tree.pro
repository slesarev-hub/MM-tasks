include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console c++17

QMAKE_CXXFLAGS += -std=c++17
CONFIG -= app_bundle
CONFIG += thread
CONFIG -= qt

HEADERS += \
    data.h \
    node.h \
    tst_1.h \
    innernode.h \
    leafnode.h \
    rootnode.h \
    tree.h

SOURCES += \
        main.cpp \
    data.cpp \
    node.cpp \
    innernode.cpp \
    leafnode.cpp \
    rootnode.cpp \
    tree.cpp

SUBDIRS += \
    B_Plus_Tree.pro

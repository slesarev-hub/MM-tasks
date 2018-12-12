include(gtest_dependency.pri)

TEMPLATE = app
CONFIG += console c++17
QMAKE_CXXFLAGS += -std=c++17
CONFIG -= app_bundle
CONFIG += thread
CONFIG -= qt

HEADERS += \
    data.h \
    innernode.h \
    leafnode.h \
    node.h \
    rootnode.h \
    tree.h \
    tst_1.h

SOURCES += \
    data.cpp \
    innernode.cpp \
    leafnode.cpp \
    main.cpp \
    node.cpp \
    rootnode.cpp \
    tree.cpp

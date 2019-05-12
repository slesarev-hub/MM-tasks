TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

LIBS += \
    -lpthread \
    -lboost_program_options

SOURCES += \
    logger_2.cpp \
    logger_1.cpp \
    logger.cpp \
    data.cpp \
    main.cpp

HEADERS += \
    logger_2.hpp \
    logger_1.hpp \
    logger.hpp \
    data.hpp

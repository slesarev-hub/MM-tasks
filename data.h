#ifndef DATA_H
#define DATA_H

#include <string>
#include <iostream>

namespace b_plus_tree{

class Data
{
public:
    Data();
    Data(int key, std::string source);
    Data(const Data& other);
    ~Data();

    Data& operator=(const Data& other);

    int         key;
    std::string source;
};

}

#endif // DATA_H

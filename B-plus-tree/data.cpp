#include "data.h"

namespace b_plus_tree {

Data::Data(){}

Data::Data(int key, std::string source)
    : key(key), source(source){}

Data::Data(const Data& other)
    : key(other.key), source(other.source){}

Data::~Data(){}

Data& Data::operator=(const Data& other){
    this->key    = other.key;
    this->source = other.source;
    return *this;
}

}


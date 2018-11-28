#ifndef DATA_H
#define DATA_H

namespace b_plus_tree{

template<typename T>
class Data
{
public:
    Data();
    Data(int key, T source);
    ~Data();

    int key;
    T   source;
};

template<typename T>
Data<T>::Data(){}

template<typename T>
Data<T>::Data(int key, T source)
    : key(key), source(source){}

template<typename T>
Data<T>::~Data(){}
}

#endif // DATA_H

#ifndef DATA_H
#define DATA_H

namespace b_plus_tree{

template<typename T>
class Data
{
public:
    Data();
    Data(T source);

    T source;
};

template<typename T>
Data<T>::Data(){}

template<typename T>
Data<T>::Data(T source)
    : source(source){}

}

#endif // DATA_H

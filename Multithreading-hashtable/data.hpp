#ifndef DATA_H
#define DATA_H

#include <string>
#include <iostream>

class Data
{
public:
    Data();
    Data(int int_val, std::string str_val);
    Data(const Data& other);
    ~Data();

    void set_int(int val);
    void set_str(std::string str);

    int get_int() const;
    std::string get_str() const;

    Data& operator=(const Data& other);
    bool operator==(const Data& other);

    friend std::ostream& operator<<(std::ostream& out, const Data& d);

private:
    int          int_val;
    std:: string str_val;
};

#endif
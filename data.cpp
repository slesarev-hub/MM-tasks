 #include "data.hpp"
 
Data::Data()
    : int_val(0), str_val("default"){}

Data::Data(int int_val, std::string str_val)
    : int_val(int_val), str_val(str_val){}

Data::Data(const Data& other)
    : int_val(other.int_val), str_val(other.str_val){}

Data::~Data(){}

void Data::set_int(int val)
{
    this->int_val = val;
}

void Data::set_str(std::string str)
{
    this->str_val = str;
}

int Data::get_int() const
{
    return this->int_val;
}

std::string Data::get_str() const
{
    return this->str_val;
}

Data& Data::operator=(const Data& other)
{
    this->int_val = other.int_val;
    this->str_val = other.str_val;
    return *this;
}

bool Data::operator==(const Data& other)
{
    return ((this->int_val == other.int_val) && (this->str_val == other.str_val));
}

std::ostream& operator<<(std::ostream& out, const Data& d)
{
    out << d.get_int();
    return out;
}

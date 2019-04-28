#ifndef DATA
#define DATA

#include <string>
#include <thread>
#include <mutex>
#include <map>

class Data
{
public:
    Data();
    ~Data();
    Data(std::string source);

    bool is_last_chunk();
    void mark_as_last();

    friend std::ostream& operator<<(std::ostream& out, const Data& d);

private:
    std::string source;
    const int   thread_id;
    bool        last_chunk_flag;
};

#endif
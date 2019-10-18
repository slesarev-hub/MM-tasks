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
    void set_thread_info(std::string info);

    friend std::ostream& operator<<(std::ostream& out, const Data& d);

private:
    std::string source;
    const int   thread_id;
    std::string thread_info;
    bool        last_chunk_flag;
};

int to_int(const std::thread::id id);

#endif
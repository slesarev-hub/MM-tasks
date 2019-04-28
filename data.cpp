#include "data.hpp"

int to_int(const std::thread::id id)
{
    static int nextindex = 0;
    static std::mutex mtx;
    static std::map<std::thread::id, int> all_ids;
    std::lock_guard<std::mutex> lock(mtx);

    if(all_ids.find(id) == all_ids.end())
    {
        all_ids[id] = nextindex++;
    }  
    return all_ids[id];
}

Data::Data()
    : source("default source"), thread_id(to_int(std::this_thread::get_id())), last_chunk_flag(false){}

Data::~Data(){}

Data::Data(std::string source)
    : source(source), thread_id(to_int(std::this_thread::get_id())), last_chunk_flag(false){}

bool Data::is_last_chunk()
{
    return this->last_chunk_flag;
}

void Data::mark_as_last()
{
    this->last_chunk_flag = true;
}

std::ostream& operator<<(std::ostream& out, const Data& d)
{
    out << "thread: "  + std::to_string(d.thread_id) +
            "source: " + d.source + "\n";
    return out;
}
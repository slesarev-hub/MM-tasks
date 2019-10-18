#ifndef LOGGER
#define LOGGER

#include "data.hpp"

#include <chrono>
#include <deque>
#include <iostream>
#include <iterator>
#include <atomic>

class Consumer
{
public:
    Consumer();
    ~Consumer();

    void lock()       const;
    void unlock()     const; 
    bool try_lock()   const;

    void push_back(const Data& data);

    std::atomic<int>   producers_count;
    std::deque<Data>   source_pool;
    mutable std::mutex mtx;    
private:
};

class Producer 
{
public:
    Producer();
    ~Producer();
    Producer(int sleep_time);

    std::chrono::milliseconds sleep_time;    
private:
};

void write_to_stream(std::deque<Data>& source, std::ostream& out);

#endif

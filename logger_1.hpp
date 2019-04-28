#ifndef LOGGER_1
#define LOGGER_1

#include "data.hpp"

#include <chrono>
#include <deque>
#include <condition_variable>
#include <iostream>
#include <iterator>
#include <fstream>

namespace logger_1
{

class Consumer
{
public:
    Consumer();
    ~Consumer();
    Consumer(int flush_limit);

    void lock()       const;
    void unlock()     const; 
    bool try_lock()   const;
    void notify_one() const;

    void push_back(const Data& data);

    void log_source(int producers_count, std::ofstream& out);

    void decrease_connections_count();

private:
    mutable std::mutex              mtx;
    mutable std::condition_variable send_condition;
    
    int              connections_count;
    int              flush_limit; 
    std::deque<Data> source_pool;
};

class Producer 
{
public:
    Producer();
    ~Producer();
    Producer(std::chrono::milliseconds sleep_time);

    void send(Consumer& consumer, int number_of_parcels);

private:
    static int                producers_created;
    const  int                id;
    std::chrono::milliseconds sleep_time;
};

};

#endif
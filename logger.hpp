#ifndef LOGGER
#define LOGGER

#include "data.hpp"

#include <chrono>
#include <deque>
#include <iostream>
#include <iterator>

class Consumer
{
public:
    Consumer();
    ~Consumer();

    void lock()       const;
    void unlock()     const; 
    bool try_lock()   const;

    void push_back(const Data& data);

  //virtual void log_source(int producers_count, std::ostream& out) = 0;


    std::deque<Data>   source_pool;
    mutable std::mutex mtx;    
    int                producers_count;
private:
};

class Producer 
{
public:
    Producer();
    ~Producer();
    Producer(std::chrono::milliseconds sleep_time);

  //virtual void send(Consumer& consumer, int number_of_parcels) = 0;


    std::chrono::milliseconds sleep_time;    
private:
};

#endif
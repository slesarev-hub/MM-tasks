#include "logger.hpp"

Consumer::Consumer()
    : producers_count(0), source_pool{0}{}

Consumer::~Consumer(){}

void Consumer::lock() const
{
    this->mtx.lock();
}

void Consumer::unlock() const
{
    this->mtx.unlock();
}

bool Consumer::try_lock() const
{
    return this->mtx.try_lock();
}

void Consumer::push_back(const Data& data)
{
    this->source_pool.push_back(data);
}


Producer::Producer()
    : sleep_time(1000){}

Producer::~Producer(){}

Producer::Producer(std::chrono::milliseconds sleep_time)
    : sleep_time(sleep_time){}

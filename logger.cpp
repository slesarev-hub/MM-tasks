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

Producer::Producer(int sleep_time)
    : sleep_time(std::chrono::milliseconds(sleep_time)){}


void write_to_stream(std::deque<Data>& source, std::ostream& out)
{
    out << "\n" << source.size() << " elements\n";
    std::move(begin(source), end(source),
                    std::ostream_iterator<Data>(out));
    source.clear();
    out.flush();       
}

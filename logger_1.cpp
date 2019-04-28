#include "logger_1.hpp"

namespace logger_1
{

Consumer::Consumer()
    : flush_limit(0), connections_count(0){}

Consumer::~Consumer(){}

Consumer::Consumer(int flush_limit)
    : flush_limit(flush_limit), connections_count(0){}

void Consumer::lock() const
{
    this->lock();
}

void Consumer::unlock() const
{
    this->unlock();
}

bool Consumer::try_lock() const
{
    return this->try_lock();
}

void Consumer::notify_one() const
{
    this->send_condition.notify_one();
}

void Consumer::push_back(const Data& data)
{
    this->source_pool.push_back(data);
}

void Consumer::log_source(int producers_count, std::ofstream& out)
{
    this->connections_count = producers_count;
    for(;;)
    {
        std::unique_lock<std::mutex> lock_1(this->mtx);
        send_condition.wait(lock_1, [&]{return !this->source_pool.empty();});
        if (this->source_pool.size() >= this->flush_limit)
        {
            std::move(begin(this->source_pool), end(this->source_pool),
                            std::ostream_iterator<Data>(out));
        }
        lock_1.unlock();
        if (this->connections_count <= 0)
        {
            break;
        }
    }
}

void Consumer::decrease_connections_count()
{
    this->connections_count--;
}

int Producer::producers_created = 1;

Producer::Producer()
    : sleep_time(1000), id(Producer::producers_created++){}

Producer::~Producer(){}

Producer::Producer(std::chrono::milliseconds sleep_time)
    : sleep_time(sleep_time), id(Producer::producers_created++){}

void Producer::send(Consumer& consumer, int number_of_parcels)
{
    for (int i = 0; i < number_of_parcels; i++)
    {
        Data data(std::to_string(i));
        std::this_thread::sleep_for(this->sleep_time);
        if (i == number_of_parcels - 1)
        {
            consumer.decrease_connections_count();
        }
        std::lock_guard<Consumer> lock_1(consumer);
        consumer.push_back(data);
        consumer.notify_one();
    }
}

};
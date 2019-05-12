#include "logger_1.hpp"

Consumer_1::Consumer_1()
    : Consumer(){}

Consumer_1::~Consumer_1(){}

void Consumer_1::notify_one() const
{
    this->log_condition.notify_one();
}

void Consumer_1::log_source(int producers_count, std::ostream& out)
{        
    this->producers_count = producers_count;
    for(;;)
    {
        std::unique_lock<std::mutex> lock_1(this->mtx);
        this->log_condition.wait(lock_1, [&]()
        {return (!this->source_pool.empty());});
        write_to_stream(this->source_pool, out);
        if (this->producers_count <= 0)
        {
            write_to_stream(this->source_pool, out);
            break;
        }
    }
}


std::atomic<int> Producer_1::current_producers{0};

Producer_1::Producer_1()
    : Producer(),
      number_of_parcels(0), 
      id(Producer_1::current_producers++){}

Producer_1::~Producer_1()
{
    Producer_1::current_producers--;
}

Producer_1::Producer_1(int sleep_time, int number_of_parcels)
    : Producer(sleep_time),
      number_of_parcels(number_of_parcels),
      id(Producer_1::current_producers++){}

void Producer_1::send(Consumer_1& consumer)
{
    for (int i = 0; i < this->number_of_parcels; i++)
    {
        Data data(std::to_string(i));
        data.set_thread_info(std::to_string(this->sleep_time.count()));
        std::this_thread::sleep_for(this->sleep_time);
    
        std::lock_guard<Consumer> lock_1(consumer);
        consumer.push_back(data);
        if (i == this->number_of_parcels - 1)
        {
            consumer.producers_count--;        
        }
        consumer.notify_one();
    }
}

#include "logger_2.hpp"

Consumer_2::Consumer_2()
    : Consumer(), flush_limit(0){}

Consumer_2::~Consumer_2(){}

Consumer_2::Consumer_2(int flush_limit)
    : Consumer(), flush_limit(flush_limit){}

void Consumer_2::notify_one() const
{
    this->log_condition.notify_one();
}

void Consumer_2::log_source(int producers_count, std::ostream& out)
{        
    this->producers_count = producers_count;
    for(;;)
    {
        std::unique_lock<std::mutex> lock_1(this->mtx);
        this->log_condition.wait(lock_1, [&](){return this->source_pool.size() >= this->flush_limit;});
        write_to_stream(this->source_pool, out);
        
        this->send_condition.notify_all();
        if (this->producers_count <= 0)
        {
            write_to_stream(this->source_pool, out);
            break;
        }
    }
}


std::atomic<int> Producer_2::current_producers{0};

Producer_2::Producer_2()
    : Producer(),
      number_of_parcels(0), 
      id(Producer_2::current_producers++){}

Producer_2::~Producer_2(){
    Producer_2::current_producers--;
}

Producer_2::Producer_2(int sleep_time, int number_of_parcels)
    : Producer(sleep_time),
      number_of_parcels(number_of_parcels),
      id(Producer_2::current_producers++){}

void Producer_2::send(Consumer_2& consumer)
{
    for (int i = 0; i < this->number_of_parcels; i++)
    {
        Data data(std::to_string(i));
        std::this_thread::sleep_for(this->sleep_time);
        
        std::unique_lock<std::mutex> lock_1(consumer.mtx);
        consumer.send_condition.wait(lock_1, 
        [&](){return consumer.source_pool.size() <= consumer.flush_limit;});
        consumer.push_back(data);
        if (i == this->number_of_parcels - 1)
        {
            consumer.producers_count--;    
        }
        consumer.notify_one();
    }
}

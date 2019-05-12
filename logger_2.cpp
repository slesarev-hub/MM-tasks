#include "logger_2.hpp"

Consumer_2::Consumer_2()
    : Consumer(), flush_limit(0){}

Consumer_2::~Consumer_2(){}

Consumer_2::Consumer_2(int flush_limit)
    : Consumer(), flush_limit(flush_limit){}

void Consumer_2::notify_one() const
{
    this->send_condition.notify_one();
}

void Consumer_2::log_source(int producers_count, std::ostream& out)
{        
    this->producers_count = producers_count;
    for(;;)
    {
        std::unique_lock<std::mutex> lock_1(this->mtx);
        this->send_condition.wait(lock_1, [&](){return this->source_pool.size() >= this->flush_limit;});
        for (int i = 0; i < this->flush_limit; i++)
        {
            std::cout << this->source_pool.front();
            this->source_pool.pop_front();
            std::cout.flush();
        }
        //std::move(begin(this->source_pool), end(this->source_pool),
        //                std::ostream_iterator<Data>(out));
        //out.flush();
        lock_1.unlock();
        if (this->producers_count <= 0)
        {
            break;
        }
    }
}


int Producer_2::current_producers = 0;

Producer_2::Producer_2()
    : Producer(), id(Producer_2::current_producers++){}

Producer_2::~Producer_2(){
    Producer_2::current_producers--;
}

Producer_2::Producer_2(std::chrono::milliseconds sleep_time)
    : Producer(sleep_time), id(Producer_2::current_producers--){}

void Producer_2::send(Consumer_2& consumer, int number_of_parcels)
{
    for (int i = 0; i < number_of_parcels; i++)
    {
        Data data(std::to_string(i));
        std::this_thread::sleep_for(this->sleep_time);
        
        if (i == number_of_parcels - 1)
        {
            consumer.producers_count--;    
        }

        std::lock_guard<Consumer> lock_1(consumer);
        consumer.push_back(data);
        consumer.notify_one();
    }
}

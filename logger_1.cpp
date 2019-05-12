#include "logger_1.hpp"

Consumer_1::Consumer_1()
    : Consumer(){}

Consumer_1::~Consumer_1(){}

void Consumer_1::notify_one() const
{
    this->send_condition.notify_one();
}

void Consumer_1::log_source(int producers_count, std::ostream& out)
{        
    this->producers_count = producers_count;
    for(;;)
    {
        std::unique_lock<std::mutex> lock_1(this->mtx);
        this->send_condition.wait(lock_1, [&](){return this->producers_count <= 0;});
        lock_1.unlock();
        break;
    }
    std::cout << "   " << this->source_pool.size() << "\n";
    for (auto i : this->source_pool)
    {
        std::cout << i;
    }
    std::cout.flush();
}


std::atomic<int> Producer_1::current_producers{0};

Producer_1::Producer_1()
    : Producer(), id(Producer_1::current_producers++){}

Producer_1::~Producer_1()
{
    Producer_1::current_producers--;
}

Producer_1::Producer_1(std::chrono::milliseconds sleep_time)
    : Producer(sleep_time), id(Producer_1::current_producers++){}

void Producer_1::send(Consumer_1& consumer, int number_of_parcels)
{
    for (int i = 0; i < number_of_parcels; i++)
    {
        Data data(std::to_string(i));
        std::this_thread::sleep_for(this->sleep_time);
        
        std::lock_guard<Consumer> lock_1(consumer);
        consumer.push_back(data);
        if (i == number_of_parcels - 1)
        {
            consumer.producers_count--;    
        }
        if (consumer.producers_count <= 0)
        {
            consumer.notify_one();
        }
    }
}

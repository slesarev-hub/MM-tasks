#ifndef LOGGER_1
#define LOGGER_1

#include "logger.hpp"

#include <condition_variable>

class Consumer_1 : public Consumer
{
public:
    Consumer_1();
    ~Consumer_1();
    
    void notify_one() const;

    void log_source(int producers_count, std::ostream& out);

private:
    mutable std::condition_variable log_condition;
};

class Producer_1 : public Producer
{
public:
    Producer_1();
    ~Producer_1();
    Producer_1(int sleep_time, int number_of_parcels);

    void send(Consumer_1& consumer);

private:
    int                     number_of_parcels;
    int                     id;
    static std::atomic<int> current_producers;
};

#endif

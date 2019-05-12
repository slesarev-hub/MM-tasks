#ifndef LOGGER_2
#define LOGGER_2

#include "logger.hpp"

#include <condition_variable>

class Consumer_2 : public Consumer
{
public:
    Consumer_2();
    ~Consumer_2();
    Consumer_2(int flush_limit);

    void notify_one() const;

    void log_source(int producers_count, std::ostream& out);

private:
    mutable std::condition_variable send_condition;
    int                             flush_limit;
};

class Producer_2 : Producer
{
public:
    Producer_2();
    ~Producer_2();
    Producer_2(std::chrono::milliseconds sleep_time);

    void send(Consumer_2& consumer, int number_of_parcels);

private:
           int id;
    static int current_producers;
};

#endif
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


    mutable std::condition_variable send_condition;
    int                             flush_limit;
private:
    mutable std::condition_variable log_condition;
};

class Producer_2 : Producer
{
public:
    Producer_2();
    ~Producer_2();
    Producer_2(int sleep_time, int number_of_parcels);

    void send(Consumer_2& consumer);

private:
    int                     number_of_parcels;
    int                     id;
    static std::atomic<int> current_producers;
};

#endif
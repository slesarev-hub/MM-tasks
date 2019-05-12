#ifndef LOGGER_1
#define LOGGER_1

#include "logger.hpp"

#include <atomic>
#include <condition_variable>

class Consumer_1 : public Consumer
{
public:
    Consumer_1();
    ~Consumer_1();
    Consumer_1(int flush_limit);

    void notify_one() const;

    void log_source(int producers_count, std::ostream& out);

private:
    mutable std::condition_variable send_condition;
    int                             flush_limit;
};

class Producer_1 : Producer
{
public:
    Producer_1();
    ~Producer_1();
    Producer_1(std::chrono::milliseconds sleep_time);

    void send(Consumer_1& consumer, int number_of_parcels);

private:
    int                     id;
    static std::atomic<int> current_producers;
};

#endif

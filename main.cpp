#include "logger_1.hpp"

#include <fstream>
#include <random>
#include <boost/program_options.hpp>

namespace po = boost::program_options;


int main(int argc, char **argv)
{
    Consumer_1 consumer;
    Producer_1 producer2(std::chrono::milliseconds(10));
    Producer_1 producer3(std::chrono::milliseconds(100));
    std::ofstream out("test.txt");
    std::thread t1(&Consumer_1::log_source, &consumer, 2, std::ref(out));
    std::thread t2(&Producer_1::send, &producer2, std::ref(consumer), 10);
    std::thread t3(&Producer_1::send, &producer3, std::ref(consumer), 10);

    t3.detach();
    t2.detach();
    t1.join();
    return 0;
}

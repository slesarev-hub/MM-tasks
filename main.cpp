#include "logger_1.hpp"

#include <fstream>
#include <random>
#include <boost/program_options.hpp>

namespace po = boost::program_options;

// UNIQUE LOCK ПОЧЕМУ НЕ ПРОСТО LOCK???



int main(int argc, char **argv)
{
    try
    {
        int workers;
        int add;
        int pop;
        int find;
        std::string test_name;
        int range;
        po::options_description description{"Options"};
        description.add_options()
        ("help,h", "print description\n")
        ("iterations", "")
        ("time_range", po::value<int>(&add)->default_value(0), "")
        ("logger_type", "")
        ("workers", po::value<int>(&workers)->default_value(0), "")
        ("file", po::value<std::string>(&test_name)->default_value("test.txt"), "");
        po::variables_map vm;
        po::store(parse_command_line(argc, argv, description), vm);
        po::notify(vm);

        logger_1::Consumer consumer(2);
        logger_1::Producer producer(std::chrono::milliseconds(1000));
        std::ofstream out("test.txt");
        std::thread t1(&logger_1::Consumer::log_source, &consumer, 1, std::ref(out));
        std::thread t2(&logger_1::Producer::send, &producer, std::ref(consumer), 10);

        t1.join();
        t2.join();
    }
    catch (const po::error &ex)
    {
        std::cerr << ex.what() << '\n';
    }
    return 0;
}
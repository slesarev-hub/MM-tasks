#include "logger_1.hpp"
#include "logger_2.hpp"

#include <fstream>
#include <random>
#include <boost/program_options.hpp>

namespace po = boost::program_options;


int main(int argc, char **argv)
{
    try
    {
        int         task_number;
        std::string test_name;
        po::options_description description{"Options"};
        description.add_options()
        ("task", po::value<int>(&task_number)->default_value(2), "")
        ("file", po::value<std::string>(&test_name)->default_value("task-2.txt"), "");
        po::variables_map vm;
        po::store(parse_command_line(argc, argv, description), vm);
        po::notify(vm);

        if ((vm.count("file") == 1) && (vm.count("task") == 1))
        {
            std::ifstream             in(test_name);
            std::ofstream             out("test-out.txt");
            std::vector<std::thread>  producing_pool;        
            int                       sleep_time;
            int                       producer_count;
            int                       number_of_parcels;
            int                       flush_limit;
            if (task_number == 1)
            {
                Consumer_1 consumer;
                std::vector<Producer_1> producers;
                std::vector<std::thread> pool;
                in >> producer_count;
                std::thread logging(&Consumer_1::log_source,
                                    &consumer, producer_count, std::ref(out));
                
                for (int i = 0; i < producer_count; i++)
                {
                    in >> sleep_time >> number_of_parcels;
                    producers.emplace_back(sleep_time, number_of_parcels);
                }
                for (auto& i : producers)
                {
                    pool.emplace_back(&Producer_1::send, i, std::ref(consumer));
                }
                for (auto& i : pool)
                {
                    i.detach();
                }
                logging.join();
            }
            if (task_number == 2)
            {
                std::vector<Producer_2> producers;
                std::vector<std::thread> pool;
                in >> producer_count >> flush_limit;
            
                Consumer_2 consumer(flush_limit);
                std::thread logging(&Consumer_2::log_source,
                                    &consumer, producer_count, std::ref(out));
                
                for (int i = 0; i < producer_count; i++)
                {
                    in >> sleep_time >> number_of_parcels;
                    producers.emplace_back(sleep_time, number_of_parcels);
                }
                for (auto& i : producers)
                {
                    pool.emplace_back(&Producer_2::send, i, std::ref(consumer));
                }
                for (auto& i : pool)
                {
                    i.detach();
                }
                logging.join();    
            }
        }
    }
    catch (const po::error &ex)
    {
        std::cerr << ex.what() << '\n';
    }
    
    return 0;
}

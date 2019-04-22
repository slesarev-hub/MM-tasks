#include "table.hpp"

#include <iostream>
#include <fstream>
#include <random>
#include <thread>
#include <boost/program_options.hpp>

namespace po = boost::program_options;

void read_and_run(Table& tbl, std::ifstream in, int thread_operations, std::mutex& mtx)
{
    std::vector<std::pair<char, int>> operations;
    char operation;
    int  value;
    mtx.lock();
    for (int i = 0; i < thread_operations; i++)
    {
        in >> operation >> value;
        operations.emplace_back(operation, value);
    }
    mtx.unlock();
    for (auto [operation, value] : operations)
    {
        if (operation == 'a')
        {
            tbl.put(Data(value, "str-" + std::to_string(value)));
        }
    }
}

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
        ("generate", "")
        ("add", po::value<int>(&add)->default_value(0), "")
        ("pop", po::value<int>(&pop)->default_value(0), "")
        ("find", po::value<int>(&find)->default_value(0), "")
        ("range", po::value<int>(&range)->default_value(0), "")
        ("run", "")
        ("workers", po::value<int>(&workers)->default_value(0), "")
        ("file", po::value<std::string>(&test_name)->default_value("test_0.txt"), "");
        po::variables_map vm;
        po::store(parse_command_line(argc, argv, description), vm);
        po::notify(vm);

        if (vm.count("generate") == 1)
        {
            std::ofstream out(test_name);            
            std::default_random_engine generator;
            std::uniform_int_distribution<int> distribution(0,range);
            std::vector<int> source;
            for (int i = 0; i < add; i++)
            {
                source.push_back(distribution(generator));
            }
            out << add + std::min(find,add) + std::min(pop,add) << "\n";
            for (int i = 0; i < add/2; i++)
            {
                out << "a " << source[i] << "\n";
            }
            for (int i = 0; i < std::min(find/2, add/2); i++)
            {
                out << "f " << source[i] << "\n";
            }
            for (int i = 0; i < std::min(pop/2, add/2); i++)
            {
                out << "p " << source[i] << "\n";
            }
            std::vector<std::string> shuffled_operations;
            for (int i = add/2; i < add; i++)
            {
                shuffled_operations.push_back("a " + std::to_string(source[i]) + "\n");
            }
            for (int i = std::min(find/2,add/2); i < std::min(find,add); i++)
            {
                shuffled_operations.push_back("f " + std::to_string(source[i]) + "\n");
            }
            for (int i = std::min(pop/2,add/2); i < std::min(pop,add); i++)
            {
                shuffled_operations.push_back("p " + std::to_string(source[i]) + "\n");
            }
            std::random_device seed{};
            shuffle(shuffled_operations.begin(), shuffled_operations.end(),
                    std::default_random_engine(seed()));
            for (auto s : shuffled_operations)
            {
                out << s;
            }
        }
        else if (vm.count("run") == 1)
        {
            std::ifstream in(test_name);
            char operation;
            int  value;
            int  operations_count;
            std::vector<std::thread> pool;

            in >> operations_count;
            int thread_operations = (operations_count - operations_count%workers)/workers;

            
        }
    }
    catch (const po::error &ex)
    {
        std::cerr << ex.what() << '\n';
    }
    return 0;
}
#include "table.hpp"

#include <iostream>
#include <fstream>
#include <random>
#include <thread>
#include <deque>
#include <boost/program_options.hpp>

namespace po = boost::program_options;

void read_and_run(Table& tbl, std::deque<std::pair<char, int>> &operations_storage, int thread_operations, std::mutex& mtx)
{
    for (int i = 0; i < thread_operations; i++)
    {
        mtx.lock();
        auto [operation, value] = operations_storage.front();
        operations_storage.pop_front();
        mtx.unlock();
        Data data(value, "str-" + std::to_string(value));
        if (operation == 'a')
        {
            tbl.put(data);
        }
        else if (operation == 'f')
        {
            tbl.check(data);
        }
        else if (operation == 'p')
        {
            tbl.remove(data);
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
        ("file", po::value<std::string>(&test_name)->default_value("test.txt"), "");
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
            int  operations_count;
            std::vector<std::thread> pool;

            in >> operations_count;
            std::deque<std::pair<char, int>> operations_storage;
            char operation;
            int value;
            for (int i = 0; i < operations_count; i++)
            {
                in >> operation >> value;
                operations_storage.emplace_back(operation, value);
            }

            Table tbl;
            std::mutex mtx;
            if (workers != 0)
            {
                int thread_operations = (operations_count - operations_count%workers)/workers;
                for (int i = 0; i < workers; i++)
                {
                    pool.emplace_back(read_and_run, std::ref(tbl), std::ref(operations_storage),
                                                    thread_operations, std::ref(mtx));

                }
                read_and_run(tbl, operations_storage, operations_count%workers, mtx);
                for (auto& i : pool)
                {
                    i.join();
                }
            }
            else
            {
                read_and_run(tbl, operations_storage, operations_count, mtx);
            }
            //std::cout << tbl;
        }
    }
    catch (const po::error &ex)
    {
        std::cerr << ex.what() << '\n';
    }
    return 0;
}
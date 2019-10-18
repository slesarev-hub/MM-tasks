#include "calculate_tests.hpp"
#include "speed_test.hpp"

#include <boost/program_options.hpp>
#include <random>

namespace po = boost::program_options;

int main(int argc, char **argv) {
    try
    {
        int workers_max = 1;
        po::options_description description{"Options"};
        description.add_options()
        ("help,h", "print description\n")
        ("calculate,c", "calculate determinant of given matrix formatted like \'size elements frequency\'\n")
        ("parallel,p", po::value<int>(&workers_max)->default_value(1), "sets given threads count, use it together with -c\n")
        ("functionality_test", "test functions of Matrix class\n")
        ("compare_speeds", "compare multithreading execution with single thread on set of matrices\n")
        ("generate,g", "create set of matrices in \'sample_\' files\n");
        po::variables_map vm;
        po::store(parse_command_line(argc, argv, description), vm);
        po::notify(vm);

        std::cout << "type --help to get description\n";
        if (vm.count("help") == 1)
        {
            std::cout << description << "\n";
        }
        if (vm.count("parallel") == 1)
        {
            Matrix::set_is_parallel(true);
            Matrix::set_workers_max(workers_max);
        }
        if (vm.count("calculate") == 1)
        {
            std::cout << SpeedTest::read_matrix(std::cin).determinant() << std::endl;
        }
        else if (vm.count("functionality_test") == 1)
        {
            ::testing::InitGoogleTest(&argc, argv); 
            ::testing::GTEST_FLAG(filter) = "*select_minor*:*determinant*";
            return RUN_ALL_TESTS();
        }
        else if (vm.count("compare_speeds") == 1)
        {
            SpeedTest manager(
                std::vector<std::string> {
                "compare_speed_0.txt", "compare_speed_1.txt", "compare_speed_2.txt", "compare_speed_3.txt",
                "compare_speed_4.txt", "compare_speed_5.txt", "compare_speed_6.txt", "compare_speed_7.txt",
                "compare_speed_8.txt"});

            manager.workers_range = {1,2,3,4,5,6,7,8};
            for (auto s : manager.tests_names)
            {
                manager.speed_test(s);
            }
            
        }
        else if (vm.count("generate") == 1)
        {
            std::default_random_engine generator;
            std::uniform_int_distribution<int> distribution(10,100);
            std::vector<int> sizes = {11};
            int no = 0;
            for (auto s : sizes)
            {
                std::ofstream out("sample_" + std::to_string(no++) + ".txt");
                out << s << "\n";
                for (int i = 0; i < s; i++)
                {
                    for (int j = 0; j < s; j++)
                    {
                        out << distribution(generator) << "  ";
                    }
                    out << "\n";
                }
            }
        }
        else
        {
            std::cout << "wrong key\n";
        }
    }
    catch (const po::error &ex)
    {
        std::cerr << ex.what() << '\n';
    }
}
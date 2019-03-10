#include "calculate_tests.hpp"
#include "speed_tests.hpp"

#include <boost/program_options.hpp>
#include <random>

namespace po = boost::program_options;

int main(int argc, char **argv) {
    try
    {
        po::options_description description{"Options"};
        description.add_options()
        ("calculate,c", "COMMENT")
        ("parallel,p", "COMMENT")
        ("test,t", "COMMENT")
        ("generate,g", "COMMENT");
        po::variables_map vm;
        po::store(parse_command_line(argc, argv, description), vm);
        po::notify(vm);

        if (vm.count("parallel") == 1)
        {
            Matrix::set_is_parallel(true);
            //Matrix::set_workers_max(1);
        }
        if (vm.count("calculate") == 1)
        {
            std::cout << speed_tests::read_matrix(std::cin).determinant() << std::endl;
        }
        else if ((vm.count("test") == 1) && (vm.count("parallel") == 0))
        {
            ::testing::InitGoogleTest(&argc, argv); 
            ::testing::GTEST_FLAG(filter) = "*select_minor*:*determinant*";
            return RUN_ALL_TESTS();
        }
        else if ((vm.count("test") == 1) && (vm.count("parallel") == 1))
        {
            ::testing::InitGoogleTest(&argc, argv); 
            ::testing::GTEST_FLAG(filter) = "*speed_tests*";
            return RUN_ALL_TESTS();
        }
        else if (vm.count("generate") == 1)
        {
            std::default_random_engine generator;
            std::uniform_int_distribution<int> distribution(10,100);
            std::vector<int> sizes = {10,30,50,70,90,110,130,150};
            int no = 0;
            for (auto s : sizes)
            {
                std::ofstream out("compare_speed_" + std::to_string(no++) + ".txt");
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
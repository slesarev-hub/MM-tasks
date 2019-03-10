#ifndef SPEED_TEST_H
#define SPEED_TEST_H

#include "matrix.hpp"

#include <string>
#include <fstream>
#include <chrono>
#include <map>

class SpeedTest
{
public:
    SpeedTest();
    SpeedTest(std::vector<std::string> tests_names);
    ~SpeedTest();

    void                  speed_test(std::string test_name);
    static matrix::Matrix read_matrix(std::istream& in);
    
    std::vector<std::string>            tests_names;
    std::map<std::pair<int,int>,
             std::chrono::milliseconds> parallel_table; //workers count, size, time
    std::vector<int>                    workers_range;
    std::vector<int>                    matrices_sizes;
}; 

#endif
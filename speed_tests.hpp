#ifndef SPEED_TESTS_H
#define SPEED_TESTS_H

#include "matrix.hpp"

#include <gtest/gtest.h>
#include <string>
#include <fstream>
#include <chrono>

using namespace matrix;

namespace speed_tests
{
    std::vector<std::string> tests_names = {
        "compare_speed_0.txt", "compare_speed_1.txt", "compare_speed_2.txt", "compare_speed_3.txt",
        "compare_speed_4.txt", "compare_speed_5.txt", "compare_speed_6.txt", "compare_speed_7.txt"};

    int test_no = 0;

    Matrix read_matrix(std::istream& in)
    {
        int matrix_size = 0;
        in >> matrix_size;
        Matrix matrix(matrix_size);
        in >> matrix;
        std::cout << "!\n";
        
        return matrix;
    }

    std::tuple<long long, long long> prepare_speed_test(std::string test_name)
    {
        std::ifstream in(test_name);
        Matrix m = read_matrix(in);

        Matrix::set_is_parallel(false);
        auto np_start = std::chrono::steady_clock::now();
        long long not_parallel = m.determinant();
        auto np_end = std::chrono::steady_clock::now();
        
        std::cout << "!!\n";

        Matrix::set_is_parallel(true);
        auto p_start = std::chrono::steady_clock::now();
        long long parallel = m.determinant();
        auto p_end = std::chrono::steady_clock::now();

        std::cout << "!!!\n";

        auto np_time = std::chrono::duration_cast<std::chrono::milliseconds>(np_end - np_start).count();
        auto  p_time = std::chrono::duration_cast<std::chrono::milliseconds>( p_end -  p_start).count();
        std::cout << "not parallel: " << np_time << "\n"
                  << "parallel    : " << p_time << "\n"; 

        test_no++;

        return {not_parallel, parallel};
    }
    
    TEST(speed_tests, 0_0)
    {
        auto [not_parallel, parallel] = prepare_speed_test(tests_names[test_no]);
        ASSERT_EQ(not_parallel, parallel);
    }

    TEST(speed_tests, 0_1)
    {
        auto [not_parallel, parallel] = prepare_speed_test(tests_names[test_no]);
        ASSERT_EQ(not_parallel, parallel);
    }

    TEST(speed_tests, 0_2)
    {
        auto [not_parallel, parallel] = prepare_speed_test(tests_names[test_no]);
        ASSERT_EQ(not_parallel, parallel);
    }

    TEST(speed_tests, 0_3)
    {
        auto [not_parallel, parallel] = prepare_speed_test(tests_names[test_no]);
        ASSERT_EQ(not_parallel, parallel);
    }

    TEST(speed_tests, 0_4)
    {
        auto [not_parallel, parallel] = prepare_speed_test(tests_names[test_no]);
        ASSERT_EQ(not_parallel, parallel);
    }

    TEST(speed_tests, 0_5)
    {
        auto [not_parallel, parallel] = prepare_speed_test(tests_names[test_no]);
        ASSERT_EQ(not_parallel, parallel);
    }

    TEST(speed_tests, 0_6)
    {
        auto [not_parallel, parallel] = prepare_speed_test(tests_names[test_no]);
        ASSERT_EQ(not_parallel, parallel);
    }

    TEST(speed_tests, 0_7)
    {
        auto [not_parallel, parallel] = prepare_speed_test(tests_names[test_no]);
        ASSERT_EQ(not_parallel, parallel);
    }
}

#endif
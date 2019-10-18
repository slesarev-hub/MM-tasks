#ifndef CALCULATE_TESTS_H
#define CALCULATE_TESTS_H

#include "matrix.hpp"

#include <gtest/gtest.h>
#include <string>
#include <fstream>

using namespace matrix;

namespace calculate_tests
{
    std::vector<std::string> tests_names = {
        "select_minor_0.txt", "select_minor_1.txt", "select_minor_2.txt", "select_minor_3.txt",
        "determinant_0.txt", "determinant_1.txt", "determinant_2.txt", "determinant_3.txt"};

    int test_no = 0;

    std::tuple<Matrix, Matrix, int, int> read_select_minor_test(std::string test_name)
    {
        std::ifstream in(test_name);
        int matrix_size = 0;
        int minor_size  = 0;
        int row         = 0;
        int col         = 0; 
        in >> matrix_size;
        Matrix matrix(matrix_size);
        in >> matrix >> row >> col >> minor_size;
        Matrix minor(minor_size);
        in >> minor;
        test_no++;
        in.close();
        return {matrix, minor, row, col};
    }

    TEST(select_minor, 0_0)
    {
        auto [matrix, minor, row, col] = read_select_minor_test(tests_names[test_no]);
        ASSERT_TRUE(minor == matrix.select_minor(row,col));
    }

    TEST(select_minor, 0_1)
    {
        auto [matrix, minor, row, col] = read_select_minor_test(tests_names[test_no]);
        ASSERT_TRUE(minor == matrix.select_minor(row,col));
    }

    TEST(select_minor, 0_2)
    {
        auto [matrix, minor, row, col] = read_select_minor_test(tests_names[test_no]);
        ASSERT_TRUE(minor == matrix.select_minor(row,col));
    }

    TEST(select_minor, 0_3)
    {
        auto [matrix, minor, row, col] = read_select_minor_test(tests_names[test_no]);
        ASSERT_TRUE(minor.get_size() == 0);
    }

    std::tuple<Matrix, int> read_determinant_test(std::string test_name)
    {
        std::ifstream in(test_name);
        int matrix_size;
        int det;
        in >> matrix_size;
        Matrix m(matrix_size);
        in >> m >> det;
        test_no++;
        in.close();
        return {m, det};
    }
    TEST(determinant, 1_0)
    {
        auto [m, det] = read_determinant_test(tests_names[test_no]);
        ASSERT_EQ(det, m.determinant());
    }

    TEST(determinant, 1_1)
    {
        auto [m, det] = read_determinant_test(tests_names[test_no]);
        ASSERT_EQ(det, m.determinant());
    }

    TEST(determinant, 1_2)
    {
        auto [m, det] = read_determinant_test(tests_names[test_no]);
        ASSERT_EQ(det, m.determinant());
    }

    TEST(determinant, 1_3)
    {
        auto [m, det] = read_determinant_test(tests_names[test_no]);
        ASSERT_EQ(det, m.determinant());
    }
}
#endif 
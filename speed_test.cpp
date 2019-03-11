#include "speed_test.hpp"

#include <iostream>

using namespace matrix;

SpeedTest::SpeedTest(){}

SpeedTest::SpeedTest(std::vector<std::string> tests_names)
    : tests_names(tests_names){}

SpeedTest::~SpeedTest(){}

Matrix SpeedTest::read_matrix(std::istream& in)
{
    int matrix_size = 0;
    in >> matrix_size;
    Matrix matrix(matrix_size);
    in >> matrix;
    return matrix;
}

void SpeedTest::speed_test(std::string test_name)
{
    std::ifstream in(test_name);
    Matrix m = read_matrix(in);

    std::cout << "size         : " << m.get_size() << "\n"; 

    Matrix::set_is_parallel(false);
    auto np_start = std::chrono::steady_clock::now();
    long long not_parallel = m.determinant();
    auto np_end = std::chrono::steady_clock::now();
    auto np_time = std::chrono::duration_cast<std::chrono::milliseconds>(np_end - np_start);

    std::cout << "workers/time : \n0 " << np_time.count() << "\n";

    this->parallel_table[{0, m.get_size()}] = np_time;
    this->matrices_sizes.push_back(m.get_size());

    Matrix::set_is_parallel(true);
    int initial_workers_max = Matrix::get_workers_max();
    for (auto i : workers_range)
    {
        Matrix::set_workers_max(i);
        auto p_start = std::chrono::steady_clock::now();
        long long parallel = m.determinant();
        auto p_end = std::chrono::steady_clock::now();
        auto  p_time = std::chrono::duration_cast<std::chrono::milliseconds>( p_end - p_start);
        this->parallel_table[{Matrix::get_workers_max(), m.get_size()}] = p_time;
        
        std::cout << i << " " << p_time.count() << "\n"; 
    }
    Matrix::set_workers_max(initial_workers_max);
}
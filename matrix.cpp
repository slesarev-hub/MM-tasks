#include "matrix.hpp"

#include <iostream>
#include <istream>
#include <ostream>
#include <mutex>
#include <thread>
#include <memory>

namespace matrix
{

bool Matrix::is_parallel = false;
std::atomic<int> Matrix::workers_max(3);
std::atomic<int> Matrix::workers_count(0);

Matrix::Matrix()
    : size(0)
{}

Matrix::~Matrix()
{}

Matrix::Matrix(int size)
{
    this->size = size;
    this->source.assign(size,std::vector<int>(size,-1));
}

Matrix::Matrix(Matrix const& other)
{
    this->size   = other.size;
    this->source = other.source;
}

bool Matrix::operator==(const Matrix& other)
{
    return (this->source == other.source);
}

Matrix& Matrix::operator=(Matrix const& other)
{
    if (this->size == other.size)
    {
        for (int i = 0; i < this->size; i++)
        {
            for (int j = 0; j < this->size; j++)
            {
                (*this)[i][j] = other[i][j];
            }
        }
    }
    else
    {
        std::cerr << "error: Matrix& operator=(const Matrix& other)";
    }
    return *this;
}

int Matrix::get_size() const
{
    return this->size;
}

void Matrix::set_is_parallel(bool is_parallel)
{
    Matrix::is_parallel = is_parallel;
}

void Matrix::set_workers(int max, int count)
{
    Matrix::workers_max = max;
    Matrix::workers_count = count;
}

std::vector<int>& Matrix::operator[](int idx)
{
    return this->source[idx];
}

const std::vector<int>& Matrix::operator[](int idx) const
{
    return this->source[idx];
}

std::istream& operator>>(std::istream& in, Matrix& m)
{
    for (int i = 0; i < m.size; i++)
    {
        for (int j = 0; j < m.size; j++)
        {
            in >> m[i][j]; 
        }
    }
    return in;
}

std::ostream& operator<<(std::ostream& out, const Matrix& m)
{
    for (int i = 0; i < m.size; i++)
    {
        for (int j = 0; j < m.size; j++)
        {
            out << m[i][j] << " "; 
        }
        out << "\n";
    }
    return out;
}

Matrix Matrix::select_minor(int row, int col) const 
{
    Matrix minor(this->size - 1);
    for (int i = 0; i < row; i++)
    {
        for (int j = 0; j < col; j++)
        {
            minor[i][j] = (*this)[i][j];
        }
    }
    for (int i = row + 1; i < this->size; i++)
    {
        for (int j = 0; j < col; j++)
        {
            minor[i - 1][j] = (*this)[i][j];
        }
    }
    for (int i = 0; i < row; i++)
    {
        for (int j = col + 1; j < this->size; j++)
        {
            minor[i][j - 1] = (*this)[i][j];
        }
    }
    for (int i = row + 1; i < this->size; i++)
    {
        for (int j = col + 1; j < this->size; j++)
        {
            minor[i - 1][j - 1] = (*this)[i][j];
        }
    }
    return minor;
}

long long calculate_determinant(const Matrix& m)
{
    if (m.get_size() == 1)
    {
        return m[0][0];
    }
    int       sign = 1;
    long long sum  = 0;
    for (int i = 0; i < m.get_size(); i++)
    {
        sum += sign * m[0][i] * calculate_determinant(m.select_minor(0,i));
        #ifdef DEBUG
        std::cout << "+ " + std::to_string(sign) +
        "*" + std::to_string(m[0][i]) + "*(" +  
        std::to_string(calculate_determinant(m.select_minor(0,i))) + ")";
        #endif 
        sign *= -1;
    }
    return sum;
}

void call_calculate_determinant(long long& det, const Matrix& m)
{
    det = calculate_determinant(m);
}

long long parallel_calculate_determinant(const Matrix& m)
{
    std::vector<std::thread> workers;
    std::vector<long long>   subdets(Matrix::workers_max, 0);
    std::mutex mtx;

    std::cout << "!!!\n";

    for (int i = 0; i < m.get_size(); i++)
    {
        std::cout << "!4\n";
        Matrix minor = m.select_minor(0,i);
        if (Matrix::workers_count < Matrix::workers_max)
        {
            std::cout << "!5\n"; 
            workers.push_back(std::move(std::thread(call_calculate_determinant, 
                              std::ref(subdets[i]),
                              minor)));
            Matrix::workers_count++; 
        }
        else
        {
            std::cout << "!6\n";
            mtx.lock();
            subdets[i] = calculate_determinant(m.select_minor(0,i));
            mtx.unlock();
        }
    }
    for (auto& i : workers)
    {
        i.join();
    }
    long long det  = 0;
    int       sign = 1;
    for (int i = 0; i < m.get_size(); i++)
    {
        det += sign * m[0][i] * subdets[i];
        sign *= -1;
    }
    return det;
}

long long Matrix::determinant()
{
    if (Matrix::is_parallel)
    {
        return parallel_calculate_determinant(*this);
    }
    else
    {    
        return calculate_determinant(*this);
    }
}

}
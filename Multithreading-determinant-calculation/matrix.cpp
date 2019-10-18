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
int Matrix::workers_max  = 1;

Matrix::Matrix()
    : size(0), source(0){}

Matrix::~Matrix(){}

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

void Matrix::set_workers_max(int max)
{
    Matrix::workers_max = max;
}

int Matrix::get_workers_max()
{
    return Matrix::workers_max;
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

long long calculate_determinant(Matrix m)
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
        sign *= -1;
    }
    return sum;
}

void call_calculate_determinant(long long& det, Matrix m)
{
   // std::cout << "ON CPU : " << sched_getcpu() << "\n";
    det = calculate_determinant(m);
}

void calculate_subdets(std::vector<long long>& subdets, std::vector<Matrix> minors, int begin, int end)
{
    for (int i = begin; i < end; i++)
    {
        subdets[i] = calculate_determinant(minors[i]);
    }
}

long long parallel_calculate_determinant(Matrix m)
{
    std::vector<std::thread> workers;
    std::vector<Matrix>      minors;
    std::vector<long long>   subdets(m.get_size(), 0);

    for (int i = 0; i < m.get_size(); i++)
    {
        minors.emplace_back(m.select_minor(0,i));
    }        
    int parallel_part = (Matrix::get_workers_max() == 0) ? (0)
                                                         : (m.get_size() - m.get_size() % Matrix::get_workers_max());
    int minors_in_thread = (Matrix::get_workers_max() == 0) ? (0) 
                                                            : (parallel_part/Matrix::get_workers_max());
    for (int i = 0; i < parallel_part; i += minors_in_thread)
    {
        workers.emplace_back(calculate_subdets, 
                            std::ref(subdets),
                            minors,
                            i, i + minors_in_thread);
    
    }
    calculate_subdets(subdets, minors, parallel_part, m.get_size());   
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
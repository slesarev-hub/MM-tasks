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
std::atomic<int> Matrix::workers_count(0);
int Matrix::workers_max = 6;

Matrix::Matrix()
    : size(0), source(0)
{
    //std::cout << "Matrix() : " << this << "\n";
}

Matrix::~Matrix()
{
    //std::cout << "~Matrix() : " << this << "\n";
}

Matrix::Matrix(int size)
{
    this->size = size;
    this->source.assign(size,std::vector<int>(size,-1));
    //std::cout << "Matrix(" << size << ") : " << this << "\n";
}

Matrix::Matrix(Matrix const& other)
{
    this->size   = other.size;
    this->source = other.source;
    //std::cout << "Matrix(" << this << ") : " << this << "\n";
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

//void Matrix::set_workers_max(int max)
//{
//    Matrix::workers_max = max;
//}

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
    det = calculate_determinant(m);
}

long long parallel_calculate_determinant(Matrix m)
{
    std::vector<std::thread> workers;
    std::vector<Matrix>      minors;
    std::vector<long long>   subdets(m.get_size(), 0);
    std::mutex mtx;
    mtx.lock();
            
    for (int i = 0; i < m.get_size(); i++)
    {
        minors.emplace_back(m.select_minor(0,i));
    }        
    for (int i = 0; i < m.get_size(); i++)
    {
        if (Matrix::workers_count < Matrix::workers_max)
        {
            workers.push_back(std::move(std::thread(call_calculate_determinant, 
                              std::ref(subdets[i]),
                              std::ref(minors[i]))));
            Matrix::workers_count++; 
        }
        else
        {
            subdets[i] = calculate_determinant(minors[i]);
        }
    }   
    mtx.unlock();    
    for (auto& i : workers)
    {
        i.join();
    }
    long long det  = 0;
    int       sign = 1;
    for (int i = 0; i < m.get_size(); i++)
    {
        det += sign * m[0][i] * subdets[i];
        //std::cout << sign << "*" << m[0][i] << "*" << subdets[i] << " ";
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
#include "matrix.hpp"

#include <iostream>
#include <istream>
#include <ostream>

namespace matrix_determinant
{

Matrix::Matrix(int size)
{
    this->size = size;
    this->source.assign(size,std::vector<int>(size,-1));
}

Matrix::Matrix(const Matrix& other)
{
    this->size   = other.size;
    this->source = other.source;
}

bool Matrix::operator==(const Matrix& other)
{
    return (this->source == other.source);
}

Matrix& Matrix::operator=(const Matrix& other)
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
    if (m.get_size() == 0)
    {
        return 1;
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

long long Matrix::determinant()
{
    return calculate_determinant(*this);
}

}
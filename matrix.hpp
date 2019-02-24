#ifndef MATRIX_H
#define MATRIX_H

#include <thread>
#include <vector>

namespace matrix_determinant
{

class Matrix
{
public:
    Matrix(int);
    Matrix(const Matrix&);
    Matrix(Matrix&&) = delete;

    bool    operator==(const Matrix&);
    Matrix& operator=(const Matrix&);
    Matrix& operator=(Matrix&&) = delete;

    int get_size() const;
    std::vector<int>& operator[](int);
    const std::vector<int>& operator[](int) const;

    friend std::istream& operator>>(std::istream& in, Matrix& m);
    friend std::ostream& operator<<(std::ostream& out, const Matrix& m);

    Matrix select_minor(int row, int col) const;
    long long determinant();

private:
    int                           size;
    std::vector<std::vector<int>> source;
};

}
#endif
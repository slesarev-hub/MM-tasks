#ifndef MATRIX_H
#define MATRIX_H

#include <thread>
#include <vector>

namespace matrix
{

class Matrix
{
public:
    Matrix();
    ~Matrix();
    Matrix(int);
    Matrix(Matrix const&);
    
    bool    operator==(const Matrix&);
    Matrix& operator=(Matrix const&);
    
    int                     get_size() const;
    static void             set_is_parallel(bool is_parallel);
    static void             set_workers_max(int max);
    static int              get_workers_max();
    std::vector<int>&       operator[](int);
    const std::vector<int>& operator[](int) const;

    friend std::istream& operator>>(std::istream& in, Matrix& m);
    friend std::ostream& operator<<(std::ostream& out, const Matrix& m);

    Matrix    select_minor(int row, int col) const;
    long long determinant();
    friend long long parallel_calculate_determinant(Matrix m);

    static bool                   is_parallel;
    static int workers_max;
    
private:
    int                           size;
    std::vector<std::vector<int>> source;
};

long long parallel_calculate_determinant(Matrix m);

}
#endif
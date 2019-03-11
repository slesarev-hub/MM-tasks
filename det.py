import numpy

matrix = numpy.loadtxt('valgrind_test_matrix', skiprows = 1)
print matrix 
print numpy.linalg.det(matrix) 

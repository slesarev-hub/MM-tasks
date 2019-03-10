import numpy

matrix = numpy.loadtxt('try', skiprows = 1)
print matrix 
print numpy.linalg.det(matrix) 

Application to show how multithreading speeds up calculation of matrix determinant.
* the main program will be compiled in `matrix_calc` file, you can read about its abilities using `--help` key
* to test with valgrind, run `valgrind_test.sh`. It will execute calculation of matrix from `valgrind_test_matrix` file with `memcheck`,`helgrind` and `drd` tools
* to check correctness of the `valgrind_test_matrix` determinant calculation, run `det.py` - this programm calculates determinant using `numpy`

Used libraries: pthread, boost, numpy.

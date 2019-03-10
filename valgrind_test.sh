command="./matrix_calc -p 2 -c"
file="valgrind_test_matrix"
valgrind --tool=memcheck --leak-check=full ${command} < ${file}
printf '\n'
valgrind --tool=helgrind ${command} < ${file}
printf '\n'
valgrind --tool=drd ${command} < ${file}

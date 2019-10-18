#!/bin/bash

file="test_2.txt"
#./table --generate --add 8 --find 0 --pop 8 --range 200 --file ${file}

workers="1"

valgrind --tool=memcheck ./table --run --workers ${workers} --file ${file}
valgrind --tool=helgrind ./table --run --workers ${workers} --file ${file}
valgrind --tool=drd ./table --run --workers ${workers} --file ${file}
 
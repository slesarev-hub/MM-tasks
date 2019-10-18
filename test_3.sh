#!/bin/bash

file="test_3.txt"
./table --generate --add 4 --find 0 --pop 3 --range 200 --file ${file}

workers="5"

valgrind --tool=memcheck ./table --run --workers ${workers} --file ${file}
valgrind --tool=helgrind ./table --run --workers ${workers} --file ${file}
valgrind --tool=drd ./table --run --workers ${workers} --file ${file}
 
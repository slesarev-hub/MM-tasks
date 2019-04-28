#!/bin/bash

file="test_2.txt"
./table --generate --add 10 --find 10 --pop 0 --range 200 --file ${file}

workers="2"

valgrind --tool=memcheck ./table --run --workers ${workers} --file ${file}
valgrind --tool=helgrind ./table --run --workers ${workers} --file ${file}
valgrind --tool=drd ./table --run --workers ${workers} --file ${file}
 
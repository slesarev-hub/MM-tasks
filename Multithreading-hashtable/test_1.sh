#!/bin/bash

file="test_1.txt"
workers="6"

valgrind --tool=memcheck ./table --run --workers ${workers} --file ${file}
valgrind --tool=helgrind ./table --run --workers ${workers} --file ${file}
valgrind --tool=drd ./table --run --workers ${workers} --file ${file}
 
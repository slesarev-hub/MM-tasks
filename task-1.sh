#!/bin/bash

file="task-1.txt"
task=1
command="./logger --file ${file} --task ${task}"

eval ${command}

#valgrind --tool=memcheck ./logger --file ${file} --task 1
#valgrind --tool=helgrind ./logger --file ${file} --task 1
#valgrind --tool=drd ./logger --file ${file} --task 1
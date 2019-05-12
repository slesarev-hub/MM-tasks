#!/bin/bash

file="task-2.txt"
task=2
command="./logger --file ${file} --task ${task}"

eval ${command}

#valgrind --tool=memcheck ./logger --file ${file} --task 1
#valgrind --tool=helgrind ./logger --file ${file} --task 1
#valgrind --tool=drd ./logger --file ${file} --task 1
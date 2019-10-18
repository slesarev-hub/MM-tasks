#!/bin/bash

echo 1000 >> test_1.txt
for i in {1..1000}
do
    echo "a ${i}" >> test_1.txt
done
#!/bin/bash

# QEMU Ubuntu Img - CPU Experiments

# This script runs 4 sysbench cpu test commands with different arguments for cpu-max-prime and max-time (default 10 seconds) and writes the statistical information for avg, min, max, execution time to the results file.

FILE=cpu-tests-results.txt
touch $FILE

echo "test 1: sysbench --test=cpu --cpu-max-prime=10000 run " >> $FILE
for i in {1..5}
do
  sysbench --test=cpu --cpu-max-prime=10000 run | grep 'avg:\|min:\|max:\|execution time' >> $FILE
done
echo " " >> $FILE

echo "test 2: --test=cpu --cpu-max-prime=30000 run" >> $FILE
for i in {1..5}
do
  sysbench --test=cpu --cpu-max-prime=30000 run | grep 'avg:\|min:\|max:\|execution time' >> $FILE
done
echo " " >> $FILE

echo "test 3: --test=cpu --cpu-max-prime=10000 --max-time=30 run " >> $FILE
for i in {1..5}
do
  sysbench --test=cpu --cpu-max-prime=10000 --max-time=30 run | grep 'avg:\|min:\|max:\|execution time' >> $FILE
done
echo " " >> $FILE

echo "test 4: --test=cpu --cpu-max-prime=30000 --max-time=30 run" >> $FILE
for i in {1..5}
do
  sysbench --test=cpu --cpu-max-prime=30000 --max-time=30 run | grep 'avg:\|min:\|max:\|execution time' >> $FILE
done
echo " " >> $FILE
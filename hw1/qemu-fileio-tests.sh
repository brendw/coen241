#!/bin/bash

# QEMU Ubuntu Img - Fileio Experiments

# run with 'sudo bash fileio-tests.sh' 

# This script performs sysbench fileio tests with different arguments for 'file-total-size' and 'file-num' (number of files created; default value is 128)
# Each test is performed for 5 iteration
# Each test calls the sysbench fileio test functions to:
# 1. prepare for the test by creating files
# 2. run the actual test and greps the results for 'avg', 'min', 'max', 'execution time' (to calculate stddev) and appends to the results txt file
# 3. cleanup (delete the test files)
# 4. delete the cache so that subsequent tests don't run faster (sudo apt-get purge requires root privilige)

FILE="fileio-tests-results.txt"
touch $FILE

echo "test 1:  128 files, total size 3G" > $FILE
for i in {1..5}
do
  sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw prepare &>/dev/null
  sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw run | grep 'avg:\|min:\|max:\|execution time' >> $FILE
  sysbench --num-threads=16 --test=fileio --file-total-size=3G --file-test-mode=rndrw cleanup
  sync && apt-get purge
done
echo " " >> $FILE


echo "test 2:  256 files, total size 3G" >> $FILE
for i in {1..5}
do
	sysbench --num-threads=16 --test=fileio --file-num=256 --file-total-size=3G --file-test-mode=rndrw prepare &>/dev/null
	sysbench --num-threads=16 --test=fileio --file-num=256 --file-total-size=3G --file-test-mode=rndrw run | grep 'avg:\|min:\|max:\|execution time' >> $FILE
	sysbench --num-threads=16 --test=fileio --file-num=256 --file-total-size=3G --file-test-mode=rndrw cleanup
	sync && apt-get purge
done
echo " " >> $FILE


echo "test 3:  128 files, total size 1G" >> $FILE
for i in {1..5}
do
	sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=rndrw prepare &>/dev/null
	sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=rndrw run | grep 'avg:\|min:\|max:\|execution time' >> $FILE
	sysbench --num-threads=16 --test=fileio --file-total-size=1G --file-test-mode=rndrw cleanup
	sync && apt-get purge
done
echo " " >> $FILE


echo "test 4:  256 files, total size 1G" >> $FILE
for i in {1..5}
do
	sysbench --num-threads=16 --test=fileio --file-num=256 --file-total-size=1G --file-test-mode=rndrw prepare &>/dev/null
	sysbench --num-threads=16 --test=fileio --file-num=256 --file-total-size=1G --file-test-mode=rndrw run | grep 'avg:\|min:\|max:\|execution time' >> $FILE
	sysbench --num-threads=16 --test=fileio --file-num=256 --file-total-size=1G --file-test-mode=rndrw cleanup
	sync && apt-get purge
done
echo " " >> $FILE
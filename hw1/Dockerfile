# Dockerfile
# Create new image and run HW1 Benchmark Tests

FROM arm64v8/ubuntu

ENV user brenda

WORKDIR /home/$user

COPY hw1-docker-cpu-tests.sh .
COPY hw1-docker-fileio-tests.sh .

RUN apt-get update
RUN apt-get install -y sysbench

RUN /bin/bash hw1-docker-cpu-tests.sh
RUN /bin/bash hw1-docker-fileio-tests.sh


#!/bin/bash

DOCKER_NETWORK="hadoop"
ENV_FILE="hadoop.env"
current_branch="latest"

wordcount:
    docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hanbd/hadoop:${current_branch} hdfs dfs -mkdir -p /input/
    docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hanbd/hadoop:${current_branch} hdfs dfs -copyFromLocal /opt/hadoop-2.7.4/README.txt /input/
    docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hanbd/hadoop-wordcount
    docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hanbd/hadoop:${current_branch} hdfs dfs -cat /output/*
    docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hanbd/hadoop:${current_branch} hdfs dfs -rm -r /output
    docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hanbd/hadoop:${current_branch} hdfs dfs -rm -r /input

#!/bin/bash
set -xe

# run jar
exec java -Xms${JVM_HEAP} -Xmx${JVM_HEAP} -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15 -Dlog4j.configurationFile=log4j2.xml ${JAVA_ARGS} -jar velocity.jar

#!/bin/bash
OPTIONS=""
if [ "$1" == "inlining" ];
then
  OPTIONS="-XX:+UnlockDiagnosticVMOptions -XX:+PrintInlining -ms2G -mx2G   -javaagent:../../dd-trace-java/dd-java-agent/build/libs/dd-java-agent-$2.jar -Ddd.trace.enabled=true "
fi

if [ "$1" == "ap" ];
then
  OPTIONS="-ms2g -mx2g -agentpath:/home/richard/async-profiler-1.8.1-linux-x64/build/libasyncProfiler.so=start,event=alloc,file=alloc-$2.svg -javaagent:../../dd-trace-java/dd-java-agent/build/libs/dd-java-agent-$2.jar -Ddd.trace.enabled=true -Ddd.trace.health.metrics.enabled=false -Ddd.trace.perf.metrics.enabled=false"
fi

if [ "$1" == "cpu" ];
then
  OPTIONS="-ms2G -mx2G -javaagent:../../dd-trace-java/dd-java-agent/build/libs/dd-java-agent-$2.jar -Ddd.trace.enabled=true"
fi

if [ "$1" == "gc" ];
then
  OPTIONS="-ms2G -mx2G -verbose:gc -javaagent:../../dd-trace-java/dd-java-agent/build/libs/dd-java-agent-$2.jar -Ddd.trace.enabled=true"
fi


$JAVA_HOME/bin/java ${OPTIONS} \
    -DnbThreads=4 \
    -jar ../target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar > out_petclinic.txt

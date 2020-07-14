#!/bin/bash
OPTIONS=""
if [ "$1" == "inlining" ];
then
  OPTIONS="-XX:+UnlockDiagnosticVMOptions -XX:+PrintInlining -ms2G -mx2G   -javaagent:../../dd-trace-java/dd-java-agent/build/libs/dd-java-agent-$2.jar -Ddd.trace.enabled=true"
fi


if [ "$1" == "cpu" ];
then
  OPTIONS="-XX:+AlwaysPreTouch -ms2G -mx2G -javaagent:../../dd-trace-java/dd-java-agent/build/libs/dd-java-agent-$2.jar -Ddd.trace.enabled=true"
fi


$JAVA_HOME/bin/java ${OPTIONS} \
    -DnbThreads=200 \
    -jar ../target/spring-petclinic-2.2.0.BUILD-SNAPSHOT.jar > out_petclinic.txt

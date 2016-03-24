#!/usr/bin/env bash


gradleConfigFile="$HOME/.gradle/gradle.properties"

touch ${gradleConfigFile}
echo "org.gradle.daemon=true" >> ${gradleConfigFile}
#echo "org.gradle.parallel=true" >> ${gradleConfigFile}
echo "org.gradle.configureondemand=true" >> ${gradleConfigFile}

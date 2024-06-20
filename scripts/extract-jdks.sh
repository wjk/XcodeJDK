#!/bin/sh

#  extract-jdks.sh
#  XcodeJDK
#
#  Created by William Kent on 6/20/24.
#

set -e

cd ${DERIVED_FILE_DIR}

if [ ! -f openjdk-${JDK_VERSION}-x64.extract ]; then
    echo Extracting openjdk-${JDK_VERSION}-x64.tar.gz

    tar xf openjdk-${JDK_VERSION}-x64.tar.gz
    mv jdk-${JDK_VERSION}.jdk jdk-${JDK_VERSION}-x64.jdk
    touch openjdk-${JDK_VERSION}-x64.extract
fi

if [ ! -f openjdk-${JDK_VERSION}-arm64.extract ]; then
    echo Extracting openjdk-${JDK_VERSION}-arm64.tar.gz

    tar xf openjdk-${JDK_VERSION}-arm64.tar.gz
    mv jdk-${JDK_VERSION}.jdk jdk-${JDK_VERSION}-arm64.jdk
    touch openjdk-${JDK_VERSION}-arm64.extract
fi

#!/bin/sh

#  download-jdks.sh
#  XcodeJDK
#
#  Created by William Kent on 6/20/24.
#

set -e

cd ${DERIVED_FILE_DIR}

if [ ! -f openjdk-${JDK_VERSION}-x64.stamp ]; then
    echo Downloading Intel JDK...
    echo https://${JDK_DOWNLOAD_URL_INTEL}
    curl -C - -sLo openjdk-${JDK_VERSION}-x64.tar.gz "https://${JDK_DOWNLOAD_URL_INTEL}"
    touch openjdk-${JDK_VERSION}-x64.stamp
fi

if [ ! -f openjdk-${JDK_VERSION}-arm64.stamp ]; then
    echo Downloading Apple silicon JDK...
    echo https://${JDK_DOWNLOAD_URL_ARM64}
    curl -C - -sLo openjdk-${JDK_VERSION}-arm64.tar.gz "https://${JDK_DOWNLOAD_URL_ARM64}"
    touch openjdk-${JDK_VERSION}-arm64.stamp
fi

mkdir -p ${SRCROOT}/merged_jdk
if [ ! -f ${SRCROOT}/merged_jdk/openjdk-${JDK_VERSION}-src.zip ]; then
    echo Downloading OpenJDK source...
    echo https://${JDK_DOWNLOAD_URL_SOURCE}
    curl -C - -sLo openjdk-${JDK_VERSION}-src.zip "https://${JDK_DOWNLOAD_URL_SOURCE}"
    mv -f openjdk-${JDK_VERSION}-src.zip ${SRCROOT}/merged_jdk
fi

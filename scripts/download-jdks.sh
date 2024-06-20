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

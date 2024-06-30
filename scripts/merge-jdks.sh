#!/bin/sh

#  merge-jdks.sh
#  XcodeJDK
#
#  Created by William Kent on 6/20/24.
#

set -e
IFS='
'

cd ${DERIVED_FILE_DIR}
mkdir -p ${SRCROOT}/merged_jdk

cd jdk-${JDK_VERSION}-x64.jdk
find . -type d -print | while read directory; do
    echo mkdir ${directory}
    mkdir -p ${SRCROOT}/merged_jdk/${directory}
done

cd ../jdk-${JDK_VERSION}-arm64.jdk
find . -type d -print | while read directory; do
    if [ ! -d ${SRCROOT}/merged_jdk/${directory} ]; then
        echo "Directory in ARM JDK not in Intel JDK: ${directory}"
        exit 1
    fi
done

is_macho () {
    file $1 | fgrep -q Mach-O && return 0 || return 1
}

do_copy () {
    cp -c $1 $2 || cp $1 $2
}

cd ../jdk-${JDK_VERSION}-x64.jdk
find . -type f | while read file; do
    if is_macho $file; then
        echo lipo $file
        rm -f ${SRCROOT}/merged_jdk/${file}
        lipo -create -output ${SRCROOT}/merged_jdk/${file} $file ../jdk-${JDK_VERSION}-arm64.jdk/${file}
        chmod u+w ${SRCROOT}/merged_jdk/${file}
    else
        echo cp $file
        rm -f ${SRCROOT}/merged-jdk/${file}
        do_copy $file ${SRCROOT}/merged_jdk/${file}
        chmod u+w ${SRCROOT}/merged_jdk/${file}
    fi
done

cd ${DERIVED_FILE_DIR}
touch jdk-merge.stamp

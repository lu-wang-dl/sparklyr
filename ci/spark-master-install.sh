#!/usr/bin/env bash

set -eux -o pipefail

SPARK_VERSION="3.0.0-SNAPSHOT"

SPARK_BUILD="spark-${SPARK_VERSION}-bin-hadoop2.7"

_script_dir_="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

spark_tarball="${SPARK_BUILD}.tgz"

function try_download_latest_snapshot {
    local spark_url="https://ml-team-public-read.s3-us-west-2.amazonaws.com/spark-3.0.0-SNAPSHOT-bin-hadoop2.7.tgz"
    echo "Spark build URL = $spark_url"
    wget --tries=3 ${spark_url}
}

mkdir -p "${HOME}/spark"

try_download_latest_snapshot

echo "Content of directory:"
ls -la
tar -zxf "${spark_tarball}"

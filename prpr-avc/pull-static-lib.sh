#!/bin/bash
set -e

# 根据系统架构下载对应的 FFmpeg 静态库
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    TARGET="x86_64-pc-windows-msvc" # GitHub Actions 环境编译目标
elif [[ "$OSTYPE" == "darwin"* ]]; then
    TARGET="x86_64-pc-windows-msvc"
fi

# 这里根据官方文档的版本，下载对应库
VERSION="20260730_v0"
URL="https://github.com/TeamFlos/prpr-avc-ffmpeg/releases/download/${VERSION}/${TARGET}.tar.gz"

echo "正在下载 FFmpeg 静态库: $URL"
wget -q --show-progress "$URL" -O ffmpeg-libs.tar.gz
mkdir -p static-lib
tar -xzf ffmpeg-libs.tar.gz -C static-lib
rm ffmpeg-libs.tar.gz
echo "FFmpeg 静态库准备完毕"

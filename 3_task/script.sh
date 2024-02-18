#!/bin/bash

# Общая продолжительность видеофайлов в текущем каталоге и подкаталогах
total_duration=$(find . -type f -name "*.mp4" -exec ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 {} \; | awk '{s+=$1} END {printf "%02d:%02d:%02d\n",s/3600,s%3600/60,s%60}')

echo "Общая продолжительность всех видеофайлов: $total_duration"

# Продолжительность видеофайлов по папкам
find . -type d -exec sh -c 'echo "Папка: {}"; find "{}" -maxdepth 1 -type f -name "*.mp4" -exec ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 {} \; | awk "{s+=\$1} END {printf \"Продолжительность: %02d:%02d:%02d\n\",s/3600,s%3600/60,s%60}"' \;


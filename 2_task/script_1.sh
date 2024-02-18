#!/bin/bash

# Устанавливаем параметры
FOLDER="/path/to/your/folder" # Путь к папке с bag-файлами
DAYS=7 # Удаление файлов старше 7 дней
THRESHOLD=20 # Порог свободного места (%)

# Проверяем свободное место на диске
space=$(df -h $FOLDER | tail -1 | awk '{print $5}' | sed 's/%//')
if [ $space -lt $THRESHOLD ]; then
    find $FOLDER -name "*.bag" -type f -mtime +$DAYS -exec rm {} \;
fi

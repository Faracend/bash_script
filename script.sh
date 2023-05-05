#!/bin/bash

# Получаем названия файлов из аргументов командной строки
input_file=$1
output_file=$2

# Определяем слово, которое будем искать в строках
read -p "Введите слово, которое будем искать: " word

# Определяем, какие строки будем считать
read -p "Введите тип подсчета строк (all symbols или num of lines): " count_type

# Считаем количество строк, удовлетворяющих заданным значениям
if [ "$count_type" = "all symbols" ]; then
    count=$(cat "$input_file" | tr -cd "$word" | wc -c)
else
    count=$(grep -c "$word" "$input_file")
fi

# Записываем результат в файл вывода
echo "Количество строк с словом '$word': $count" > "$output_file"
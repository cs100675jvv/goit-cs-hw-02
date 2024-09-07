#!/bin/bash

# Список вебсайтів для перевірки
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

# Назва файлу для запису результатів
log_file="website_status.log"

# Очищення файлу перед записом нових результатів
> $log_file

# Перевірка доступності кожного вебсайту
for url in "${websites[@]}"
do
    # Використання curl для отримання статусу відповіді (тільки заголовки)
    status=$(curl -Is "$url" | head -n 1)

    # Перевірка наявності коду 200 OK у відповіді
    if [[ $status == *"200"* ]]; then
        echo "<$url> is UP" | tee -a $log_file
    else
        echo "<$url> is DOWN" | tee -a $log_file
    fi
done

# Після виконання виведення повідомлення
echo "Результати записано у файл $log_file"

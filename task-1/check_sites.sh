#!/bin/bash

# Масив з URL вебсайтів, які потрібно перевірити
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Ім'я файлу логів
log_file="website_status.log"

# Очищуємо файл логів перед записом нових даних
> $log_file

# Функція для перевірки доступності сайту
check_website() {
    url=$1
    status_code=$(curl -o /dev/null -s -w "%{http_code}" $url)

    if [ $status_code -eq 200 ]; then
        echo "<$url> is UP" | tee -a $log_file
    else
        echo "<$url> is DOWN" | tee -a $log_file
    fi
}

# Перевірка кожного сайту зі списку
for website in "${websites[@]}"; do
    check_website $website
done

# Вивід повідомлення про завершення
echo "Результати записано у файл логів: $log_file"

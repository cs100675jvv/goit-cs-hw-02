#!/bin/bash

# chmod +x myscript.sh
# Визначаємо масив з URL вебсайтів для перевірки
sites=(
  "google.com"
  "facebook.com"
  "twitter.com"
  "nonsense.notcom"
)

# Назва файлу логів
logfile="website_status.log"

# Очищаємо файл логів перед записом нових даних
> "$logfile"

# Функція для перевірки статусу сайту
check_site() {
  if curl -s --head "$1" | grep "200" > /dev/null; then
    echo "$1 is UP"
  else
    echo "$1 is DOWN" >> "$logfile"
  fi
}

# Перебір кожного сайту з масиву та виклик функції check_site
for site in "${sites[@]}"; do
  check_site "$site"
done

# Виводимо повідомлення про те, що результати записано у файл логів
echo "Results have been logged to $logfile"
# Використовуємо офіційний образ Python
FROM python:3.12

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо файли requirements.txt та встановлюємо залежності
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь проект у контейнер
COPY . .

# Відкриваємо порт 8000 для доступу до вебзастосунку
EXPOSE 8000

# Команда для запуску програми
CMD ["python", "main.py"]
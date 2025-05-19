Вот **красиво оформленный `README.md`**, полностью готовый к пушу в репозиторий:

````markdown
# 🛠️ Тестовое задание: Мониторинг процесса `test`

## 📄 Описание

Скрипт на Bash для мониторинга процесса `test` в среде Linux. Отрабатывает каждую минуту и выполняет следующие действия:

- Проверяет, запущен ли процесс `test`
- Если запущен — выполняет HTTPS-запрос на `https://test.com/monitoring/test/api`
- Если процесс был **перезапущен** (сменился PID) — записывает это в лог
- Если **сервер мониторинга недоступен** — также пишет в лог
- Автоматически запускается при старте системы с помощью `systemd`-таймера

---

## 📁 Содержимое проекта

| Файл                      | Описание                                           |
|---------------------------|----------------------------------------------------|
| `monitor_test.sh`         | Основной Bash-скрипт мониторинга процесса          |
| `test-monitor.service`    | systemd unit-файл для запуска скрипта              |
| `test-monitor.timer`      | Таймер systemd — запускает `monitor_test.sh` каждую минуту |
| `README.md`               | Текущий файл с инструкцией и описанием задания     |

---

## 🚀 Установка

### 1. Установка скрипта

```bash
sudo cp monitor_test.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/monitor_test.sh
````

### 2. Установка systemd unit и таймера

```bash
sudo cp test-monitor.service /etc/systemd/system/
sudo cp test-monitor.timer /etc/systemd/system/
```

### 3. Активация таймера

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now test-monitor.timer
```

---

## 📝 Логирование

* 📄 Лог ошибок и событий: `/var/log/monitoring.log`
* 💾 PID последнего отслеженного процесса: `/var/run/test_monitor_last_pid`

---

## ✅ Пример логов

```text
2025-05-19 15:47:23 Failed to reach monitoring server at https://test.com/monitoring/test/api
2025-05-19 15:47:37 Process 'test' restarted. New PID: 384850
```

---

## 📎 Автор

- Telegram: [@techpvpit](https://t.me/techpvpit)  
- Email: techpvpit@mail.ru


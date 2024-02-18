Перезапустить systemd и добавить скрипт в автозагрузку:

sudo systemctl daemon-reload
sudo systemctl enable bagcleaner.service
sudo systemctl start bagcleaner.service

Проверить статус сервиса:

systemctl status bagcleaner.service

После выполнения этих шагов, скрипт будет автоматически запускаться согласно расписанию.

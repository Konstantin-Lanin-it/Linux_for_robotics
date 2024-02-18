#Шаги по установке и настройке решения:
#Создание скрипта для запуска ROS-узлов: Создадим скрипт с именем start_nodes.sh по пути /home/user/scripts/ со следующим содержимым:

source /opt/ros/melodic/setup.bash
source /path/to/your/workspace/devel/setup.bash
rosrun package_name node_name &


#Данный скрипт активирует необходимые среды ROS и запускает узел ROS.
#Создание systemd unit файла: Создадим файл с именем start_nodes.service по пути /etc/systemd/system/ со следующим содержимым:


[Unit]
Description=Start ROS nodes on boot
After=network.target

[Service]
Type=simple
ExecStart=/home/user/scripts/start_nodes.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target



#После создания скрипта и unit файла необходимо выполнить следующие команды:


sudo chmod +x /home/user/scripts/start_nodes.sh
sudo systemctl daemon-reload
sudo systemctl enable start_nodes.service


#Перезагрузите систему и убедитесь, что узлы ROS запускаются автоматически при старте:


systemctl status start_nodes.service


#Для проверки работы узлов можно выполнить команду rosnode list и убедиться, что узел запущен.
#При необходимости можно просмотреть логи запущенного узла с помощью команды journalctl -u start_nodes.service
#Для дополнительного контроля и управления запущенными узлами можно использовать команды systemctl start/stop/restart start_nodes.service
#Подтверждение работоспособности:
#Вывод команды systemctl status должен показывать, что узлы ROS успешно запущены при старте системы.

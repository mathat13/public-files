find /shares/dfsroot -type f \( -iname \ProductionCode.exe -o -iname \Tests.exe \) -exec chmod +x '{}' \;

inotifywait -m -r -e close_write --format "%w%f" "~/testdir"


[Unit]
Description=Watch SMB share for executable files and set permissions
After=network.target

[Service]
ExecStart=/home/bestguy/.local/scripts/inotify/bin/inotify.sh
Restart=always
User=nobody
Group=nogroup
StandardOutput=append:/var/log/smb_exec_watch.log
StandardError=append:/var/log/smb_exec_watch.log

[Install]
WantedBy=multi-user.target


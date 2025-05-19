#!/bin/bash

PROCESS_NAME="test"
API_URL="https://test.com/monitoring/test/api"
LOG_FILE="/var/log/monitoring.log"
STATE_FILE="/var/run/test_monitor_last_pid"

PID=$(pgrep -f "$PROCESS_NAME" | head -n 1)

if [ -z "$PID" ]; then
    exit 0
fi

if [ -f "$STATE_FILE" ]; then
    LAST_PID=$(cat "$STATE_FILE")
    if [ "$LAST_PID" != "$PID" ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') Process '$PROCESS_NAME' restarted. New PID: $PID" >> "$LOG_FILE"
    fi
fi

echo "$PID" > "$STATE_FILE"

curl -s --head --request GET "$API_URL" --max-time 5 | grep "200 OK" > /dev/null
if [ $? -ne 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') Failed to reach monitoring server at $API_URL" >> "$LOG_FILE"
fi

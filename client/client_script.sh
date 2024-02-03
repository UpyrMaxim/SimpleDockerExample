#!/bin/sh

echo "Hello from docker client" | nc server_container 12345

echo "Message was send and client will turn off" > just_report.txt

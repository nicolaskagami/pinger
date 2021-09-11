#!/bin/bash
apt install -y apache2 gnuplot
mkdir -p /var/log/pinger
mkdir -p /etc/pinger
mkdir -p /var/www/html/pinger
mkdir -p /var/www/html/pinger/history

cp ./pinger /usr/bin/
cp ./pinger_master /usr/bin/
cp ./pinger_plot /usr/bin/
cp ./liveplot.gnu /etc/pinger/
if ! [ -f "/etc/pinger/targes.csv" ];then
	cp ./targets.csv /etc/pinger/targets.csv
fi
cp ./pinger.service /etc/systemd/system/
systemctl start pinger
systemctl enable pinger
systemctl daemon-reload

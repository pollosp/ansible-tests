#!/bin/bash
tar cvfz  /tmp/$(date +%d-%m-%y)-webs.tar.gz /srv/wordpress/* 1 2> /tmp/wordpress-$(date +%d-%m-%y).log
/usr/bin/mysqldump --single-transaction wordpress > /tmp/wordpressx-$(date +%d-%m-%y)-BBDD.sql
/usr/bin/s3cmd put  /tmp/$(date +%d-%m-%y)-webs.tar.gz s3://wordpress-dorota
/usr/bin/s3cmd put /tmp/wordpress-$(date +%d-%m-%y).log s3://wordpress-dorota
/usr/bin/s3cmd put  /tmp/wordpressx-$(date +%d-%m-%y)-BBDD.sql  s3://wordpress-dorota
/usr/bin/s3cmd put /tmp/$(date +%d-%m-%y)-webs-conf.tar.gz s3://wordpress-dorota
/usr/bin/s3cmd put /tmp/wordpress-etc$(date +%d-%m-%y).log s3://wordpress-dorota
rm /tmp/$(date +%d-%m-%y)-webs.tar.gz
rm /tmp/wordpress-$(date +%d-%m-%y).log
rm /tmp/wordpressx-$(date +%d-%m-%y)-BBDD.sql

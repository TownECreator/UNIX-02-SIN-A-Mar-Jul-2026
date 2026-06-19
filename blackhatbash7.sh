#!/bin/bash

grep "35.237.4.214" log.txt

grep "35.237.4.214\|13.66.139.0" log.txt #backslash signifies scape character, can be replaced by -e

grep -e "35.237.4.214" -e "13.66.139.0" log.txt

ps | grep TTY

ps | grep -i tty

grep -v "35.237.4.214" log.txt

grep -o "35.237.4.214" log.txt

awk '{print $1}' log.txt

#case apart, we recommend using apache parquet

awk '{print $1,$2,$3}' log.txt

awk '{print $2}' log.txt

awk '{print $3}' log.txt

awk '{print $1,$NF}' log.txt

cat << 'EOF' > example_csv.txt
Juan,Perez,Quito
Maria,Gomez,Guayaquil
Carlos,Andrade,Cuenca
EOF
awk -F',' '{print $1}' example_csv.txt

head log.txt

awk 'NR < 10' log.txt

grep "42.236.10.117" log.txt
awk '{print $7}' log.txt
grep "42.236.10.117" log.txt | awk '{print $7}'


sed 's/Mozilla/Godzilla/g' log.txt

sed 's/Mozilla/Godzilla/g' log.txt > new_log.txt

 sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt

  sed '1d' newlog.txt
   sed -i '1d' newlog.txt
   git diff

sed -i '$d' newlog.txt

wc -l log.txt newlog.txt

sed 's/ //g' newlog.txt > newlog1.txt

sed '8,10d' newlog1.txt

sed -n '10,15 p' log.txt
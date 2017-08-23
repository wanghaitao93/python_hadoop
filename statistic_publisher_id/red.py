# -*- encoding=utf-8 -*-

import sys

pre_key = ""
count = 0
publisher_id_count = {}

for line in sys.stdin:
    line = line.strip()
    line_sp = line.split(' ')
    
    key = line_sp[0]
    num = int(line_sp[1]) 
    
    if key != pre_key and pre_key != "":
        publisher_id_count[key] = count
        count = 0 
    
    count += num 
    pre_key = key

if pre_key != "":
    publisher_id_count[key] = count

for key, count in publisher_id_count.items():
    print key + '\t' + str(count)

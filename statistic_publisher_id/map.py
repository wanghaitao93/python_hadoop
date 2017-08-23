# -*- encoding=utf-8 -*-

import sys
import random
import re
import logging

logging.basicConfig(level = logging.INFO)

for line in sys.stdin:

    line = line.strip()
    pattern = "<publisher_id>(.*)</publisher_id>" 
    publisher_id = re.findall(pattern, line, re.I|re.M)[0]

    print publisher_id, 1 
    

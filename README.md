# python_hadoop

use python language dev mapredce programming.

 - statistic_publisher_id is statistic publisher_id count

    sh -x run.sh -->  run programming 
    
    file_name | func
    --- | ---
    run.sh  |mapreduce config info, include input/output path, map & red programming, map & red task num, and so on!
    map.sh  |run map.py
    map.py  |run map programmnig, handle input data
    red.sh  |run red.py
    red.py  |run red programmnig, handle map output data and output statistics data 
    original_data   | test data
    part-00000      | output data
    
    
    if you want to test programming in local, you just run

        cat original_data | python map.py 
        cat original_data | python map.py | python red.py
    

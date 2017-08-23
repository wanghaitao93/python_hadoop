#!/bin/bash

source ~/.bash_profile

input_path=/app/ps/spider/ps-scholar/scholarbase/partners/zhongjiaotu_Part*
output_path=/app/ps/spider/ps-scholar/scholarbase/partners/zhongjiaotu_output
HADOOP_BIN=$HADOOP_HOME
${HADOOP_BIN} fs -rmr ${output_path}
${HADOOP_BIN} streaming \
        -input "${input_path}" \
        -output "${output_path}" \
        -mapper "sh -x map.sh" \
        -reducer "sh -x red.sh" \
        -file "./map.sh" \
        -file "./map.py" \
        -file "./red.sh" \
        -file "./red.py" \
        -partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner \
        -cacheArchive "/app/ps/spider/ps-scholar/wanghaitao04/jumbo.tar.gz"#"mypython" \
        -jobconf mapred.job.name="get_random_query" \
        -jobconf mapred.map.tasks=100 \
        -jobconf mapred.reduce.tasks=1 \
        -jobconf mapred.job.map.capacity=2000 \
        -jobconf mapred.reduce.slowstart.completed.maps=0.8 \
        -jobconf mapred.job.reduce.capacity=1000 \
        -jobconf stream.memory.limit=1000 \
        -jobconf stream.map.output.field.separator="	" \
        -jobconf stream.num.map.output.key.fields=1 \
        -jobconf map.output.key.field.separator="	" \
        -jobconf num.key.fields.for.partition=1 \
        -jobconf mapred.job.priority=VERY_HIGH

#!/bin/bash

# 检查参数是否正确
if [ "$#" -ne 3 ]; then
    echo "Auto batch submit tasks under threshold."
    echo "用法: $0 <任务文件> <任务并行数量> <pgrep监控软件名>"
    exit 1
fi

# 要提交的任务文件
task_file="$1"

# BWA 进程数量的阈值
threshold="${2:-20}"

# 查找 BWA 进程的匹配参数
pgrep_args="${3:-bwa}"

# 记录已提交的任务的文件
submitted_tasks_file=${task_file}".submitted_tasks.txt"

# 检查任务文件是否存在
if [ ! -f "$task_file" ]; then
    echo "任务文件不存在: $task_file"
    exit 1
fi

# 检查是否存在已提交任务的记录文件，如果不存在则创建
if [ ! -f "$submitted_tasks_file" ]; then
    touch "$submitted_tasks_file"
fi

# 循环检查任务状态并提交新任务
while true; do
    # 获取当前 BWA 进程数
    current_processes=$(pgrep -c -f "$pgrep_args")

    # 如果当前进程数小于阈值，提交新任务
    if [ "$current_processes" -lt "$threshold" ]; then
        echo "当前$pgrep_args进程数为 $current_processes，小于阈值 $threshold，提交新任务..."

        # 检查任务文件中的每一行
        while IFS= read -r line; do
            # 检查任务是否已经提交过
            if ! grep -Fxq "$line" "$submitted_tasks_file"; then
                # 提交任务
                echo "提交任务：$line"
                echo "$line"|sh
                # 在此处添加提交任务的命令，例如：qsub "$line"
                # 注意：这里的命令需要根据你的系统和任务提交工具进行修改

                # 记录已提交的任务
                echo "$line" >> "$submitted_tasks_file"
            fi
        done < "$task_file"

        # 提交任务后，等待一段时间以免过快检查进程数
        sleep 5
    else
        # 进程数大于等于阈值，等待一段时间后再次检查
        sleep 60
    fi
done

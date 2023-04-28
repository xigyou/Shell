读入两个表来实现。在多台服务器快速建立相同的用户？
表1表头为：服务器IP 用户名 密码  表2表头为：用户名 用户home目录  用户组  组id。
以下脚本将在每个服务器上创建用户，并为每个用户生成一个 SSH 密钥对。用户将使用此密钥对登录所有服务器。

假设表1（servers.csv）的内容如下：

服务器IP,用户名
192.168.1.2,user1
192.168.1.3,user2

假设表2（users.csv）的内容如下：

javascript

用户名,用户home目录,用户组,组id
user1,/home/user1,group1,1001
user2,/home/user2,group2,1002

以下是处理这两个表格并在相应服务器上创建用户和 SSH 密钥对的脚本：

bash

#!/bin/bash

# 读取表2的内容并将其保存到关联数组
declare -A USERS
while IFS=',' read -r username home_dir user_group group_id; do
    if [[ "$username" != "用户名" ]]; then
        USERS["$username"]="$home_dir,$user_group,$group_id"
    fi
done < users.csv

# 遍历表1并在相应服务器上创建用户和 SSH 密钥对
while IFS=',' read -r server_ip username; do
    if [[ "$server_ip" != "服务器IP" ]]; then
        user_info="${USERS[$username]}"
        IFS=',' read -r home_dir user_group group_id <<< "$user_info"
        
        echo "Creating user $username and generating SSH key pair on server $server_ip..."
        ssh root@$server_ip "\
            groupadd -g $group_id $user_group; \
            useradd -m -d $home_dir -s /bin/bash -g $user_group -u $group_id $username; \
            mkdir -p $home_dir/.ssh; \
            chown $username:$user_group $home_dir/.ssh; \
            chmod 700 $home_dir/.ssh; \
            sudo -u $username ssh-keygen -t rsa -N '' -f $home_dir/.ssh/id_rsa; \
            cat $home_dir/.ssh/id_rsa.pub >> $home_dir/.ssh/authorized_keys; \
            chown $username:$user_group $home_dir/.ssh/authorized_keys; \
            chmod 600 $home_dir/.ssh/authorized_keys"
    fi
done < servers.csv

echo "User creation and SSH key pair generation completed."

    将上述脚本内容保存为一个文件，例如 create_users_keys.sh。

    使脚本可执行：

    bash

chmod +x create_users_keys.sh

运行脚本：

bash

    ./create_users_keys.sh

脚本将从表1（servers.csv）读取服务器信息，从表2（users.csv）读取用户信息，并在相应的服务器上创建用户和 SSH 密钥对。用户可以使用生成的密钥对登录所有服务器。

注意：在生产环境中，请使用更安全的方法（例如，配置管理工具）创建和管理服务器上的用户。这里的示例仅用于演示目的。

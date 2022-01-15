# k8s-cluster

# analysis:https://github.com/jindezgm/k8s-src-analysis

### 设置系统主机名以及Host文件的相互解析
    hostnamectl set-hostname k8s-master01

### 安装依赖包
    yum install -y conntrack ntpdate ntp ipvsadm ipset jq iptables curl systat libseccomp wget vim net-tools git

### 设置防火墙为Iptables并设置空规则
    systemctl stop firewalld && systemctl disable firewalld
    yum -y install iptables-services && systemctl start iptables && systemctl enable iptables && iptables -F && service iptables save

### 关闭SELINUX
    swapoff -a && sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
    setenforce 0 && sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config

### 调整内核参数，对k8s
    cat > kubernetes.conf << EOF
    net.bridge.bridge-nf-call-iptables=1
    net.bridge.bridge-nf-call-ip6tables=1
    net.ipv4.ip_forward=1
    net.ipv4.tcp_tw_recycle=0
    vm.swappiness=0 # 禁止使用swap空间，只有当系统OOM时才允许使用它
    vm.overcommit_memory=1 # 不检查物理内存是否够用
    vm.panic_on_oom=0 # 开启OOM
    fs.inotify.max_user_instances=8192
    fs.inotify.max_user_eatches=1048576
    fs.file-max=52706963
    fs.nr_open=52706963
    net.ipv6.conf.all.disable_ipv6=1
    net.netfilter.nf_conntrack_max=2310720
    EOF
    cp kubernetes.conf /etc/sysctl.d/kubernetes.conf
    sysctl -p /etc/sysctl.d/kubernetes.conf

### 调整系统时区
    # 设置系统时区为 中国/上海
    timedatectl set-timezoone Asia/Shanghai
    # 将当前的 UTC 时间写入硬件时钟
    timedatectl set-local-rtc 0
    # 重启依赖于系统时间的服务
    systemctl restart rsyslog
    systemctl restart crond

### 关闭系统不需要的服务
    systemctl stop postfix && systemctl disable postfix



# =============================================================================
# jdeathe/centos-ssh
#
# CentOS-7 7.3.1611 x86_64 - SCL/EPEL/IUS Repos. / Supervisor / OpenSSH.
# 
# =============================================================================
FROM centos:7.3.1611

	
RUN yum install python python-pip python-m2crypto libnet1-dev libpcap0.8-dev libnet libpcap libnet-devel libpcap-devel git gcc -y
RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN chmod +x build.sh
RUN ./build.sh

RUN yum install wget -y
RUN wget --no-check-certificate https://raw.githubusercontent.com/liangqi20001/shadowsocks_install/master/shadowsocksR.sh
RUN chmod +x shadowsocksR.sh
RUN ./shadowsocksR.sh 2>&1 | tee shadowsocksR.log

CMD ["/usr/bin/supervisord", "--configuration=/etc/supervisord.conf"]

FROM centos:7

LABEL maintainer="hanbd <hanbd@foxmail.com>" 

RUN buildDeps='java-1.8.0-openjdk java-1.8.0-openjdk-devel perl perl-devel which nmap-ncat' \
	&& yum update -y \
	&& yum install -y $buildDeps \
	&& yum -y clean all

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk/
ENV HADOOP_VERSION 2.7.7
ENV HADOOP_URL https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz
ENV HADOOP_ASC https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz.asc

RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS \
	&& gpg --import KEYS

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_ASC" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc \
    && tar -xf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
	&& cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml \
	&& mkdir /opt/hadoop-$HADOOP_VERSION/logs \
	&& mkdir /hadoop-data

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1

ENV USER=root
ENV PATH $HADOOP_PREFIX/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
# hadoop-training
Hadoop training

__Installing Hadoop (CentOS)__

```
# yum install java-1.7.0-openjdk
```

Add to ~/.bash_profile
```
export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk
export PATH=$PATH:$JAVA_HOME/bin

export HADOOP_HOME=/vagrant/hadoop
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
```

Run from shell
```
# ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
# cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
# ssh localhost
```

```
# vi etc/hadoop/core-site.xml

<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>
```

```
# vi etc/hadoop/hdfs-site.xml

<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
```

```
# vi etc/hadoop/hadoop-env.sh

export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk
```

```
# hdfs namenode -format
```

```
# start-dfs.sh
# hdfs dfs -mkdir /user
# hdfs dfs -mkdir /user/username
# mkdir input
# cp etc/hadoop/*.xml input
# bin/hdfs dfs -put etc/hadoop input
# hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.7.2.jar grep input output 'dfs[a-z.]+'
# bin/hdfs dfs -get output output
```


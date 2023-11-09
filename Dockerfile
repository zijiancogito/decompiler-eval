FROM ubuntu:latest

ENV RGD "/root/data/dsmith/"
ENV JAVA_HOME "/root/decompiler/jdk-17"
ENV JRE_HOME "/root/decompiler/jdk-17/jre"
ENV CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH=${JAVA_HOME}/bin:$PATH

WORKDIR "/root/decompiler-eval/src/"
RUN apt-get update \
	&& apt-get install -y python3 python3-pip clang 
RUN pip install cfile tqdm

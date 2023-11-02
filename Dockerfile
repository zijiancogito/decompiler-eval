FROM ubuntu:latest
ENV RGD "/root/data/dsmith/"
WORKDIR "/root/decompiler-eval/src/"
RUN apt-get update \
	&& apt-get install -y python3 python3-pip clang 
RUN pip install cfile tqdm

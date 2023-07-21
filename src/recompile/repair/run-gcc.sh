#!/bin/bash


COMPILERS=(gcc)
OPTIMIZATIONS=(o0 o1 o2 o3 os)
DECOMPILERS=(Hex-Rays BinaryNinja Ghidra RetDec)

DATA_DIR=/home/caoy/deceval/data/POJ
DE_DIR=$DATA_DIR/recompile/round-1/fail-compilation
FIXED_DIR=$DATA_DIR/recompile/round-2/fixed
UNFIXED_DIR=$DATA_DIR/recompile/round-2/unfixed
TIMEOUT_DIR=$DATA_DIR/recompile/round-2/timeout

mkdir -p $FIXED_DIR $UNFIXED_DIR $TIMEOUT_DIR

create_container(){
	name=$1_$2_$3
	# podman run -d -p $5:8000 --name $name-transfix localhost/transfix:v0
	# sleep 5s
	# podman attach $name-transfix
	# sleep 5s
	podman run -d -p $4:4444 -p $5:7900 --shm-size="2g" --name $name-webdriver selenium/standalone-firefox:latest
	# podman start $name
	sleep 5s
	python3 drrepair.py -d $DE_DIR -f $FIXED_DIR -u $UNFIXED_DIR -t $TIMEOUT_DIR -D $3 -C $1 -O $2 -p $4 -P $6 &
}

wdport=4400
hubport=7901
webport=8001

for compiler in ${COMPILERS[*]}; do
	for opt in ${OPTIMIZATIONS[*]}; do
		for decompiler in ${DECOMPILERS[*]}; do
			create_container ${compiler} ${opt} ${decompiler} ${wdport} ${hubport} ${webport}
			wdport=$((${wdport}+1))
			hubport=$((${hubport}+1))
		done
	done
done


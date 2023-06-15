#!/bin/bash

COMPILERS="clang gcc"
DECOMPILERS="angr BinaryNinja Ghidra Hex-Rays RetDec"
OPTIMIZATIONS="o0 o1 o2 o3 os"

IR_DIR=/home/eval/data/DF2/process/ir
IR_SE_DIR=/home/eval/data/DF2/se/ir
IR_SE_LOG_FILE=/home/eval/data/DF2/se/trash/ir/exe_fail
rm -r $IR_SE_DIR
mkdir -p $IR_SE_DIR
rm -r $IR_SE_LOG_FILE
mkdir -p $IR_SE_LOG_FILE
echo "Execution IRs"
python3 ./ir_se/ir_se.py -D df2 -i $IR_DIR -o $IR_SE_DIR -l $IR_SE_LOG_FILE

# echo "Check IR execution results"
# IR_CHK_LOG_DIR=/home/eval/DF2/se/trash/ir/check_log/
# IR_CHK_MOVE_DIR=/home/eval/DF2/se/trash/ir/
# rm -r $IR_CHK_LOG_DIR
# mkdir -p $IR_CHK_LOG_DIR
# rm -r $IR_CHK_MOVE_DIR
# mkdir -p $IR_CHK_MOVE_DIR
# python3 ./check/check.py -c ir -i $IR_DIR -l $IR_CHK_LOG_DIR -o $IR_CHK_MOVE_DIR

echo "Execution decompiling results of DF-de1"
DE_DIR_1=/home/eval/data/DF2/process/de1
DE_SE_DIR_1=/home/eval/data/DF2/se/de1
DE_SE_LOG_DIR_1=/home/eval/data/DF2/se/trash/de1/bug
rm -r $DE_SE_DIR_1
rm -r $DE_SE_LOG_DIR_1
mkdir -p $DE_SE_DIR_1
mkdir -p $DE_SE_LOG_DIR_1
decompilers=(angr BinaryNinja Ghidra Hex-Rays RetDec)
compilers=(clang gcc)
optis=(o0 o1 o2 o3 os)
for dec in ${decompilers[@]}
do
    for com in ${compilers[@]}
    do
        for opti in ${optis[@]}
        do
            de_dir=$DE_DIR_1/$com/$opti/$dec
            se_dir=$DE_SE_DIR_1/$com/$opti/$dec
            err_log_file=$DE_SE_LOG_DIR_1/$com/$opti/$dec.log
            i=0
            l=`ls $de_dir | wc -l`
            echo -e "\nSymbolic executing $dec result of $com $opti"
            for file in `ls $de_dir`
            do
                de_file=$de_dir/$file
                python3 ./de_se/de_se.py -e df2 -i $de_file -o $se_dir -l $err_log_file
                let i=i+1
                let num=i*100/l
                str=$(seq -s "#" $num | tr -d "[:digit:]")
                printf "[%-99s] %d%% \r" "$str" "$num"
            done
            echo "" 
        done
    done
done

echo "Count files"
python3 ./de_se/count_files.py -D df2 -d $DE_SE_DIR_1

# echo "Check symbolic execution results"
# DE_CHK_LOG_DIR_1=/home/eval/DF2/se/de/check_log1/
# DE_CHK_MOVE_DIR_1=/home/eval/DF2/se/trash/de/check_fail1
# rm -r $DE_CHK_LOG_DIR_1
# rm -r $DE_CHK_MOVE_DIR_1
# mkdir -p $DE_CHK_LOG_DIR_1
# mkdir -p $DE_CHK_MOVE_DIR_1
# python3 check.py -c de -i $DE_SE_DIR_1 -l $DE_CHK_LOG_DIR_1 -o $DE_CHK_MOVE_DIR_1

echo "Execution decompiling results of DF-de2"
DE_DIR_2=/home/eval/data/DF2/process/de2
DE_SE_DIR_2=/home/eval/data/DF2/se/de2
DE_SE_LOG_DIR_2=/home/eval/data/DF2/se/trash/de2/bug
rm -r $DE_SE_DIR_2
rm -r $DE_SE_LOG_DIR_2
mkdir -p $DE_SE_DIR_2
mkdir -p $DE_SE_LOG_DIR_2
decompilers=(angr BinaryNinja Ghidra Hex-Rays RetDec)
compilers=(clang gcc)
optis=(o0 o1 o2 o3 os)
for dec in ${decompilers[@]}
do
    for com in ${compilers[@]}
    do
        for opti in ${optis[@]}
        do
            de_dir=$DE_DIR_2/$com/$opti/$dec
            se_dir=$DE_SE_DIR_2/$com/$opti/$dec
            err_log_file=$DE_SE_LOG_DIR_2/$com/$opti/$dec.log
            i=0
            l=`ls $de_dir | wc -l`
            echo -e "\nSymbolic executing $dec result of $com $opti"
            for file in `ls $de_dir`
            do
                de_file=$de_dir/$file
                python3 ./de_se/de_se.py -e df2 -i $de_file -o $se_dir -l $err_log_file
                let i=i+1
                let num=i*100/l
                str=$(seq -s "#" $num | tr -d "[:digit:]")
                printf "[%-99s] %d%% \r" "$str" "$num"
            done
            echo "" 
        done
    done
done

echo "Count files"
python3 count_files.py -D df2 -d $DE_SE_DIR_2


# echo "Check symbolic execution results of DF-de2"
# DE_CHK_LOG_DIR_2=/home/eval/DF2/se/de/check_log2
# DE_CHK_MOVE_DIR_2=/home/eval/DF2/se/trash/de/check_fail2
# rm -r $DE_CHK_LOG_DIR_2
# rm -r $DE_CHK_MOVE_DIR_2
# mkdir -p $DE_CHK_LOG_DIR_2
# mkdir -p $DE_CHK_MOVE_DIR_2
# python3 check.py -c de -i $DE_SE_DIR_2 -l $DE_CHK_LOG_DIR_2 -o $DE_CHK_MOVE_DIR_2

echo "Count files of IR SE"
python3 count_files.py -d $IR_SE_DIR -o ir -O $OPTIMIZATIONS

echo "Count files of DE SE 1"
python3 count_files.py -d $DE_SE_DIR_1 -o de -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS

echo "Count files of DE SE 2"
python3 count_files.py -d $DE_SE_DIR_2 -o de -D $DECOMPILERS -C $COMPILERS -O $OPTIMIZATIONS
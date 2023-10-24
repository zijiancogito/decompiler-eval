# decompiler-eval

## INSTALL

```
apt-get update
apt-get install python3 python3-pip
```

## USAGE

### Dataset

1. Random generate data

```
cd src/dataset/rgd

python3 gen.py -n 1000 -c ./config -s ./dsmith/source.py -o $RGD/raw/src/
python3 make.py ir --opt O0 O1 O2 O3 Os --src $RGD/raw/src/ --out $RGD/raw/ir/ --log $RGD/log/make.log 
python3 make.py bin --opt O0 O1 O2 O3 Os --src $RGD/raw/src/ --out $RGD/raw/bin/ --log $RGD/log/make.log

```

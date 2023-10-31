# decompiler-eval

## INSTALL

```
apt-get update
apt-get install python3 python3-pip clang

pip install -r requirements.txt
```

## USAGE

### Dataset

1. Random generate data

```
cd src/dataset/rgd
export RGD="/root/data/dsmith"
python3 gen.py -n 2000 -c ./config -s ./dsmith/source.py -o $RGD/raw/src/
python3 make.py --opt O0 O1 O2 O3 Os --src $RGD/raw/src/ --out $RGD/raw/ir/ --log $RGD/log/make.log ir
python3 make.py --opt O0 O1 O2 O3 Os --src $RGD/raw/src/ --out $RGD/raw/bin/ --log $RGD/log/make.log bin

```

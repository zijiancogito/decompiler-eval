# README


### ir generate and preprocess

- **step 1:** compile IR from source code ` data\_process/raw\_data\_gen/code\_gen/make\_ir.sh`.

- **step 2:** preprocess IR, remove "attr" instructions from ir file. Remove ir files containing "poison" and "select" instructions from dataset. ` data\_process/raw\_data\_gen/ir/run.sh`. check if there is still "attr" "poison" "select" after remove ` data\_process/raw\_data\_gen/ir/check.sh`.

- **step 3:** symbolic execution IR ` data\_process/se/ir\_se/exe.sh`.

- **step 4:** check invalid symbols in symbolic execution results ` data\_process/se/check/check\_ir.sh`.





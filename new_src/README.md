# README


### Compiling, preprocess and execution

- **step 1:** Compile IR from source code ` data\_process/raw\_data\_gen/code\_gen/make\_ir.sh`.

- **step 2:** Preprocess IR, remove "attr" instructions from ir file. Remove ir files containing "poison" and "select" instructions from dataset. ` data\_process/raw\_data\_gen/ir/run.sh`. check if there is still "attr" "poison" "select" after remove ` data\_process/raw\_data\_gen/ir/check.sh`.

- **step 3:** Symbolic execution IR ` data\_process/se/ir\_se/exe.sh`.

- **step 4:** Check invalid symbols in symbolic execution results ` data\_process/se/check/check\_ir.sh`.

### Decompiling, preprocess and execution

- **step 1:** Decompiling `data\_process/raw\_data\_gen/decompile/run.sh`

- **step 2:** Preprocess decompiling results. First, extract our target function 'func0' from results `data_process/dec_crawler/raw/run.sh`. Second, check if there are 'if' statements in function (for DF2) and remove them, `data_process/dec_crawler/check/check_df2.sh`.

- **step 3:** Symbolic execution decompiling result `data_process/se/de_se/exe_df2.sh`.

- **step 4:** Check invalid symbols in symbolic execution results `data_process/se/check/check_df2_de.sh`.

### Analyze decompiling results

- **Accuracy of Function:** *feature* and *concolic* accuracy of functions `analyze/acc/df2_acc.sh`

- **Loc of Function:** $Loc(decompiling) / Loc(source)$ and $Loc(decompiling) / Loc(IR)$ `analyze/loc/df2_loc.sh`

- **Var of Function:** $Var(decompiling) / Var(source)$ and $Var(decompiling) / Var(IR)$ `analyze/var/df2_var.sh`

### Experiment

- **EX1:**

- **EX2:**


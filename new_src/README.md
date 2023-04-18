# README


### Compiling, preprocess and execution

- **step 1:** Compile IR from source code ` data_processgraw_data_gen/code_gen/make_ir.sh`.

- **step 2:** Preprocess IR, remove "attr" instructions from ir file. Remove ir files containing "poison" and "select" instructions from dataset. ` data_process/raw_data_gen/ir/run.sh`. check if there is still "attr" "poison" "select" after remove ` data_process/raw_data_gen/ir/check.sh`.

- **step 3:** Symbolic execution IR ` data_process/se/ir_se/exe.sh`.

- **step 4:** Check invalid symbols in symbolic execution results ` data_process/se/check/check_ir.sh`.

### Decompiling, preprocess and execution

- **step 1:** Decompiling `data_process/raw_data_gen/decompile/run.sh`

- **step 2:** Preprocess decompiling results. First, extract our target function 'func0' from results `data_process/dec_crawler/raw/run.sh`. Second, check if there are 'if' statements in function (for DF2) and remove them, `data_process/dec_crawler/check/check_df2.sh`.

- **step 3:** Symbolic execution decompiling result `data_process/se/de_se/exe_df2.sh`.

- **step 4:** Check invalid symbols in symbolic execution results `data_process/se/check/check_df2_de.sh`.

### Analyze decompiling results

- **Accuracy of Function:** *feature* and *concolic* accuracy of functions `analyze/acc/df2_acc.sh`

- **Loc of Function:** Loc(decompiling) / Loc(source) and Loc(decompiling) / Loc(IR) `analyze/loc/df2_loc.sh`

- **Var of Function:** Var(decompiling) / Var(source) and Var(decompiling) / Var(IR) `analyze/var/df2_var.sh`

### Experiment

- **EX1:**

- **EX2:**


# README

### Dataset generation

- **step 1:** Random generate source code `data_process/raw_data_gen/code_gen/df2_gen.sh`. Output: DF2/src/

- **step 2:** Compiling source to binary files (ELF64) `data_process/raw_data_gen/code_gen/df2_bin_make.sh`. Input: DF2/src/ Output: DF2/bin/

### Compiling, preprocess and execution

- **step 1:** Compile IR from source code ` data_process/raw_data_gen/code_gen/df2_ir_make.sh`. Then copy them to another dir. Input: DF2/src/ Output: DF2/raw/ir/ DF2/ir/

- **step 2:** Preprocess IR, remove "attr" instructions from ir file. Remove ir files containing "poison" and "select" instructions from dataset. Check if there is still "attr" "poison" "select" after remove `data_process/raw_data_gen/ir/df2_check.sh`. Input: DF2/ir/ Output: DF2/trash/ir/ir_if DF2/trash/ir/ir_poison

- **step 3:** Symbolic execution IR `data_process/se/ir_se/df2_exe.sh`. Input: DF2/ir/ Output: DF2/se/ir Log: DF2/se/trash/ir/execution_bug.log

- **step 4:** Check invalid symbols in symbolic execution results `data_process/se/check/df2_ir_check.sh`. Input: DF2/se/ir/ Output: DF2/se/trash/ir/ Log: DF2/se/trash/ir/check_log/

### Decompiling, preprocess and execution

- **step 1:** Decompiling `data_process/raw_data_gen/decompile/run.sh` Input: DF2/bin Output: DF2/raw_de

- **step 2:** Preprocess decompiling results. First, extract our target function 'func0' from results `data_process/dec_crawler/raw/run.sh`. Input: DF2/raw_de Output: DF2/de_src/ Second, check if there are 'if' statements in function (for DF2) and remove them, `data_process/dec_crawler/check/check_df2.sh`. Input: DF2/de_src/ Output: DF2/trash/de/de_if

- **step 3:** Symbolic execution decompiling result `data_process/se/de_se/exe_df2.sh`. Input: DF2/de_src/ OutPut: DF2/se/de/ Log: DF2/se/trash/de/bug/

- **step 4:** Check invalid symbols in symbolic execution results `data_process/se/check/check_df2_de.sh`. Input: DF2/se/de/ Output: DF2/se/transh/de/check/ Log: DF2/se/trash/de/check_log/

### Analyze decompiling results

- **Accuracy of Function:** *feature* and *concolic* accuracy of functions `analyze/acc/df2_acc.sh` Input: DF2/se/ir DF2/se/de Output: DF2/analyze/acc

- **Loc of Function:** Loc(decompiling) / Loc(source) and Loc(decompiling) / Loc(IR) `analyze/loc/df2_loc.sh` Input: DF2/src/ DF2/ir DF2/de_src Output: DF2/analyze/loc

- **Var of Function:** Var(decompiling) / Var(source) and Var(decompiling) / Var(IR) `analyze/var/df2_var.sh` Input: DF2/src DF2/ir DF2/de_src Output: DF2/analyze/var

### Experiment

- **EX1:**

- **EX2:**


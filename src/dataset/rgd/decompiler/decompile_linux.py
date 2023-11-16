import os
import ghidra
import retdec

from tqdm import tqdm
import argparse
import logging

from multiprocessing import Pool



def decompile_all(bindir, outdir, decompiler):
    if not os.path.exists(outdir):
        os.makedirs(outdir)
    
    binfiles = os.listdir(bindir)
    cnt_0 = 0
    cnt_1 = 0
    for binfile in tqdm(binfiles):
        binpath = os.path.join(bindir, binfile)
        outpath = os.path.join(outdir, f"{binfile}.c")
        signal = 0
        if decompiler == 'Ghidra':
            signal = ghidra.main(binpath, outpath)
        elif decompiler == 'RetDec':
            signal = retdec.main(binpath, outpath)
        else:
            raise NotImplementedError
        if signal == 1:
            logging.info(f"Decompiling succeed, {binpath}")
            cnt_1 += 1
        elif signal == 0:
            cnt_0 += 1
        else:
            logging.error(f"Decompiling failed, {binpath}")
    print(f"{cnt_1}/{len(binfiles)} BIN decompilation complete.")
    return cnt_0, cnt_1

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Decompilation')
    parser.add_argument('--msg', type=str, required=False, default='')
    parser.add_argument('--bin', type=str, required=True,help='Path to source code.')    
    parser.add_argument('--out', type=str, required=True, help='Path to save results.')
    parser.add_argument('--log', type=str, required=True, help='Path to logging.')

    parser.add_argument('--decomp', type=str, choices=['Ghidra', 'RetDec'])

    args = parser.parse_args()

    if not os.path.exists(os.path.dirname(args.log)):
        os.makedirs(os.path.dirname(args.log))

    logging.basicConfig(filename=args.log,
                        encoding='utf-8', 
                        format='%(asctime)s %(filename)s : %(levelname)s %(message)s',
                        datefmt='%Y-%m-%d %A %H:%M:%S',
                        level=logging.DEBUG,
                        filemode='a')

    print(args.msg)
    decompile_all(args.bin, args.out, args.decomp)
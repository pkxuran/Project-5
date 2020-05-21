#!/bin/bash
#SBATCH -J MatrixMult
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o matrixmul.out
#SBATCH -e matrixmul.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=yume@oregonstate.edu
for t in 16 32 64 128
do
    echo $t'\t'
    for s in 16384 32768 65536 131072 262144 524288 1024000
    do
        /usr/local/apps/cuda/cuda-10.1/bin/nvcc -DBLOCKSIZE=$t  -DNUMTRIALS=$s -o monteCarlo  monteCarlo.cu
        ./monteCarlo
    done
done

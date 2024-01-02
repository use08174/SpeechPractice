#!/bin/bash
#SBATCH -J test
#SBATCH --gres=gpu:1
#SBATCH --output=example.out
eval "$(conda shell.bash hook)"
conda activate stt


DATASET_PATH="/home/use08174/stt/kospeech/dataset/kspon/korean_audio/KSponSpeech"
VOCAB_DEST='/home/use08174/stt/kospeech/dataset/kspon'
OUTPUT_UNIT='character'                                          # you can set character / subword / grapheme
PREPROCESS_MODE='spelling'                                       # phonetic : 칠 십 퍼센트,  spelling : 70%
VOCAB_SIZE=5000                                                  # if you use subword output unit, set vocab size

echo "Training on KsponSpeech Dataset with deepSpeech2 .. "

python ./bin/main.py model=ds2 train=ds2_train train.dataset_path=$DATASET_PATH
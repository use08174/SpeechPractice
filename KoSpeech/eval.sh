#!/bin/bash
#SBATCH -J test
#SBATCH --gres=gpu:1
#SBATCH --output=example.out
eval "$(conda shell.bash hook)"
conda activate stt


DATASET_PATH="/home/use08174/stt/kospeech/dataset/kspon/korean_audio/KSponSpeech"
VOCAB_DEST='/home/use08174/stt/kospeech/dataset/kspon'
TRANSCRIPTS_PATH = "/home/use08174/stt/kospeech/data"
MODEL_PATH="/home/use08174/stt/kospeech/outputs/2024-01-02/16-49-52/model.pt"
OUTPUT_UNIT='character'                                          # you can set character / subword / grapheme
PREPROCESS_MODE='spelling'                                       # phonetic : 칠 십 퍼센트,  spelling : 70%
VOCAB_SIZE=5000                                                  # if you use subword output unit, set vocab size

echo "Evaluating for KsponSpeech Dataset.."

python ./bin/eval.py eval.dataset_path=$DATASET_PATH eval.transcripts_path=$TRANSCRIPTS_PATH eval.model_path=$MODEL_PATH
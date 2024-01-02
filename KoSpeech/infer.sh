#!/bin/bash
#SBATCH -J test
#SBATCH --gres=gpu:1
#SBATCH --output=infer.out
eval "$(conda shell.bash hook)"
conda activate stt

DATASET_PATH="/home/use08174/stt/kospeech/dataset/kspon/korean_audio/KSponSpeech"
VOCAB_DEST='/home/use08174/stt/kospeech/dataset/kspon'
MODEL_PATH="/home/use08174/stt/kospeech/outputs/2024-01-02/16-49-52/model.pt"
AUDIO_PATH="/home/use08174/Speech/발표영상.wav"                                               # if you use subword output unit, set vocab size

echo "inference on KsponSpeech Dataset with deepSpeech2 .. "

python3 ./bin/inference.py --model_path $MODEL_PATH --audio_path $AUDIO_PATH

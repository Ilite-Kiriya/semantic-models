echo "CUDNN:
  BENCHMARK: true
  DETERMINISTIC: false
  ENABLED: true
GPUS: (0,1)
OUTPUT_DIR: 'output'
LOG_DIR: 'log'
WORKERS: 4
PRINT_FREQ: 10

DATASET:
  DATASET: cityscapes
  #ROOT: /home/usyd-05a/data/
  ROOT: data/
  TEST_SET: 'list/cityscapes/val.lst'
  TRAIN_SET: 'list/cityscapes/train.lst'
  NUM_CLASSES: 19
MODEL:
  NAME: ddrnet_23_slim
  NUM_OUTPUTS: 2
  PRETRAINED: 'pretrained_models/DDRNet23s_imagenet.pth'
  ALIGN_CORNERS: false
LOSS:
  USE_OHEM: true
  OHEMTHRES: 0.9
  OHEMKEEP: 131072
  BALANCE_WEIGHTS: [1, 0.4]
TRAIN:
  IMAGE_SIZE:
  - 1024
  - 1024
  BASE_SIZE: 2048
  BATCH_SIZE_PER_GPU: $1
  SHUFFLE: true
  BEGIN_EPOCH: 0
  END_EPOCH: $2
  RESUME: false
  OPTIMIZER: sgd
  LR: $3
  WD: $4
  MOMENTUM: $5
  NESTEROV: false
  FLIP: true
  MULTI_SCALE: true
  DOWNSAMPLERATE: 1
  IGNORE_LABEL: 255
  SCALE_FACTOR: 16
TEST:
  IMAGE_SIZE:
  - 2048
  - 1024
  BASE_SIZE: 2048
  BATCH_SIZE_PER_GPU: 4
  FLIP_TEST: false
  MULTI_SCALE: false
  SCALE_LIST: [1]
  #0.5,0.75,1.0,1.25,1.5,1.75
  # MODEL_FILE: 'pretrained_models/best_val_smaller.pth'
  OUTPUT_INDEX: 1
"

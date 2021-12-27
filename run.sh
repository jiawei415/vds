#!/bin/bash

envname=$1
seed=$3
num_env=16
num_epoch=50
alg_confg="{
    'size_ensemble':16, \
    'disagreement_fun_name':'var', \
    'disagreement_type':'max', \
    'priority_temperature':1.0,
}"

time=2
export CUDA_VISIBLE_DEVICES=$2

for i in $(seq 5)
do
    tag=$(date "+%Y%m%d%H%M%S")
    python -m baselines.ve_run --env ${envname} --seed ${seed} --num_epoch ${num_epoch} --num_env ${num_env} --alg_config "${alg_confg}" > ~/logs/${envname}_${tag}_0.out 2> ~/logs/${envname}_${tag}_0.err &
    echo "run $seed $tag"
    let seed=$seed+1
    sleep ${time}
done

# ps -ef | grep ${envname} | awk '{print $2}'| xargs kill -9
# ps -ef | grep ve_run | awk '{print $2}'| xargs kill -9

# FetchReachDiscrete-v1, FetchPushDiscrete-v1, FetchSlideDiscrete-v1, FlipBit-v1
# MazeFourRooms-v1, MazeWine-v1, MazeVertical-v1, MazeHorizontal-v1, MazeEmpty-v1, MazeRandom-v1
# MazeA-v1, MazeB-v1, MazeC-v1, MazeD-v1
# PointMassEmptyEnv-v1, PointMassWallEnv-v1, PointMassRoomsEnv-v1, Point2DLargeEnv-v1, Point2DFourRoom-v1
# SawyerReachXYEnv-v1, SawyerDoorFixEnv-v1, SawyerDoorAngle-v1, SawyerDoorPos-v1
# FetchSlide-v1, FetchPush-v1, FetchPickAndPlace-v1, FetchReach-v1, Reacher-v2, HandReach-v0
# HandManipulateBlock-v0, HandManipulateBlockFull-v0, HandManipulateBlockRotateParallel-v0, HandManipulateBlockRotateXYZ-v0, HandManipulateBlockRotateZ-v0
# HandManipulateEgg-v0, HandManipulateEggFull-v0, HandManipulateEggRotate-v0
# HandManipulatePen-v0, HandManipulatePenFull-v0, HandManipulatePenRotate-v0


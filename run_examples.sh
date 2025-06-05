export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6
export PYTHONPATH=/home/yitian/Research/lib/Hand/CPF:$PYTHONPATH
export CUDA_VISIBLE_DEVICES="1,2"

############## fphab dataset, train split, visualize 3d hand & object mesh
# # 1. dump the pose and contact predictions:
# # the predictions are saved in `tmp/pred/honet+picr/fphab/dumped_pred`
# python scripts/eval.py --cfg config/HONetPiCRPipeline_fphab.yml -g 0 -b 1 --callback dump


# # 2. after dumping the results, fit pose using the grasp energy optimizer (GEO):
# # the --data_prefix is the directory where dumped predictions are saved
# # the optimized results are saved in `tmp/pred/honet+picr/fphab/optmized`
python scripts/fit.py -c config/HONetPiCRPipeline_fphab.yml -g 1,2,3 -w 2 --data_prefix tmp/pred/honet+picr/fphab/dumped_pred --runtime_viz


################## visualize the pose and contact prediction:
# # fphpab dataset, train split, visualize 3d hand & object mesh
# python scripts/viz_dataset.py  -d fphab -s train -m 3d_hand_obj

# # fphpab dataset, train split, visualize 3d hand & object mesh, and contact parts
# python scripts/viz_dataset.py -d fphab -s train -m 3d_hand_obj_contact 

# # fphpab dataset, test split, visualize 3d hand & object mesh, and contact parts
# python scripts/viz_dataset.py -d fphab -s test -m 3d_hand_obj_contact 


################## HO3Dv2 dataset, train split, visualize 3d hand & object mesh
# # (optional) visualize the pose and contact prediction: 
# # the drawings are saved in `tmp/draw/artiboost+picr/ho3dv2`
# python scripts/eval.py --cfg config/HOPose_PiCRPipeline_ho3dv2.yml -g 0 -b 1 --callback draw 


# # 1. dump the pose and contact predictions (pose is from ArtiBoost model, contact is from PiCR):
# # the predictions are saved in `tmp/pred/artiboost+picr/ho3dv2/dumped_pred` 
# python scripts/eval.py --cfg config/HOPose_PiCRPipeline_ho3dv2.yml -g 0 -b 1 --callback dump 


# # 2. after dumping the results, fit pose using the grasp energy optimizer (GEO):
# python scripts/fit.py -c config/HOPose_PiCRPipeline_ho3dv2.yml -g 0,1,2 -w 12 --data_prefix tmp/pred/artiboost+picr/ho3dv2/dumped_pred --lambda_repulsion_loss 2.0


################ visualize the pose and contact prediction:
# # ho3dv2 dataset, train split, visualize 3d hand & object mesh
# python scripts/viz_dataset.py -m 3d_hand_obj -d ho3dv2 -s train

# # ho3dv2 dataset, train split, visualize 3d hand & object mesh, and contact parts
# python scripts/viz_dataset.py -m 3d_hand_obj_contact -d ho3dv2 -s train

# @note: no hand gt is provided in the ho3dv2 test split 

# # synthetic HO3D dataset, train split, visualize 3d hand & object mesh
# python scripts/viz_dataset.py -d ho3dsyntht -s train -m 3d_hand_obj_contact
# python scripts/viz_dataset.py -d ho3dycba   -s train -m 3d_hand_obj_contact

################ DexYCB dataset, train split, visualize 3d hand & object mesh
# python scripts/viz_dataset.py -d dexycb -s train -m 3d_hand_obj_contact 
# # @note: contact for test split is not provided. 

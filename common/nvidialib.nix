{ pkgs }:
with pkgs; [
  linuxPackages.nvidia_x11 # X.org driver and kernel module for NVIDIA graphics cards
  cudaPackages.cudatoolkit # A compiler for NVIDIA GPUs, math libraries, and tools
  cudaPackages.cudnn # NVIDIA CUDA Deep Neural Network library (cuDNN)
  cudaPackages.nccl # Multi-GPU and multi-node collective communication primitives for NVIDIA GPUs
]

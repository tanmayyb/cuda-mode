# CUDA MODE



- https://docs.nvidia.com/cuda/cuda-runtime-api/index.html


1. CUDA+ROS:
    
    https://github.com/UTFPR-Robotics/ros-cuda
    1. setup cmakelists.txt: 
        - add CUDA custom cmake configs from ref repo
        - check -arch=compute_?? supported by nvcc
        - check and add where nvidia-cuda-toolkit (cuda_runtime.h) in CUDA_DIR using
        ```
        locate cuda-toolkit
        ```
        - set CMAKE_C_COMPILER and CMAKE_CXX_COMPILER flags (gcc and g++ found in cuda toolkit store)
    2. setup package.xml
    3. build using 
        ```
        catkin build
        ```


2. Eigen+CUDA:
    
    https://github.com/GPMueller/eigen-cuda
    1. edit CMakeLists.txt
    2. to create Makefile run:
    ```
    cmake .
    ```
    3. to compile program run:
    ```
    make
    ```
#include <iostream>
#include <vector>
#include <cuda_runtime.h>
#define N 10



__global__ void vecadd(
    // int* a, int* b, int* c
){

    // helpful prints
    // printf(
    //     "Block index: blockIdx.x = %d, blockIdx.y = %d, blockIdx.z = %d\n",
    //     blockIdx.x, blockIdx.y, blockIdx.z);
    // printf(
    //     "Block dim: blockDim.x = %d, blockDim.y = %d, blockDim.z = %d\n",
    //     blockDim.x, blockDim.y, blockDim.z);



}



int main(){


    std::vector<int> u = {1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,};
    std::vector<int> v = {1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,1,2,3,4,5,};

    // std::cout<<u.size();

    int n = u.size();

    nblocks = 
    nthread = 

    // vecadd<<<1,1>>>();
    // cudaDeviceSynchronize();

    return 0;
}
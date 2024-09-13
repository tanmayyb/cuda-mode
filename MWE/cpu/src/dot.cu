#include <dot.hpp>
#include <iostream>
#include <vector>
#include <cuda.h>
#include <cuda_runtime.h>
// #include <thrust/device_vector.h>
// #include <thrust/transform_reduce.h>
// #include <thrust/functional.h>

#define THREADS_PER_BLOCK 256
// #define THREADS_PER_BLOCK 50



// dot produc
__global__ void computeDotProduct(
  Vector3f* d_vec1, 
  Vector3f* d_vec2, 
  float* d_dotvec, 
  float* d_result, 
  int N
){
  int index = blockIdx.x * blockDim.x + threadIdx.x;
  if(index >= N) return;
  float result = d_vec1[index].getX() * d_vec2[index].getX()
                  + d_vec1[index].getY() * d_vec2[index].getY()
                  + d_vec1[index].getZ() * d_vec2[index].getZ();
   
  d_dotvec[index] =  result;
  atomicAdd(d_result, result);
}


float launch_vecdot(
  std::vector<Vector3f> *h_vec1, 
  std::vector<Vector3f> *h_vec2
){

  Vector3f *d_vec1, *d_vec2;
  float *d_dotvec, *d_result;

  int size = (*h_vec1).size() * sizeof(Vector3f);
  cudaMalloc((void**)&d_vec1, size);
  cudaMalloc((void**)&d_vec2, size);
  cudaMalloc((void**)&d_dotvec, (*h_vec1).size());
  cudaMalloc((void**)&d_result, 1*sizeof(float));
  cudaMemcpy(d_vec1, (*h_vec1).data(), size, cudaMemcpyHostToDevice);
  cudaMemcpy(d_vec2, (*h_vec2).data(), size, cudaMemcpyHostToDevice);

  // run kernel
  computeDotProduct<<<size/THREADS_PER_BLOCK, THREADS_PER_BLOCK>>>(d_vec1, d_vec2, d_dotvec, d_result, size);
  // computeDotProduct<<<1, THREADS_PER_BLOCK>>>(d_vec1, d_vec2, d_dotvec, d_result, size);

  cudaDeviceSynchronize();

  float h_result;
  cudaMemcpy(&h_result, d_result, sizeof(float), cudaMemcpyDeviceToHost);

  // cleanup
  cudaFree(d_vec1);
  cudaFree(d_vec2);
  cudaFree(d_dotvec);
  cudaFree(d_result);

  return h_result;
}


void hello_world(){
  std::cout<<"hello world!"<<std::endl;
}
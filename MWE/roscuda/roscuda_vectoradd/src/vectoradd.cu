#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <cuda_runtime.h>


#define THREADS_PER_BLOCK 256


__global__ void add(int *in1, int *in2, int *out){
  int index = blockIdx.x * blockDim.x + threadIdx.x;
  out[index] = in1[index] + in2[index];
}

void random_ints(int *i, int size){
  for(int k=0; k<size; k++){
    i[k] = rand()%50;
  }
}

// int* testmain(int num){
int* vectoradd(int num){

  int size = num * sizeof(int);

  int *in1, *in2, *out; // host copies
  in1 = (int *)malloc(size);
  in2 = (int *)malloc(size);
  out = (int *)malloc(size);

  int *d_in1, *d_in2, *d_out; // device copies
  cudaMalloc((void **)&d_in1, size);
  cudaMalloc((void **)&d_in2, size);
  cudaMalloc((void **)&d_out, size);

  // generate random numbers
  random_ints(in1, num);
  random_ints(in2, num);
  
  // copy host data to device
  cudaMemcpy(d_in1, in1, size, cudaMemcpyHostToDevice);
  cudaMemcpy(d_in2, in2, size, cudaMemcpyHostToDevice);
  
  // run kernel
  add<<<num/THREADS_PER_BLOCK, THREADS_PER_BLOCK>>>(d_in1, d_in2, d_out);
  cudaDeviceSynchronize();

  // copy device data to host
  cudaMemcpy(out, d_out, size, cudaMemcpyDeviceToHost);

  // cleanup
  free(in1);
  free(in2);
  free(out);
  cudaFree(d_in1);
  cudaFree(d_in2);
  cudaFree(d_out);

  return out;
}

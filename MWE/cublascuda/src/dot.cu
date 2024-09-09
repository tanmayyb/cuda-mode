#include <dot.hpp>
#include <iostream>
#include <vector>
// #include <Eigen/Core>
#include <cuda.h>
#include <cuda_runtime.h>

#define THREADS_PER_BLOCK 256

inline void HandleError(cudaError_t err, const char *file, int line) {
  if (err != cudaSuccess) {
    std::cerr << "CUDA error at " << file << ":" << line << " code=" << err
              << " \"" << cudaGetErrorString(err) << "\"" << std::endl;
    exit(EXIT_FAILURE);
  }
}
#define HANDLE_ERROR( err ) (HandleError( err, __FILE__, __LINE__ ))

// __global__ void CUDAvecadd(
//   Eigen::Vector3f *v1,
//   Eigen::Vector3f *v2,
//   float *out,
//   size_t N
// ){
//   int index = blockIdx.x * blockDim.x + threadIdx.x;
//   if(index >= N) return;
//   out[index] = v1[index].dot(v2[index]);
// }


// std::vector<float> launch_vecadd(
//   std::vector<Eigen::Vector3f> &v1, 
//   std::vector<Eigen::Vector3f> &v2
// ){

//   int size = v1.size();
//   float *ret = new float[size];

//   Eigen::Vector3f *d_v1, *d_v2; // device copy
//   float *d_ret;

//   HANDLE_ERROR(cudaMalloc((void **)&d_v1, sizeof(Eigen::Vector3f)*size));
//   HANDLE_ERROR(cudaMalloc((void **)&d_v2, sizeof(Eigen::Vector3f)*size));
//   HANDLE_ERROR(cudaMalloc((void **)&d_ret, sizeof(float)*size));

//   HANDLE_ERROR(cudaMemcpy(d_v1, v1.data(), sizeof(Eigen::Vector3f)*size, cudaMemcpyHostToDevice));
//   HANDLE_ERROR(cudaMemcpy(d_v2, v2.data(), sizeof(Eigen::Vector3f)*size, cudaMemcpyHostToDevice));

//   CUDAvecadd<<<size/THREADS_PER_BLOCK, THREADS_PER_BLOCK>>>(d_v1, d_v2, d_ret, size);
//   cudaDeviceSynchronize();
  
//   HANDLE_ERROR(cudaMemcpy(ret, d_ret, sizeof(float)*size, cudaMemcpyDeviceToHost));
//   std::vector<float> vec(ret, ret + size);

//   free(ret);
//   HANDLE_ERROR(cudaFree(d_v1));
//   HANDLE_ERROR(cudaFree(d_v2));
//   HANDLE_ERROR(cudaFree(d_ret));
//   return vec;
// }


void hello_world(){
  std::cout<<"hello world!"<<std::endl;
}
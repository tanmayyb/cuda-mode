#include <iostream>
#include <vector>
#include <Eigen/Core>
#include <kernel.hpp>
// #include <cuda.h>
// #include <cuda_runtime.h>

// __global__ void CUDAvecadd(

// ){
//   int index = blockIdx.x * blockDim.x + threadIdx.x;

// }


// std::vector<float> launch_vecadd(
//   std::vector<Eigen::Vector3f> u, 
//   std::vector<Eigen::Vector3f> v
// ){

//   int size = u.size();

//   std::vector<Eigen::Vector3f> out; // host copy
//   out.reserve(size);


//   std::vector<Eigen::Vector3f> d_u, d_v, d_out; // device copy



//   return out;
// }


void hello_world(){
  std::cout<<"hello world!"<<std::endl;
}

// extern "C" std::vector<float> launch_vecadd(
//   std::vector<Eigen::Vector3f> u, 
//   std::vector<Eigen::Vector3f> v
// ){

//   int size = u.size();

//   std::vector<Eigen::Vector3f> out; // host copy
//   out.reserve(size);


//   std::vector<Eigen::Vector3f> d_u, d_v, d_out; // device copy



//   return out;
// }
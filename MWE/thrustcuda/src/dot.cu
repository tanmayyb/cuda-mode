#include <dot.hpp>
#include <iostream>
#include <vector>
#include <cuda.h>
#include <cuda_runtime.h>
#include <thrust/device_vector.h>
#include <thrust/transform_reduce.h>
#include <thrust/functional.h>

#define THREADS_PER_BLOCK 256

struct dot_product_functor {
  __host__ __device__ float operator()(const Vector3& obj) const {
    return  obj.getX() * obj.getX() +
            obj.getY() * obj.getY() +
            obj.getZ() * obj.getZ();
  }
};



float launch_vecdot(
  std::vector<Vector3> *h_v1, 
  std::vector<Vector3> *h_v2
){

  // int size = (*h_v1).size();
  // float *h_ret = new float[size];
  // float *d_v1, *d_v2;
  // float *d_ret;

  thrust::device_vector<Vector3> d_objects = *h_v1;
  
  float total_dot_product = thrust::transform_reduce(
      d_objects.begin(), d_objects.end(),
      dot_product_functor(), // Functor to compute dot product for each object
      0.0f,                  // Initial value for the reduction
      thrust::plus<float>()   // Binary operation to sum results
  );

  // std::vector<float> ret;
  return total_dot_product;
}


void hello_world(){
  std::cout<<"hello world!"<<std::endl;
}
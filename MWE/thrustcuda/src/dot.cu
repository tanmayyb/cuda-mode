#include <dot.hpp>
#include <iostream>
#include <vector>
#include <cuda.h>
#include <cuda_runtime.h>
#include <thrust/device_vector.h>
#include <thrust/transform_reduce.h>
#include <thrust/functional.h>

#define THREADS_PER_BLOCK 256

// struct Vector3fDotProduct {
//   __host__ __device__ float operator()(
//     const Vector3f& a, 
//     const Vector3f& b
//   ) const {
//     return  a.getX() * b.getX() + 
//             a.getY() * b.getY() + 
//             a.getZ() * b.getZ();
//   }
// };

struct Vector3fDotProduct {
  __host__ __device__ float operator()(
    // const Vector3f& a, 
    // const Vector3f& b
    const thrust::tuple<Vector3f, Vector3f>& t
  ) const {

    auto a = thrust::get<0>(t);
    auto b = thrust::get<1>(t);
    return  a.getX() * b.getX() + 
            a.getY() * b.getY() + 
            a.getZ() * b.getZ();
  }
};



float computeDotProductThrust(
  const std::vector<Vector3f>& h_vec1, 
  const std::vector<Vector3f>& h_vec2
) {
  int n = h_vec1.size();

  // Create thrust::device_vector from std::vector
  thrust::device_vector<Vector3f> d_vec1(h_vec1.begin(), h_vec1.end());
  thrust::device_vector<Vector3f> d_vec2(h_vec2.begin(), h_vec2.end());

  // // Use thrust::transform_reduce to compute dot product
  // float result = thrust::transform_reduce(
  //   d_vec1.begin(), 
  //   d_vec1.end(), 
  //   // d_vec2.begin(),               
  //   Vector3fDotProduct(),         
  //   0.0f,                         
  //   thrust::plus<float>()         
  // );

  auto first = thrust::make_zip_iterator(thrust::make_tuple(d_vec1.begin(), d_vec2.begin()));
  auto last = thrust::make_zip_iterator(thrust::make_tuple(d_vec1.end(), d_vec2.end()));

  float result = thrust::transform_reduce(
    first,
    last,
    Vector3fDotProduct(),
    0.0f,
    thrust::plus<float>()
  );

  return result;
}


float launch_vecdot(
  std::vector<Vector3f> *h_vec1, 
  std::vector<Vector3f> *h_vec2
){

  // Calculate dot product using Thrust
  float total_dot_product = computeDotProductThrust(*h_vec1, *h_vec2);

  std::cout << "Dot Product (Thrust): " << total_dot_product << std::endl;
  return total_dot_product;
}


void hello_world(){
  std::cout<<"hello world!"<<std::endl;
}
#include <iostream>
#include <vector>
#include <algorithm>
#include <chrono>
#include <cuda_runtime.h>
#include "Vector3.hpp"
#include "dot.hpp"


// class Vector3{
// public:
//   float x,y,z;
//   __host__ __device__ Vector3(float a, float b, float c) : x(a), y(b), z(c) {}

//   __host__ __device__ float getX() const {return x; }
//   __host__ __device__ float getY() const {return y; }
//   __host__ __device__ float getZ() const {return z; }

// };

int generate_vectors(
  std::vector<Vector3> *v1,
  std::vector<Vector3> *v2
){
  // ready the vectors
  int len_vec = 134217728; // 2^27
  // int len_vec = 3; // 2^27
  // int len_vec = 4000;
  // int len_vec = 256; 

  for(int i=0;i<len_vec;i++){
    float n = (float)i;
    auto item = Vector3(n,n,n);
    (*v1).push_back(item);
    (*v2).push_back(item);    
  }

  return 0;
}


int main(){
  // Generate Vectors
  std::cout<<"Generating Vectors!"<<std::endl;
  auto start = std::chrono::high_resolution_clock::now();
  std::vector<Vector3> v1, v2;
  generate_vectors(&v1, &v2);
  auto end = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> duration = end - start;
  std::cout << "Function execution time: " << duration.count() << " seconds" << std::endl;    

  // Compute Answer
  std::cout<<"Kernel Runs!"<<std::endl;
  start = std::chrono::high_resolution_clock::now();
  auto output = launch_vecdot(&v1, &v2);
  end = std::chrono::high_resolution_clock::now();
  duration = end - start;
  std::cout << "Function execution time: " << duration.count() << " seconds" << std::endl;    

  // Show Result
  std::cout << "Result: " << output <<  std::endl;    

  // for(int i=0; i<5; i++){
  //   std::cout<<output[i]<<std::endl;
  // }



  return 0;
}
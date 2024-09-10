#include <iostream>
#include <vector>
#include <algorithm>
#include <Eigen/Core>
#include <chrono>
#include <dot.hpp>



std::vector<std::vector<Eigen::Vector3f>> generate_vectors()
{
  // ready the vectors
  int len_vec = 134217728; // 2^27
  // int len_vec = 4000;
  // int len_vec = 256; 
  std::vector<Eigen::Vector3f> v1(len_vec, Eigen::Vector3f {1.0,1.0,1.0});
  auto v2 = v1;
  return std::vector<std::vector<Eigen::Vector3f>> {v1,v2};
}

int main(){
  auto vectors = generate_vectors();
  std::cout<<"Code Runs! with Eigen!"<<std::endl;

  auto start = std::chrono::high_resolution_clock::now();
  auto output = launch_vecdot(vectors[0], vectors[1]);
  auto end = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> duration = end - start;
  std::cout << "Function execution time: " << duration.count() << " seconds" << std::endl;    

  for(int i=0; i<5; i++){
    std::cout<<output[i]<<std::endl;
  }

  return 0;
}
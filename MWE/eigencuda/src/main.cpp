#include <iostream>
#include <vector>
#include <algorithm>
#include <Eigen/Core>
#include <chrono>
#include <kernel.hpp>

// extern std::vector<float> launch_vecadd(
//   std::vector<Eigen::Vector3f>,
//   std::vector<Eigen::Vector3f>
// );

// extern "C" std::vector<float> launch_vecadd(
//   std::vector<Eigen::Vector3f> u, 
//   std::vector<Eigen::Vector3f> v
// );

// std::vector<float> launch_vecadd(
//   std::vector<Eigen::Vector3f> u, 
//   std::vector<Eigen::Vector3f> v
// );

std::vector<std::vector<Eigen::Vector3f>> generate_vectors()
{
  // ready the vectors
  // int len_vec = 134217728; // 2^27
  int len_vec = 10; // 2^27
  int seed = 0;
  std::srand(unsigned(seed));
  std::vector<Eigen::Vector3f> u(len_vec, Eigen::Vector3f {1.0,1.0,1.0});
  // std::generate(u.begin(), u.end(), std::rand);
  auto v = u;
  return std::vector<std::vector<Eigen::Vector3f>> {u,v};
}

int main(){
  auto vectors = generate_vectors();
  std::cout<<"Code Runs! with Eigen!"<<std::endl;

  // for(auto it=vectors.begin(); it!=vectors.end(); it++){
  //     std::cout<<(*it)[0]<<" "<<(*it)[1]<<" "<<(*it)[2]<<std::endl;
  // }
  auto start = std::chrono::high_resolution_clock::now();
  // auto output = launch_vecadd(vectors[0], vectors[1]);
  hello_world();
  auto end = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double> duration = end - start;
  std::cout << "Function execution time: " << duration.count() << " seconds" << std::endl;    

  return 0;
}
#include <iostream>
#include <vector>
#include <cuda_runtime.h>
#include <chrono>

#include <algorithm>
#include <ctime>


__global__ void CUDAvecadd(
    int * a,
    int * b,
    int * result,
    int t
){
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i<t){
        result[i] = a[i] + b[i];
    }
}


std::vector<std::vector<int>> generate_vectors(){
    // ready the vectors
    int len_vec = 134217728; // 2^27
    int seed = 0;
    std::srand(unsigned(seed));
    std::vector<int> u(len_vec);
    std::generate(u.begin(), u.end(), std::rand);
    std::vector<int> v = u;
    return std::vector<std::vector<int>> {u,v};
}


int main(){
    auto vectors = generate_vectors();
    int* u = vectors[0].data();
    int* v = vectors[1].data();
    int t = vectors[0].size();
    size_t t_ = t * sizeof(int);

    int nthreads = 256;
    int nblocks = t/nthreads;
    // // perform and measure performance
    auto start = std::chrono::high_resolution_clock::now();
    // std::vector<int> result(t);
    int* result;
    cudaMalloc(&result, t_);
    CUDAvecadd<<<nblocks, nthreads>>>(u, v, result, t);
    cudaDeviceSynchronize();
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration = end - start;
    std::cout << "Function execution time: " << duration.count() << " seconds" << std::endl;

    return 0;
}
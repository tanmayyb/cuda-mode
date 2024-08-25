#include <iostream>
#include <vector>
#include <chrono>

#include <algorithm>
#include <ctime>

std::vector<int> vecadd(
    std::vector<int> u, std::vector<int> v, int t
){
    std::vector<int> tmp(t);
    for(int i=0; i<t; i++){
        tmp[i] = u[i]+v[i];
    }
    return tmp;
}

int main(){

    // ready the vector
    int len_vec = 100000000;
    int seed = 0;
    std::srand(unsigned(seed));
    std::vector<int> u(len_vec);
    std::generate(u.begin(), u.end(), std::rand);
    std::vector<int> v = u;

    int t = u.size();

    // perform and measure performance
    auto start = std::chrono::high_resolution_clock::now();
    auto result = vecadd(u,v,t);
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> duration = end - start;
    std::cout << "Function execution time: " << duration.count() << " seconds" << std::endl;

    return 0;
}
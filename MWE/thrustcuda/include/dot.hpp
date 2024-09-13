#pragma once
#include <vector>
#include "Vector3.hpp"

float launch_vecdot(
    std::vector<Vector3f> *h_vec1, 
    std::vector<Vector3f> *h_vec2
);

void hello_world();
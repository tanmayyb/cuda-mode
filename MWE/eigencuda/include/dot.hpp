#pragma once
#include <vector>
#include <Eigen/Core>

std::vector<float> launch_vecdot(
    std::vector<Eigen::Vector3f> &u, 
    std::vector<Eigen::Vector3f> &v
);

void hello_world();
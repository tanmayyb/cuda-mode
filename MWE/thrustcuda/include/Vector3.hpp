#pragma once
#include <vector>
#include <cuda_runtime.h>


class Vector3f{
public:
  float x,y,z;
  __host__ __device__ Vector3f() : x(0.f), y(0.f), z(0.f) {}
  __host__ __device__ Vector3f(float a, float b, float c) : x(a), y(b), z(c) {}

  __host__ __device__ float getX() const {return x; }
  __host__ __device__ float getY() const {return y; }
  __host__ __device__ float getZ() const {return z; }

};
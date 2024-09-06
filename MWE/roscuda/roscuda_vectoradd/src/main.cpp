#include "ros/ros.h"
#include <time.h>
#include "std_msg/Int32.h"
#include "std_msg/Float32.h"

#define N (1024*1024)

int *testmain(int num, int threads);
int size=10;
std_msgs::Float32 msg_time;


// some callback function to change value of 'size'
void size_Callback(const std_msgs::Int32& msg){
  size=msg.data;
  if(size<1){size=1}
  if(size>100){size=100;}
}


int main(int argc, char **argv){
  ros::init(argc, argv, "roscuda_vectoradd");
  ros::NodeHandle n;
  ros::Publisher time_pub = n.advertise<std_msgs::Float32>("/time", 1);
  ros::Suscriber size_sub = n.subscribe("/size", 100, size_Callback)

  clock_t start, end;
  double cpu_time_used;
  int *p;

  while(ros::ok()){
    start = clock();
    // p = testmain(size*N, THREADS_PER_BLOCK);
    p = vectoradd(size*N, THREADS_PER_BLOCK);

    end = clock();

    cpu_time_used = ((double) (end-start))/CLOCKS_PER_SEC;
    msg_time.data = cpu_time_used;
    time_pub.publish(msg_time);

    ros::spinOnce();
  }

  return 0;
}



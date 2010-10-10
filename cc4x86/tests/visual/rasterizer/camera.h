
#ifndef __CAMERA_H__
#define __CAMERA_H__

#include "math3d.h"

class CCamera
{
public:
  CCamera();
  bool getMatrix(matrix3d_t & matrix);
  bool getViewMatrix(matrix3d_t & matrix);
public:
  vector3d_t m_pos;

  float     m_aspect;
  float     m_fov; // radians
  float     m_znear;
  float     m_zfar;
  float     m_roll;
  float     m_pitch;
  float     m_yaw;
};

#endif //__CAMERA_H__

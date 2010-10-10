
#include "camera.h"

//---------------------------------------------------------------------------
CCamera::CCamera()
{
  m_pos.set(0, 0, 0);
  m_aspect = 1;
  m_fov = _torad(45);
  m_znear = 0.1f;
  m_zfar = 100;
  m_roll = 0;
  m_pitch = 0;
  m_yaw = 0;
}

//---------------------------------------------------------------------------
bool CCamera::getMatrix(matrix3d_t & matrix)
{
  matrix3d_t tmp;
  matrix.loadPerspective(m_fov, m_aspect, m_znear, m_zfar);
  tmp.loadRotation(m_roll,  vector3d_t::kZAxis); matrix.combine(tmp);
  tmp.loadRotation(m_yaw,   vector3d_t::kXAxis); matrix.combine(tmp);
  tmp.loadRotation(m_pitch, vector3d_t::kYAxis); matrix.combine(tmp);
  tmp.loadTranslation(-m_pos);
  matrix.combine(tmp);
  return true;
}

//---------------------------------------------------------------------------
bool CCamera::getViewMatrix(matrix3d_t & matrix)
{
  matrix3d_t tmp;
  matrix.loadIdentity();
  tmp.loadRotation(m_roll,  vector3d_t::kZAxis); matrix.combine(tmp);
  tmp.loadRotation(m_yaw,   vector3d_t::kXAxis); matrix.combine(tmp);
  tmp.loadRotation(m_pitch, vector3d_t::kYAxis); matrix.combine(tmp);
  tmp.loadTranslation(-m_pos);
  matrix.combine(tmp);
  return true;
}

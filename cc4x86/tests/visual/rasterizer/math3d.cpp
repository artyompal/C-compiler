
#include "math3d.h"
#include "string.h" // for memcpy

//---------------------------------------------------------------------------
// vectors
//---------------------------------------------------------------------------
const vector3d_t vector3d_t::kZero(0,0,0);
const vector3d_t vector3d_t::kOrigin(0,0,0);
const vector3d_t vector3d_t::kXAxis(1,0,0);
const vector3d_t vector3d_t::kYAxis(0,1,0);
const vector3d_t vector3d_t::kZAxis(0,0,1);

//---------------------------------------------------------------------------
// matrix implementation
//---------------------------------------------------------------------------
static float _identity_mtx[4][4] = 
{
  { 1.0, 0.0, 0.0, 0.0 }, 
  { 0.0, 1.0, 0.0, 0.0 }, 
  { 0.0, 0.0, 1.0, 0.0 }, 
  { 0.0, 0.0, 0.0, 1.0 }, 
};

static float _zero_mtx[4][4] = 
{
  { 0.0, 0.0, 0.0, 0.0 }, 
  { 0.0, 0.0, 0.0, 0.0 }, 
  { 0.0, 0.0, 0.0, 0.0 }, 
  { 0.0, 0.0, 0.0, 0.0 }, 
};

const matrix3d_t matrix3d_t::kZero(*((const matrix3d_t*)_zero_mtx));
const matrix3d_t matrix3d_t::kIdentity(*((const matrix3d_t*)_identity_mtx));

matrix3d_t::matrix3d_t()
{
  *this = kIdentity;
}

matrix3d_t & matrix3d_t::operator=(const matrix3d_t & src)
{
  if (this != &src)
    memcpy(this, src, sizeof(matrix3d_t));
  return *this;
}

void matrix3d_t::combine(matrix3d_t & result, const matrix3d_t & m1, const matrix3d_t & m2)
{
	for(int c=0;c<4;c++)
  {
		for(int r=0;r<4;r++)
		{
      result.mat[r][c] = m1.mat[0][c] * m2.mat[r][0] + m1.mat[1][c] * m2.mat[r][1] + 
                         m1.mat[2][c] * m2.mat[r][2] + m1.mat[3][c] * m2.mat[r][3];
		}
  }
}

matrix3d_t & matrix3d_t::combine(const matrix3d_t & m2)
{
	matrix3d_t t;
  combine(t, *this, m2);
  *this = t;
  return *this;
}


// get from glu source
static int __gluInvertMatrix(const float src[16], float inverse[16])
{
  int i, j, k, swap;
  float t;
  float temp[4][4];

  for (i=0; i<4; i++)
  {
    for (j=0; j<4; j++)
    {
      temp[i][j] = src[i*4+j];
    }
  }
  //__gluMakeIdentityd(inverse);
  memcpy(inverse, _identity_mtx, sizeof(_identity_mtx));

  for (i = 0; i < 4; i++)
  {
    /* Look for largest element in column */
    swap = i;
    for (j = i + 1; j < 4; j++)
    {
      if (fabs(temp[j][i]) > fabs(temp[i][i]))
      {
        swap = j;
      }
    }

    if (swap != i)
    {
      /* Swap rows. */
      for (k = 0; k < 4; k++)
      {
        t = temp[i][k];
        temp[i][k] = temp[swap][k];
        temp[swap][k] = t;

        t = inverse[i*4+k];
        inverse[i*4+k] = inverse[swap*4+k];
        inverse[swap*4+k] = t;
      }
    }

    if (temp[i][i] == 0)
    {
      /*
      ** No non-zero pivot.  The matrix is singular, which shouldn't
      ** happen.  This means the user gave us a bad matrix.
      */
      return 0;
    }

    t = temp[i][i];
    for (k = 0; k < 4; k++)
    {
      temp[i][k] /= t;
      inverse[i*4+k] /= t;
    }
    for (j = 0; j < 4; j++)
    {
      if (j != i)
      {
        t = temp[j][i];
        for (k = 0; k < 4; k++)
        {
          temp[j][k] -= temp[i][k]*t;
          inverse[j*4+k] -= inverse[i*4+k]*t;
        }
      }
    }
  }
  return 1;
}

int matrix3d_t::_invert()
{
  return __gluInvertMatrix((float*)mat, (float*)mat);
}


matrix3d_t & matrix3d_t::loadTranslation(float dx, float dy, float dz)
{
  loadIdentity();
  at(0, 3) = dx;
  at(1, 3) = dy;
  at(2, 3) = dz;
  return *this;
}

matrix3d_t & matrix3d_t::loadScale(float sx, float sy, float sz)
{
  loadIdentity();
  at(0, 0) = sx;
  at(1, 1) = sy;
  at(2, 2) = sz;
  return *this;
}

matrix3d_t & matrix3d_t::loadRotation(float phi, float ax, float ay, float az)
{
  float q[4];
  float factor = (float)(sin(phi/2.0) / sqrt(ax*ax + ay*ay + az*az));
  q[0] = ax * factor;
  q[1] = ay * factor;
  q[2] = az * factor;
  q[3] = (float)cos(phi/2.0);
  
  at(0,0) = (float)(1.0 - 2.0 * (q[1] * q[1] + q[2] * q[2]));
  at(0,1) = (float)(2.0 * (q[0] * q[1] - q[2] * q[3]));
  at(0,2) = (float)(2.0 * (q[2] * q[0] + q[1] * q[3]));
  at(0,3) = (float)(0.0);

  at(1,0) = (float)(2.0 * (q[0] * q[1] + q[2] * q[3]));
  at(1,1) = (float)(1.0 - 2.0 * (q[2] * q[2] + q[0] * q[0]));
  at(1,2) = (float)(2.0 * (q[1] * q[2] - q[0] * q[3]));
  at(1,3) = (float)(0.0);

  at(2,0) = (float)(2.0 * (q[2] * q[0] - q[1] * q[3]));
  at(2,1) = (float)(2.0 * (q[1] * q[2] + q[0] * q[3]));
  at(2,2) = (float)(1.0 - 2.0 * (q[1] * q[1] + q[0] * q[0]));
  at(2,3) = (float)(0.0);

  at(3,0) = (float)(0.0);
  at(3,1) = (float)(0.0);
  at(3,2) = (float)(0.0);
  at(3,3) = (float)(1.0);
  return *this;
}


matrix3d_t & matrix3d_t::loadFrustum(float left,   float right,
                                     float bottom, float top,
                                     float znear,  float zfar)
{
#if 0
// OpenGL version
  float deltaX = right - left;
  float deltaY = top - bottom;
  float deltaZ = zfar - znear;

  if ((znear <= 0.0) || (zfar <= 0.0) || (deltaX == 0.0) || (deltaY == 0.0) || (deltaZ == 0.0))
    return *this;

  loadIdentity();

  mat[0][0] = 2 * znear / deltaX;
  mat[1][1] = 2.0 * znear / deltaY;
  mat[2][0] = (right + left) / deltaX;
  mat[2][1] = (top + bottom) / deltaY;
  mat[2][2] = -(zfar + znear) / deltaZ;
  mat[2][3] = -1;
  mat[3][2] = -2.0 * znear * zfar / deltaZ;
  mat[3][3] = 0.0;
#else
// own version - same without parametes check
  float X = 2 * znear / (right - left);
  float Y = 2 * znear / (top - bottom);
  float A = (right + left)/(right - left);
  float B = (top + bottom)/(top - bottom);
  float C = -(zfar + znear)/(zfar - znear);
  float D = -(2 * zfar * znear)/(zfar - znear);

  at(0,0) = X; at(0,1) = 0; at(0,2) = A; at(0,3) = 0;
  at(1,0) = 0; at(1,1) = Y; at(1,2) = B; at(1,3) = 0;
  at(2,0) = 0; at(2,1) = 0; at(2,2) = C; at(2,3) = D;
  at(3,0) = 0; at(3,1) = 0; at(3,2) =-1; at(3,3) = 0;
#endif
  return *this;
}

matrix3d_t & matrix3d_t::loadPerspective(float fovy, float aspect, float znear, float zfar)
{
  loadIdentity();
  float deltaZ = zfar - znear;
  float sine = (float)sin(fovy/2);

  if ((deltaZ != 0) && (sine != 0) && (aspect != 0))
  {
    float cotangent = (float)(cos(fovy/2) / sine);

    at(0, 0) = cotangent / aspect;
    at(1, 1) = cotangent;
    at(2, 2) = -(zfar + znear) / deltaZ;
    at(3, 2) = -1;
    at(2, 3) = -2 * znear * zfar / deltaZ;
    at(3, 3) = 0;
  }
  return *this;
}

matrix3d_t & matrix3d_t::loadOrtho(float left, float right,
                                   float bottom, float top,
                                   float znear, float zfar)
{
  float S_X = 2.0f/(right-left);
  float S_Y = 2.0f/(top-bottom);
  float S_Z = -2.0f/(zfar-znear);
  float T_X = -(right+left)/(right-left);
  float T_Y = -(top+bottom)/(top-bottom);
  float T_Z = -(zfar+znear)/(zfar-znear);

  at(0,0) = S_X; at(0,1) = 0.0; at(0,2) = 0.0; at(0,3) = T_X;
  at(1,0) = 0.0; at(1,1) = S_Y; at(1,2) = 0.0; at(1,3) = T_Y;
  at(2,0) = 0.0; at(2,1) = 0.0; at(2,2) = S_Z; at(2,3) = T_Z;
  at(3,0) = 0.0; at(3,1) = 0.0; at(3,2) = 0.0; at(3,3) = 1.0;
  return *this;
}

vector3d_t & matrix3d_t::transformPoint(vector3d_t & dst, const vector3d_t & src) const
{
  // first transform w component for validity check
  float w = src.x*mat[0][3] + src.y*mat[1][3] + src.z*mat[2][3] + mat[3][3];
  if (w != 0.0)
  {
    // transform other components using 1/w normalizator
    w = 1.0f / w;
    vector3d_t tmp = src;
    dst.x = w * (tmp.x*mat[0][0] + tmp.y*mat[1][0] + tmp.z*mat[2][0] + mat[3][0]);
    dst.y = w * (tmp.x*mat[0][1] + tmp.y*mat[1][1] + tmp.z*mat[2][1] + mat[3][1]);
    dst.z = w * (tmp.x*mat[0][2] + tmp.y*mat[1][2] + tmp.z*mat[2][2] + mat[3][2]);
  }
  return dst;
}

vector3d_t & matrix3d_t::transformVector(vector3d_t & dst, const vector3d_t & src) const
{
  vector3d_t tmp = src;
  dst.x = tmp.x*mat[0][0] + tmp.y*mat[1][0] + tmp.z*mat[2][0];
  dst.y = tmp.x*mat[0][1] + tmp.y*mat[1][1] + tmp.z*mat[2][1];
  dst.z = tmp.x*mat[0][2] + tmp.y*mat[1][2] + tmp.z*mat[2][2];
  return dst; 
}

//---------------------------------------------------------------------------
// plane implementation
//---------------------------------------------------------------------------
plane3d_t::plane3d_t(const vector3d_t & normal, float distance)
{
  m_normal = normal;
  m_distance = distance;
  // normalize
  float nl = m_normal.length();
  if (nl > 0.00001f)
  {
    m_normal /= nl;
    m_distance /= nl;
  }
}

//---------------------------------------------------------------------------
void plane3d_t::construct(const vector3d_t & p0, const vector3d_t & p1, const vector3d_t & p2)
{
  m_normal = crossProduct(p1 - p0, p2 - p0);
  float nl = m_normal.length();
  if (nl > 0.00001f)
    m_normal /= nl;
  m_distance = -m_normal.dotProduct(p0);
}

//---------------------------------------------------------------------------
// frustum implementation
//---------------------------------------------------------------------------
void frustum3d_t::setupFrustum(const vector3d_t & LLeft, const vector3d_t & ULeft,
                               const vector3d_t & URight, const vector3d_t & LRight,
                               const vector3d_t & Origin)
{
  m_planes[0].construct( Origin, LLeft,  ULeft  );
  m_planes[1].construct( Origin, ULeft,  URight );
  m_planes[2].construct( Origin, URight, LRight );
  m_planes[3].construct( Origin, LRight, LLeft  );
}

//---------------------------------------------------------------------------
void frustum3d_t::setupFrustum(float FOV, float cx, float cy, const matrix3d_t * tfm)
{
  float fScale = cy / (2.0f * (float)tan( FOV / 2.0f ) );
  float HalfWidth  = 0.5f * cx;
  float HalfHeight = 0.5f * cy;

  vector3d_t Origin = vector3d_t::kOrigin;
  vector3d_t LLeft ( -HalfWidth, -HalfHeight, fScale );
  vector3d_t ULeft ( -HalfWidth,  HalfHeight, fScale );
  vector3d_t URight(  HalfWidth,  HalfHeight, fScale );
  vector3d_t LRight(  HalfWidth, -HalfHeight, fScale );

  if (tfm)
  {
    tfm->transformPoint(Origin);
    tfm->transformPoint(LLeft);
    tfm->transformPoint(ULeft);
    tfm->transformPoint(URight);
    tfm->transformPoint(LRight);
  }

  setupFrustum(LLeft, ULeft, URight, LRight, Origin);
}

//---------------------------------------------------------------------------
bool frustum3d_t::isPointVisible(const vector3d_t & p) const
{
  for (int i = 0; i < 4; i++)
    if (m_planes[i].distanceTo(p) < 0)
      return false;
  return true;
}

//---------------------------------------------------------------------------
bool frustum3d_t::isSphereVisible(const vector3d_t & p, float r) const
{
  for (int i = 0; i < 4; i++)
    if ((m_planes[i].distanceTo(p) + r) < 0)
      return false;
  return true;
}

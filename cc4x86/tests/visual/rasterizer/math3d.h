
#ifndef __MATH3D_H__
#define __MATH3D_H__

#include "math.h"
#include "stdlib.h"

#define __PI__        (3.14159265358979323846)
#define M3D_PI        ((float)__PI__)
#define M3D_HALF_PI   ((float)(0.5 * __PI__))
#define M3D_DOUBLE_PI ((float)(2.0 * __PI__))

#define __RAD2DEG__   (57.29577951308232286465)
#define __DEG2RAD__   ( 0.01745329251994329547)

#define _torad(angle) ((float)((angle) * __DEG2RAD__))
#define _todeg(angle) ((float)((angle) * __RAD2DEG__))

//---------------------------------------------------------------------------
// simple vector class - just for sample!
//---------------------------------------------------------------------------
class vector3d_t
{
public:
  float x, y, z;
public:
  static const vector3d_t kZero;
  static const vector3d_t kOrigin;
  static const vector3d_t kXAxis;
  static const vector3d_t kYAxis;
  static const vector3d_t kZAxis;

  // constructors
  vector3d_t() {}
  vector3d_t(float v) : x(v), y(v), z(v) {}
  vector3d_t(float _x, float _y, float _z) : x(_x), y(_y), z(_z) {}
  vector3d_t(const vector3d_t & v) : x(v.x), y(v.y), z(v.z) {}

  // type cast
  operator const float*() const { return &x; }
  operator float*()             { return &x; }

  // setting & assignment
  vector3d_t & set(float _x, float _y, float _z)
  { x = _x; y = _y; z = _z; return *this; }
  vector3d_t & operator=(const vector3d_t & v)
  { return set(v.x, v.y, v.z); }

  // unary operators
  friend vector3d_t operator + (const vector3d_t & v) { return v; }
  friend vector3d_t operator - (const vector3d_t & v) { return vector3d_t(-v.x, -v.y, -v.z); }

  // ariph
  vector3d_t & operator += (const vector3d_t & v) { x += v.x; y += v.y; z += v.z; return *this; }
  vector3d_t & operator -= (const vector3d_t & v) { x -= v.x; y -= v.y; z -= v.z; return *this; }
  vector3d_t & operator *= (float f) { x *= f; y *= f; z *= f; return *this; }
  vector3d_t & operator /= (float f) { return (*this) *= (1.0f / f); }

//  template <>
//  friend vector3d_t operator|(const vector3d_t & v1, const vector3d_t & v2) { return vector3d_t(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z); }

//  template <class _E1, class _E2>
  friend vector3d_t operator+(const vector3d_t & v1, const vector3d_t & v2) { return vector3d_t(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z); }
  friend vector3d_t operator-(const vector3d_t & v1, const vector3d_t & v2) { return vector3d_t(v1.x-v2.x, v1.y-v2.y, v1.z-v2.z); }

  friend vector3d_t operator * (const vector3d_t & v, float f) { return vector3d_t(f*v.x, f*v.y, f*v.z); }
  friend vector3d_t operator * (float f, const vector3d_t & v) { return vector3d_t(f*v.x, f*v.y, f*v.z); }
  friend vector3d_t operator / (const vector3d_t & v, float f) { return v * (1.0f / f); }

  // utility
  float length2() const { return (x*x + y*y + z*z); }
  float length()  const { return (float)sqrt(length2()); }
 
  vector3d_t & normalize() { return (*this) /= length(); }
  vector3d_t   normalized() const { return (*this) / length(); }

  float dotProduct(const vector3d_t & v2) const
  { return ::dotProduct(*this, v2); }

  vector3d_t crossProduct(const vector3d_t & v2) const
  { return ::crossProduct(*this, v2); }

  friend float dotProduct(const vector3d_t & v1, const vector3d_t & v2)
  { return v1.x*v2.x + v1.y * v2.y + v1.z*v2.z; }

  friend vector3d_t crossProduct(const vector3d_t & v1, const vector3d_t & v2)
  { return vector3d_t (v1.y * v2.z - v1.z * v2.y, v1.z * v2.x - v1.x * v2.z, v1.x * v2.y - v1.y * v2.x); }

};

//inline vector3d_t operator+(const vector3d_t & v1, const vector3d_t & v2)
//{
//  return vector3d_t(v1.x+v2.x, v1.y+v2.y, v1.z+v2.z);
//}
//---------------------------------------------------------------------------
// simple 4x4 matrix class - just for sample!
// matrix interpretted as column-ordered (for compatibility with OpenGL)
//---------------------------------------------------------------------------
class matrix3d_t
{
public:
  static const matrix3d_t kZero;
  static const matrix3d_t kIdentity;

	float mat[4][4];
public:	
  enum transform_type
  {
    asPoint,
    asVector
  };

	matrix3d_t();
	matrix3d_t(const matrix3d_t & other) { *this=other; }
  ~matrix3d_t() {}

	matrix3d_t & operator=(const matrix3d_t & src);// assignment

	const float & at(int row, int col) const
  {
    return mat[col][row];// swap indices to store by column
  }

	float & at(int row, int col)
  {
	  return mat[col][row];// swap indices to store by column
  }

  const float & operator()(int row, int col) const
  { return at(row, col); }

	float & operator()(int row, int col)
  { return at(row, col); }

  operator const float*() const { return (const float*)mat; }
	operator float*() {return (float*)mat; }

  void loadIdentity() { *this = kIdentity; }

  static void combine(matrix3d_t  & result, const matrix3d_t & m1, const matrix3d_t & m2);
  matrix3d_t & combine(const matrix3d_t & m2);
  int _invert();
  matrix3d_t & invert()
  { _invert(); return *this; }

  matrix3d_t & loadTranslation(float dx, float dy, float dz);
  matrix3d_t & loadTranslation(const vector3d_t & v)
  { return loadTranslation(v.x, v.y, v.z); }

  matrix3d_t & loadScale(float sx, float sy, float sz);
  matrix3d_t & loadScale(const vector3d_t & s)
  { return loadScale(s.x, s.y, s.z); }

  matrix3d_t & loadRotation(float phi, float ax, float ay, float az);
  matrix3d_t & loadRotation(float phi, const vector3d_t & axis)
  { return loadRotation(phi, axis.x, axis.y, axis.z); }


  matrix3d_t & loadFrustum(float left,   float right,
                           float bottom, float top,
                           float znear,  float zfar);

  matrix3d_t & loadPerspective(float fovy, float aspect, float znear, float zfar);

  matrix3d_t & loadOrtho(float left, float right,
                         float bottom, float top,
                         float zNear, float zFar);
 
// vector / point transform functions
  vector3d_t & transformPoint(vector3d_t & dst, const vector3d_t & src) const;
  vector3d_t & transformPoint(vector3d_t & v) const
  { return transformPoint(v, v); }

  vector3d_t & transformVector(vector3d_t & dst, const vector3d_t & src) const;
  vector3d_t & transformVector(vector3d_t & v) const
  { return transformVector(v, v); }
};

//---------------------------------------------------------------------------
// simple plane class - just for sample!
//---------------------------------------------------------------------------
class plane3d_t
{
public:
  plane3d_t() {}
  plane3d_t(const plane3d_t & src) { *this = src; }
  plane3d_t(const vector3d_t & normal, float distance);
  plane3d_t(const vector3d_t & p1, const vector3d_t & p2, const vector3d_t & p3)
  { construct(p1, p2, p3); }
  void construct(const vector3d_t & p1, const vector3d_t & p2, const vector3d_t & p3);
  float distanceTo(const vector3d_t & p) const
  { return dotProduct(m_normal, p) + m_distance; }
public: 
  vector3d_t  m_normal;
  float       m_distance;
};

//---------------------------------------------------------------------------
// simple frustum class - just for sample!
//---------------------------------------------------------------------------
class frustum3d_t
{
public:
  plane3d_t m_planes[4];
public:
  frustum3d_t() {}
  void setupFrustum(float FOV, float cx, float cy, const matrix3d_t * tfm = NULL);
  void setupFrustum(const vector3d_t & ll, const vector3d_t & ul,
                    const vector3d_t & ur, const vector3d_t & lr,
                    const vector3d_t & org = vector3d_t::kOrigin);
  bool isPointVisible(const vector3d_t & p) const;
  bool isSphereVisible(const vector3d_t & p, float r) const;
};


#endif //__MATH3D_H__

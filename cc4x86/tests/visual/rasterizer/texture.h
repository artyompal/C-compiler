
#ifndef __TEXTURE_H__
#define __TEXTURE_H__

#include "windows.h"


//---------------------------------------------------------------------------
// very simple texture with 24 / 32 bit BMP load
//---------------------------------------------------------------------------
template <class _Tp>
class rgbaQuad
{
public:
  _Tp r, g, b, a;
public:
  rgbaQuad() {}
  rgbaQuad(_Tp _r, _Tp _g, _Tp _b, _Tp _a) { r = _r; g = _g; b = _b; a = _a; }
  rgbaQuad & set(_Tp _r, _Tp _g, _Tp _b, _Tp _a) { r = _r; g = _g; b = _b; a = _a; return *this; }
  operator const _Tp *() const { return &r; }
  operator _Tp *() { return &r; }
  const _Tp & operator[](int index) const { return (&r)[index]; }
  _Tp & operator[](int index) { return (&r)[index]; }
};

typedef rgbaQuad<unsigned char> GLRGBA;

class CTexture
{
public:
  CTexture();
  ~CTexture();

  //void preInit();
  GLRGBA & at(int x, int y) { return m_data[y*m_width+x]; }
  BOOL setSize(int width, int height);
  BOOL load(const char * bmp_file);
  //void setActive();

protected:
  GLRGBA     *  m_data;
  int           m_width;
  int           m_height;
};

#endif //__TEXTURE_H__

#include "rasterizer.h"
#include "texture.h"
#include "stdio.h"

//---------------------------------------------------------------------------
// simple 24 / 32 bit BMP texture load
//---------------------------------------------------------------------------
CTexture::CTexture()
{
    m_data = NULL;
}

CTexture::~CTexture()
{
    delete[] m_data;
}

BOOL CTexture::setSize(int width, int height)
{
  if (m_data)
    delete[] m_data;
  if (width*height == 0)
    return TRUE;
  m_data = new GLRGBA[width*height];
  if (m_data)
  {
    m_width = width;
    m_height = height;
  }
  return TRUE;
}
/////////////////////////////////////////////////////////////////////////////
BOOL CTexture::load(const char * szFileName)
{
  BOOL fRet = TRUE;

  FILE * hFile = fopen(szFileName, "rb");
  if (!hFile)
    return FALSE;

  BITMAPFILEHEADER fileHeader;
  if (sizeof(fileHeader) == fread(&fileHeader, 1, sizeof(fileHeader), hFile))
  {
    BITMAPINFOHEADER bitmapInfoHeader;
    bitmapInfoHeader.biSize = sizeof(bitmapInfoHeader);
    if (sizeof(bitmapInfoHeader) == fread(&bitmapInfoHeader, 1, sizeof(bitmapInfoHeader), hFile))
    {
      if ((bitmapInfoHeader.biCompression == BI_RGB) && (bitmapInfoHeader.biBitCount >= 16))
      {
        int w = bitmapInfoHeader.biWidth;
        int h = bitmapInfoHeader.biHeight;
        int bits = bitmapInfoHeader.biBitCount / 8;
        int lineSize = (w * bits + 3) & 0xFFFFFFF4;
        BYTE * buffer = new BYTE[lineSize];
        setSize(w, h);

        for (int y=0; y<h; y++)
        {
          fread(buffer, 1, lineSize, hFile);
          BYTE * b = buffer;
          for (int x=0; x<w; x++)
          {
            switch(bits)
            {
            case 2:
//                at(i, j).set(b[2], b[1], b[0]);
              break;
            case 3:
              at(x, y).set(b[2], b[1], b[0], 255);
              break;
            case 4:
              at(x, y).set(b[2], b[1], b[0], b[3]);
              break;
            }
            b += bits;
          }
        }
        delete[] buffer;
      }
    }
  }
  fclose(hFile);
  
  rasterizer_set_texture(m_data, m_width, m_height);

  return fRet;
}


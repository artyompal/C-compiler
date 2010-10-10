
#ifndef __PARTICLE_SYSTEM_H__
#define __PARTICLE_SYSTEM_H__

#include "math3d.h"
#include "texture.h"
#include "array.h"


struct CParticleData
{
  vector3d_t m_pos;
  vector3d_t m_vel;
  float      m_size;
  float      m_life;
};

struct CTexturedVertex
{
  vector3d_t pos;
  float      tex[2];
  
  CTexturedVertex() {}
  CTexturedVertex(vector3d_t const &p, float s, float t) : pos(p) { tex[0]=s, tex[1]=t; }
};

class CSimpleParticleSystem
{
public:
  CSimpleParticleSystem();
  virtual ~CSimpleParticleSystem();

  void Update(float dt);
  int NumParticles() const { return m_data.size(); }
  int NumDrawnParticles() const { return m_numDrawnParticles; }

  void CreateParticle(CParticleData & pd);

  void Render();
  void RenderSetup();
  void RenderArrays();
  void RenderNoArrays();
  void RenderDone();
public: // mode switches
  BOOL m_bUseFrustumCull;
  BOOL m_bUseQuads;
  BOOL m_bUseArrays;
  BOOL m_bUseVBO;
  BOOL m_bUseAlphaTest;
  BOOL m_bLastUseQuads;
protected:
  float                 m_FixedParticleSize;
  xarray<CParticleData> m_data;
  int                   m_numDrawnParticles;
  CTexture            * m_pTexture;
  float                 m_emitPerFrame;
  float                 m_toEmit;
  float                 m_life;
  unsigned                m_vtxBuffer;
};


#endif //__PARTICLE_SYSTEM_H__
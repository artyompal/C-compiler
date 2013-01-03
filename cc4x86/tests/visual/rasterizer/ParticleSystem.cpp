
#include "rasterizer.h"
#include "windows.h"
#include "ParticleSystem.h"
#include "camera.h"

extern CCamera camera;   // camera object
extern int ddraw_width;
extern int ddraw_height;


#define TEST 1


float random(float _min, float _max)
{
  return _min + (_max - _min)*rand()/RAND_MAX;
}

static float sqr3 = sqrt(3.0f);
static int initBillboards(BOOL fUseQuads, CTexturedVertex * vtx, CTexturedVertex * vtx2)
{
  int num_vtx;
  if (fUseQuads) // init for rectangles
  {
    vtx[0].pos.set(- 1, - 1, 0); vtx[0].tex[0] = 0; vtx[0].tex[1] = 0;
    vtx[1].pos.set(+ 1, - 1, 0); vtx[1].tex[0] = 1; vtx[1].tex[1] = 0;
    vtx[2].pos.set(+ 1, + 1, 0); vtx[2].tex[0] = 1; vtx[2].tex[1] = 1;
    vtx[3].pos.set(- 1, + 1, 0); vtx[3].tex[0] = 0; vtx[3].tex[1] = 1;

    vtx2[0].pos.set(-1, 0.01f, -1); vtx2[0].tex[0] = 0; vtx2[0].tex[1] = 0;
    vtx2[1].pos.set( 1, 0.01f, -1); vtx2[1].tex[0] = 1; vtx2[1].tex[1] = 0;
    vtx2[2].pos.set( 1, 0.01f,  1); vtx2[2].tex[0] = 1; vtx2[2].tex[1] = 1;
    vtx2[3].pos.set(-1, 0.01f,  1); vtx2[3].tex[0] = 0; vtx2[3].tex[1] = 1;
    num_vtx = 4;
  } else // init for triangles
  {
    vtx[0].pos.set(-sqr3, - 1, 0); vtx[0].tex[0] = 0.5f * (1.0f - sqr3); vtx[0].tex[1] = 0;
    vtx[1].pos.set(+sqr3, - 1, 0); vtx[1].tex[0] = 0.5f * (1.0f + sqr3); vtx[1].tex[1] = 0;
    vtx[2].pos.set(0.0f,  + 2, 0); vtx[2].tex[0] = 0.5f;                 vtx[2].tex[1] = 1.5f;

    vtx2[0].pos.set(-sqr3, 0.01f, -1); vtx2[0].tex[0] = 0.5f * (1.0f - sqr3); vtx2[0].tex[1] = 0;
    vtx2[1].pos.set(+sqr3, 0.01f, -1); vtx2[1].tex[0] = 0.5f * (1.0f + sqr3); vtx2[1].tex[1] = 0;
    vtx2[2].pos.set(0.0f,  0.01f,  2); vtx2[2].tex[0] = 0.5f;                 vtx2[2].tex[1] = 1.5f;
    num_vtx = 3;
  }
  return num_vtx;
}


//---------------------------------------------------------------------------
// particle system itself
//---------------------------------------------------------------------------
CSimpleParticleSystem::CSimpleParticleSystem()
{
#if TEST
  m_bUseFrustumCull = FALSE;
#else
  m_bUseFrustumCull = TRUE;
#endif

  m_bUseQuads       = TRUE;
  m_bLastUseQuads   = FALSE; // to create texture coords
  m_bUseArrays      = FALSE;
  m_bUseVBO         = TRUE;
  m_bUseAlphaTest   = TRUE;

  m_pTexture = NULL;

  m_FixedParticleSize = 1.5f;
  m_emitPerFrame = 50.1f;
  m_toEmit = 0.0f;
  m_life = 500;
  m_numDrawnParticles = 0;
}

CSimpleParticleSystem::~CSimpleParticleSystem()
{
  if (m_pTexture)
    delete m_pTexture;
}

void CSimpleParticleSystem::CreateParticle(CParticleData & pd)
{
  pd.m_pos.x = random(-200.0f, 200.0f);
  pd.m_pos.z = random(-200.0f, 0.0f);
  pd.m_pos.y = -pd.m_pos.z;
  pd.m_vel.set(0, random(-0.9f, -2.0f), 0.0f);

  pd.m_life = m_life;
  pd.m_size = m_FixedParticleSize;
}

void CSimpleParticleSystem::Update(float dt)
{
  m_toEmit += m_emitPerFrame * dt;
  m_numDrawnParticles = 0;

  for (int i=0; i < m_data.size(); ++i)
  {
    if (m_data[i].m_life <= 0) // particle is dead
    {
      m_data.removeFast(i--);
    } else // particle is alive
    {
      m_data[i].m_life -= dt;
      m_data[i].m_pos += m_data[i].m_vel * dt;
      if (m_data[i].m_pos.y <= 0)
      {
        //m_data.removeFast(i--);
        m_data[i].m_pos.y = random(0.001f, 0.99f);
        m_data[i].m_vel.set(0,0,0);
      }
    }
  }
  // create new particles
  CParticleData pd;
  while(m_toEmit >= 1.0f) // create new particles
  {
    CreateParticle(pd);
    m_data.add(pd);
    m_toEmit -= 1.0f;
  }
}

void CSimpleParticleSystem::RenderSetup()
{
  // check for texture & load if needed
  if (!m_pTexture)
  {
    m_pTexture = new CTexture;
    m_pTexture->load("particle.bmp");
  }
}

void CSimpleParticleSystem::RenderDone()
{
}

void CSimpleParticleSystem::Render()
{
  int i, j;
  matrix3d_t  view_mtx;     // view matrix
  matrix3d_t  inv_view_mtx; // inverted view matrix
  frustum3d_t frustum;      // camera frustum for culling

  CTexturedVertex vtx[4];  // for falling particles
  CTexturedVertex vtx2[4]; // for laying particles
  int             num_vtx; // number of vertices per particle - 3 or 4
  num_vtx = initBillboards(m_bUseQuads, vtx, vtx2);

  for (j=0; j<num_vtx; j++)
  {
    vtx[j].pos *= m_FixedParticleSize;
    vtx2[j].pos *= m_FixedParticleSize;
  }

  // transform for billboard
  camera.getViewMatrix(view_mtx);
  inv_view_mtx = view_mtx;
  inv_view_mtx.invert();
  for (j=0; j<num_vtx; j++)
    inv_view_mtx.transformVector(vtx[j].pos);

  if (m_bUseFrustumCull)
    frustum.setupFrustum(camera.m_fov, (float)ddraw_width, (float)ddraw_height, &inv_view_mtx);

  RenderSetup();

  m_numDrawnParticles = 0;

#if TEST
  i = 0;
#else
  for (i = 0; i < m_data.size(); i++)
#endif
  {
      vector3d_t a, b, c, d;
      float *a_tex, *b_tex, *c_tex, *d_tex;

      if (!m_bUseFrustumCull || frustum.isPointVisible(m_data[i].m_pos))
      {
#if !TEST
          if (m_data[i].m_pos.y <= 1.0f) {
              a = m_data[i].m_pos + vtx2[0].pos;
              b = m_data[i].m_pos + vtx2[1].pos;
              c = m_data[i].m_pos + vtx2[2].pos;
              
              if (m_bUseQuads)
                d = m_data[i].m_pos + vtx2[3].pos;
          } else {
              a = m_data[i].m_pos + vtx[0].pos;
              b = m_data[i].m_pos + vtx[1].pos;
              c = m_data[i].m_pos + vtx[2].pos;

              if (m_bUseQuads)
                d = m_data[i].m_pos + vtx[3].pos;
          }

          if (m_bUseQuads) {
              a_tex = vtx[0].tex;
              b_tex = vtx[1].tex;
              c_tex = vtx[2].tex;
              d_tex = vtx[3].tex;

              rasterizer_triangle3f((const vec3f *)&a, (const vec3f *)&b, (const vec3f *)&c, 
                  (const vec2f *)a_tex, (const vec2f *)b_tex, (const vec2f *)c_tex);
              rasterizer_triangle3f((const vec3f *)&c, (const vec3f *)&d, (const vec3f *)&a, 
                  (const vec2f *)c_tex, (const vec2f *)d_tex, (const vec2f *)a_tex);
          } else {
              a_tex = vtx[0].tex;
              b_tex = vtx[1].tex;
              c_tex = vtx[2].tex;

              rasterizer_triangle3f((const vec3f *)&a, (const vec3f *)&b, (const vec3f *)&c, 
                  (const vec2f *)a_tex, (const vec2f *)b_tex, (const vec2f *)c_tex);
          }
#else
          a = vector3d_t(-3, -1, -10.f);
          b = vector3d_t(3, -1, -10.f);
          c = vector3d_t(3, 4, -10.f);
          d = vector3d_t(-3, 4, -10.f);

          float tex[8] = {0, 0, 1, 0, 1, 1, 0, 1};
          
          a_tex = tex;
          b_tex = tex + 2;
          c_tex = tex + 4;
          d_tex = tex + 6;

          rasterizer_triangle3f((const vec3f *)&a, (const vec3f *)&b, (const vec3f *)&c, 
              (const vec2f *)a_tex, (const vec2f *)b_tex, (const vec2f *)c_tex);
          rasterizer_triangle3f((const vec3f *)&c, (const vec3f *)&d, (const vec3f *)&a, 
              (const vec2f *)c_tex, (const vec2f *)d_tex, (const vec2f *)a_tex);
#endif

          ++m_numDrawnParticles;
    }
  }

  RenderDone();
}


#include <float.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>

#include "common_main.h"
#include "common_ddraw.h"
#include "rasterizer.h"

#include "math3d.h"
#include "camera.h"
#include "ParticleSystem.h"


#define EXTRA_BUFFERING 1

CCamera camera;
CSimpleParticleSystem *particle_system = NULL;

#if EXTRA_BUFFERING
char *ddraw_buf = NULL;
#endif


extern "C" void dbgprintf(const char *msg, ...)
{
    char buffer[8192];
    va_list args;

    va_start(args, msg);
    vsprintf(buffer, msg, args);
    va_end(args);

    LOG("%s", buffer);
}


bool game_init()
{
    if (ddraw_bpp != 32) {
        return false;
    }
    
    
    _controlfp(_MCW_RC, _RC_CHOP);

    float fovy      = 3.1415926f / 180.0f * 60.0f;
    float tan_fovy2 = (float) tan(fovy / 2);
    rasterizer_init(dbgprintf, ddraw_width, ddraw_height, ddraw_pitch, 1.1f, 2000.0f, tan_fovy2);
    
#if EXTRA_BUFFERING
    ddraw_buf = (char *) malloc(ddraw_height * ddraw_pitch);
#endif


    rasterizer_set_color(0x0000ffff);

    particle_system = new CSimpleParticleSystem();

    // camera setup
    camera.m_fov    = fovy;
    camera.m_aspect = ddraw_width / (float) ddraw_height;
    camera.m_znear  = 1.1f;
    camera.m_zfar   = 2000;


    return true;
}

inline float random() { return rand() / (float) RAND_MAX; }


void game_timetick()
{
    ddraw_fill(0x00000000);

    char *frame = (char *) ddraw_lock();
#if EXTRA_BUFFERING
    memset(ddraw_buf, 0, ddraw_height * ddraw_pitch);
    rasterizer_begin_frame(ddraw_buf);
#else
    rasterizer_begin_frame(frame);
#endif



    matrix3d_t matrix;
    camera.getMatrix(matrix);
    matrix.at(1, 3) = -3.46f;
    rasterizer_set_mvproj(matrix);
    
    static __int64 time, prev_time = 0, freq;
    QueryPerformanceCounter((LARGE_INTEGER*)&time);
    float step = 0.2f;

#ifndef _DEBUG
    float base_step = 0.2f;
    
    if (prev_time) {
        float delta = (time - prev_time) / (float) freq;
        step = base_step * 80 * delta;
    } else {
        QueryPerformanceFrequency((LARGE_INTEGER*)&freq);
        step = base_step;
    
        for (int i = 0; i < 1500; i++) {
            particle_system->Update(step);
        }
    }
#endif // _DEBUG

    prev_time = time;
    particle_system->Update(step);
    particle_system->Render();


#if EXTRA_BUFFERING
    memcpy(frame, ddraw_buf, ddraw_height * ddraw_pitch);
#endif

    ddraw_unlock();   
    ddraw_flip();
}

bool game_mustexit()
{
    return common_is_key_pressed(VK_ESCAPE);
}


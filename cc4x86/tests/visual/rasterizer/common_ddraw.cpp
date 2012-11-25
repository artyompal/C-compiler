
#include <ddraw.h>
#include "common_main.h"
#include "common_ddraw.h"
#include "common_ddraw_error.h"


static bool fullscreen;
static HWND hwnd;

static IDirectDraw          *direct_draw   = NULL;
static IDirectDrawSurface   *front_surface = NULL;
static IDirectDrawSurface   *back_surface  = NULL;
static IDirectDrawClipper   *clipper       = NULL;

int ddraw_width;
int ddraw_height;
int ddraw_pitch;
int ddraw_bpp;


#define CHECK_INIT_DDRAW_RESULT(RES, FUNC)                                    \
   if (FAILED(RES)) {                                                         \
      LOG(FUNC "() failed: 0x%08x (%s)\n", RES, ddraw_describe_error(RES));   \
      ddraw_term();                                                           \
      return false;                                                           \
   }

#define CHECK_DDRAW_RESULT(RES, FUNC)                                         \
   if (FAILED(RES)) {                                                         \
      LOG(FUNC "() failed: 0x%08x (%s)\n", RES, ddraw_describe_error(RES));   \
      common_force_exit();                                                    \
   }


static void set_screen_dimentions();
static void set_pixel_format();


bool ddraw_init(HWND _hwnd, bool _fullscreen)
{
	HRESULT			ddrval;
	DDSURFACEDESC	ddsd;
	DDSCAPS			ddscaps;


   hwnd        = _hwnd;
   fullscreen  = _fullscreen;
   LOG("ddraw: init %s\n", (fullscreen ? "fullscreen" : "windowed"));
   
	ddrval = DirectDrawCreate(NULL, &direct_draw, NULL);
	CHECK_INIT_DDRAW_RESULT(ddrval, "DirectDrawCreate");

   if (fullscreen) {
      ddrval = direct_draw->SetCooperativeLevel(hwnd, DDSCL_EXCLUSIVE | DDSCL_FULLSCREEN);
      CHECK_INIT_DDRAW_RESULT(ddrval, "SetCooperativeLevel");

	   ddsd.dwSize				   = sizeof(ddsd);
	   ddsd.dwFlags			   = DDSD_CAPS | DDSD_BACKBUFFERCOUNT;
	   ddsd.ddsCaps.dwCaps		= DDSCAPS_PRIMARYSURFACE | DDSCAPS_FLIP | DDSCAPS_COMPLEX;
	   ddsd.dwBackBufferCount	= 1;

      ddrval = direct_draw->CreateSurface(&ddsd, &front_surface, NULL);
      CHECK_INIT_DDRAW_RESULT(ddrval, "CreateSurface");

      ddscaps.dwCaps = DDSCAPS_BACKBUFFER;
      ddrval = front_surface->GetAttachedSurface(&ddscaps, &back_surface);
      CHECK_INIT_DDRAW_RESULT(ddrval, "GetAttachedSurface");

      set_pixel_format();
   } else {
      ddrval = direct_draw->SetCooperativeLevel(0, DDSCL_NORMAL);
      CHECK_INIT_DDRAW_RESULT(ddrval, "SetCooperativeLevel");

      HDC hDC                 = GetDC(NULL);
      ddraw_bpp               = GetDeviceCaps(hDC, PLANES) * GetDeviceCaps(hDC, BITSPIXEL);
      ReleaseDC(NULL, hDC);
      
      RECT rect;
      GetWindowRect(hwnd, &rect);
      ddraw_width             = rect.right - rect.left;
      ddraw_height            = rect.bottom - rect.top;

      ddsd.dwSize				   = sizeof(ddsd);
      ddsd.dwFlags			   = DDSD_CAPS;
      ddsd.ddsCaps.dwCaps		= DDSCAPS_PRIMARYSURFACE;

      ddrval = direct_draw->CreateSurface(&ddsd, &front_surface, NULL);
      CHECK_INIT_DDRAW_RESULT(ddrval, "CreateSurface");

      ddsd.dwFlags			   = DDSD_CAPS | DDSD_WIDTH | DDSD_HEIGHT;
      ddsd.ddsCaps.dwCaps		= DDSCAPS_OFFSCREENPLAIN;
      ddsd.dwWidth            = ddraw_width;
      ddsd.dwHeight           = ddraw_height;

      ddrval = direct_draw->CreateSurface(&ddsd, &back_surface, NULL);
      CHECK_INIT_DDRAW_RESULT(ddrval, "CreateSurface");
      
      ddrval = direct_draw->CreateClipper(0, &clipper, NULL);
      CHECK_INIT_DDRAW_RESULT(ddrval, "CreateClipper");
      ddrval = clipper->SetHWnd(0, hwnd);
      CHECK_INIT_DDRAW_RESULT(ddrval, "clipper->SetHWnd");
      ddrval = front_surface->SetClipper(clipper);
      CHECK_INIT_DDRAW_RESULT(ddrval, "front_surface->SetClipper");
   }
   
   set_screen_dimentions();
   LOG("ddraw: initialized %dx%d, %d bit (pitch %d bytes)\n", ddraw_width, ddraw_height, ddraw_bpp, ddraw_pitch);

   return true;
}

void ddraw_term()
{
   LOG("ddraw: termination\n");

   if (clipper) clipper->Release();
   if (back_surface) back_surface->Unlock(NULL);
	direct_draw->FlipToGDISurface();
	if (back_surface) back_surface->Release();
	if (front_surface) front_surface->Release();
	direct_draw->Release();
}


static void set_screen_dimentions()
{
	HRESULT			ddrval;
	DDSURFACEDESC	ddsd;

	memset(&ddsd, 0, sizeof(ddsd));
	ddsd.dwSize    = sizeof(ddsd);
	ddrval         = back_surface->GetSurfaceDesc(&ddsd);
	CHECK_DDRAW_RESULT(ddrval, "GetSurfaceDesc");
	
	ASSERT((ddsd.dwFlags & DDSD_WIDTH) && (ddsd.dwFlags & DDSD_HEIGHT) && (ddsd.dwFlags & DDSD_PITCH));

    if (fullscreen) {
        ddraw_width	   = ddsd.dwWidth;
        ddraw_height	= ddsd.dwHeight;
    }

	ddraw_pitch    = ddsd.lPitch;
}

static void set_pixel_format()
{
	HRESULT			ddrval;
	DDPIXELFORMAT	ddpf;

	ddpf.dwSize		= sizeof(ddpf);
	ddrval			= back_surface->GetPixelFormat(&ddpf);
	CHECK_DDRAW_RESULT(ddrval, "GetPixelFormat");

	ASSERT2(ddpf.dwFlags & DDPF_RGB, "Surface does not support RGB format");
	ddraw_bpp      = ddpf.dwRGBBitCount;
}


void ddraw_fill(int color)
{
	HRESULT ddrval;
	DDBLTFX ddbltfx; 

	ddbltfx.dwSize		= sizeof(ddbltfx); 
	ddbltfx.dwFillColor	= color;

	ddrval = back_surface->Blt(NULL, NULL, NULL, DDBLT_COLORFILL, &ddbltfx); 
	CHECK_DDRAW_RESULT(ddrval, "Blt");
}

void ddraw_flip()
{
	HRESULT ddrval;

    if (fullscreen) {
   	    ddrval = front_surface->Flip(NULL, DDFLIP_NOVSYNC);
        CHECK_DDRAW_RESULT(ddrval, "Flip");
	} else {
        RECT rect;
        POINT pt;

        GetClientRect(hwnd, &rect);
        pt.x = pt.y = 0;
        ClientToScreen(hwnd, &pt);
        OffsetRect(&rect, pt.x, pt.y);

        ddrval = front_surface->Blt(&rect, back_surface, NULL, DDFLIP_WAIT, NULL);
        CHECK_DDRAW_RESULT(ddrval, "front_surface->Blt");
	}
}

void ddraw_text(int x, int y, const char *txt)
{
	HRESULT	ddrval;
	HDC		hdc;

	ddrval = back_surface->GetDC(&hdc);
	CHECK_DDRAW_RESULT(ddrval, "GetDC");

	SetBkColor(hdc, 0x000000); 
    SetTextColor(hdc, 0xFFFFFF); 
    TextOut(hdc, x, y, txt, (int)strlen(txt));
    
	back_surface->ReleaseDC(hdc); 
}


void *ddraw_lock()
{
	HRESULT			ddrval;
	DDSURFACEDESC	desc;

	desc.dwSize		= sizeof(desc);

	ddrval = back_surface->Lock(NULL, &desc, DDLOCK_WAIT, NULL);
	CHECK_DDRAW_RESULT(ddrval, "Lock");
	return desc.lpSurface;
}

void ddraw_unlock()
{
	HRESULT ddrval;

	ddrval = back_surface->Unlock(NULL);
	CHECK_DDRAW_RESULT(ddrval, "Unlock");
}


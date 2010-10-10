
#pragma once


extern int ddraw_width;
extern int ddraw_height;
extern int ddraw_pitch;
extern int ddraw_bpp;


bool     ddraw_init(HWND hwnd, bool fullscreen);
void     ddraw_term();
void     ddraw_fill(int color);
void     ddraw_flip();
void     ddraw_text(int x, int y, const char *txt);
void *   ddraw_lock();
void     ddraw_unlock();


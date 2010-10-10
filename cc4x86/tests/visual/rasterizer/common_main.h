
#pragma once


#define WIN32_LEAN_AND_MEAN
#include <windows.h>


// User input:
bool common_is_key_pressed(int vkey);


// Error handling:
void common_force_exit();
void common_assert(const char *file, int line, const char *message);

void common_reset_log();
void LOG(char const *fmt, ...);

#define ASSERT(COND)       if (!(COND)) common_assert(__FILE__, __LINE__, #COND);
#define ASSERT2(COND, MSG) if (!(COND)) common_assert(__FILE__, __LINE__, MSG);


// This functions must be provided by the game:
bool game_init();
void game_timetick();
bool game_mustexit();


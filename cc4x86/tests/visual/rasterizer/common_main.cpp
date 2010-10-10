
#include <stdio.h>

#include "common_main.h"
#include "common_ddraw.h"

#if !defined _DEBUG
static bool fullscreen   = true;
#else
static bool fullscreen   = false;
#endif
const char *title       = "main window";
HWND hwnd_main;


static const char *program_name = strstr(GetCommandLine(), "msvc") ? "msvc" : "cc";


bool create_main_window(HINSTANCE hInstance)
{
    WNDCLASS wc;

    memset(&wc, 0, sizeof(wc));
    wc.lpszClassName	= title;
    wc.hInstance		= hInstance;
    wc.lpfnWndProc		= DefWindowProc;

    if (!RegisterClass(&wc)) return false;

    if (fullscreen) {
        hwnd_main = CreateWindowEx(WS_EX_TOPMOST, title, title,WS_VISIBLE | WS_POPUP, 
            0, 0, 1, 1, NULL, NULL, hInstance, NULL);
    } else {
        hwnd_main = CreateWindow(title, title, WS_VISIBLE | WS_OVERLAPPEDWINDOW,
            CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, CW_USEDEFAULT, NULL, NULL, hInstance, NULL);
    }

    if (!hwnd_main) return false;

    SetFocus(hwnd_main);
    ShowWindow(hwnd_main, SW_SHOW);
    UpdateWindow(hwnd_main);

    SetCursor(NULL);
    return true;
}

int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE, LPSTR, int)
{
    MSG msg;

    common_reset_log();
    LOG("common: starting\n");

    if (!create_main_window(hInstance)) {
        LOG("common: create_main_window() failed\n");
        return 0;
    }

    if (!ddraw_init(hwnd_main, fullscreen)) {
        LOG("common: ddraw_init() failed\n");
        return 0;
    }

    if (!game_init()) {
        LOG("common: game_init() failed\n");
        return 0;
    }

    LOG("common: running main loop\n");


    while (!game_mustexit()) {
        while (PeekMessage(&msg, NULL, 0, 0, PM_REMOVE)) {
            TranslateMessage(&msg);
            DispatchMessage(&msg);
        }

        game_timetick();
    }


    LOG("common: main loop ended\n");
    ddraw_term();
    LOG("common: quiting\n");
    return 0;
}


void common_force_exit()
{
    LOG("common: forced quit\n");

    ddraw_term();
    DestroyWindow(hwnd_main);

    LOG("common: quiting\n");
    ExitProcess(0);
}

void common_assert(const char *file, int line, const char *message)
{
    LOG("assertion failed: '%s' in %s:%d\n", message, file, line);
    __asm int 3;
}

const char *get_log_filename()
{
    static char log_filename[256];
    sprintf(log_filename, "log_%s.txt", program_name);
    return log_filename;
}

void common_reset_log()
{
    DeleteFile(get_log_filename());
}

static void common_log(const char *message)
{
    FILE *log = fopen(get_log_filename(), "a+b");
    if (!log) {
        MessageBox(NULL, "Could not open log.\n\n:P\n999(((\n:-(((((\n:-{[\n:-&", "Fatal error", MB_ICONERROR);
        ExitProcess(0);
    }
    
    fwrite(message, 1, strlen(message), log);
    fclose(log);

    OutputDebugString(message);
}

void LOG(char const *fmt, ...)
{
    char buffer[1024];
    va_list args;

    SYSTEMTIME t;
    GetLocalTime(&t);
    _snprintf(buffer, sizeof(buffer), "%02d.%02d.%04d %02d:%02d:%02d.%03d ",
        t.wDay, t.wMonth, t.wYear, t.wHour, t.wMinute, t.wSecond, t.wMilliseconds);
    common_log(buffer);

    va_start(args, fmt);
    _vsnprintf(buffer, sizeof(buffer), fmt, args);
    common_log(buffer);
    va_end(args);
}

bool common_is_key_pressed(int vkey)
{ 
    return (GetAsyncKeyState(vkey) && 0x8000);
}


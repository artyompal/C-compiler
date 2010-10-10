
#ifndef RASTERIZER_H__INCLUDED
#define RASTERIZER_H__INCLUDED


typedef struct vec2i_decl {
    int         x, y;
} vec2i;

typedef struct vec2f_decl {
    float       x, y;
} vec2f;

typedef struct vec3f_decl {
    float       x, y, z;
} vec3f;

typedef struct vec4f_decl {
    float       x, y, z, w;
} vec4f;

typedef struct polygon_2i_decl {
    vec2i       points[5];
    int         points_cnt;
} polygon_2i;

typedef struct polygon_4f_decl {
    vec4f       points[5];
    int         points_cnt;
} polygon_4f;

typedef struct matrix4f_decl {
    float       m00, m01, m02, m03;
    float       m10, m11, m12, m13;
    float       m20, m21, m22, m23;
    float       m30, m31, m32, m33;
} matrix4f;


void matrix4f_make_identity(matrix4f *dst);
void matrix4f_make_perspective(matrix4f *dst, float znear, float zfar, float fovy, float aspect);
void matrix4f_make_viewport(matrix4f *dst, float width, float height, float znear, float zfar);
void matrix4f_mul(matrix4f *dst, const matrix4f *lhs, const matrix4f *lhr);
void matrix4f_transform(vec4f *dst, const vec4f *src, const matrix4f *mat);

extern "C" void rasterizer_init(void (*_dbgprintf)(const char *msg, ...), int width, int height, int pitch, float znear, float zfar, float fovy);
extern "C" void rasterizer_begin_frame(void *videomem);
extern "C" void rasterizer_set_mvproj(const float matrix[16]);
extern "C" void rasterizer_set_color(int color);
extern "C" void rasterizer_set_texture(void *texture_data, int texture_width, int texture_height);
extern "C" void rasterizer_triangle3f(const vec3f *a, const vec3f *b, const vec3f *c, 
    const vec2f *a_tex, const vec2f *b_tex, const vec2f *c_tex);


#endif // RASTERIZER_H__INCLUDED


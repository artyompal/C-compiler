

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

typedef struct vertex2i_decl {
    vec2i       position;
    vec2f       texcoord;
} vertex2i;

typedef struct vertex4f_decl {
    vec4f       position;
    vec2f       texcoord;
} vertex4f;

typedef struct polygon2i_decl {
    vertex2i    points[8];
    int         points_cnt;
} polygon2i;

typedef struct polygon4f_decl {
    vertex4f    points[8];
    int         points_cnt;
} polygon4f;

typedef struct matrix4f_decl {
    float       m00, m01, m02, m03;
    float       m10, m11, m12, m13;
    float       m20, m21, m22, m23;
    float       m30, m31, m32, m33;
} matrix4f;


static void (*_dbgprintf)(const char *msg, ...);


static void matrix4f_make_identity(matrix4f *dst);
static void matrix4f_make_perspective(matrix4f *dst, float znear, float zfar, float tan_fovy2, float aspect);
static void matrix4f_make_viewport(matrix4f *dst, float width, float height, float znear, float zfar);
static void matrix4f_mul(matrix4f *dst, const matrix4f *lhs, const matrix4f *lhr);
static void matrix4f_transform(vec4f *dst, const vec4f *src, const matrix4f *mat);

void rasterizer_init(void (*__dbgprintf)(const char *msg, ...), int width, int height, int pitch, float znear, float zfar, float tan_fovy2);
void rasterizer_begin_frame(void *videomem);
void rasterizer_triangle3f(const vec3f *a, const vec3f *b, const vec3f *c,
                           const vec2f *a_tex, const vec2f *b_tex, const vec2f *c_tex);


static int _width;
static int _height;
static int _pitch;
static int _color;
static char *_videomem;

static matrix4f _mvproj_matrix;
static matrix4f _viewport_matrix;

static vec4f _clip_z_near_base;
static vec4f _clip_z_near_norm;
static vec4f _clip_z_far_base;
static vec4f _clip_z_far_norm;

static vec4f _clip_plane_left_base;
static vec4f _clip_plane_left_norm;
static vec4f _clip_plane_right_base;
static vec4f _clip_plane_right_norm;
static vec4f _clip_plane_top_base;
static vec4f _clip_plane_top_norm;
static vec4f _clip_plane_bottom_base;
static vec4f _clip_plane_bottom_norm;

typedef unsigned char byte;

static byte *_texture_data;
static int _texture_width;
static int _texture_height;


//static void _print_poly4f(const char *msg, const polygon4f *poly)
//{
//    int i = 0;
//
//    dbgprintf("%s\n", msg);
//    dbgprintf("poly->points_points=%p poly->points_cnt=%d\n", poly->points, poly->points_cnt);
//
//    for (i = 0; i < poly->points_cnt; i++) {
//        dbgprintf("poly->points[%d]=(%f,%f,%f,%f)\n",
//            i, poly->points[i].x, poly->points[i].y, poly->points[i].z, poly->points[i].w);
//    }
//}
//
//static void _print_vec4f(const char *msg, const vec4f *vec)
//{
//    dbgprintf("%s=(%f,%f,%f,%f)\n", msg, vec->x, vec->y, vec->z, vec->w);
//}
//
//static void _print_mat4f(const char *msg, const matrix4f *mat)
//{
//    dbgprintf("%s=((%f,%f,%f,%f),\n(%f,%f,%f,%f),\n(%f,%f,%f,%f),\n(%f,%f,%f,%f))\n", msg,
//        mat->m00, mat->m01, mat->m02, mat->m03, mat->m10, mat->m11, mat->m12, mat->m13,
//        mat->m20, mat->m21, mat->m22, mat->m23, mat->m30, mat->m31, mat->m32, mat->m33);
//}


//
// Math routines.
//

static void vec2f_add(vec2f *dst, const vec2f *lhs, const vec2f *rhs)
{
    dst->x = lhs->x + rhs->x;
    dst->y = lhs->y + rhs->y;
}

static void vec2f_subtract(vec2f *dst, const vec2f *lhs, const vec2f *rhs)
{
    dst->x = lhs->x - rhs->x;
    dst->y = lhs->y - rhs->y;
}

static void vec2f_mul(vec2f *vec, float rhs)
{
    vec->x *= rhs;
    vec->y *= rhs;
}


static void vec4f_assign(vec4f *dst, float x, float y, float z, float w)
{
    dst->x = x;
    dst->y = y;
    dst->z = z;
    dst->w = w;
}

static void vec4f_add(vec4f *dst, const vec4f *lhs, const vec4f *rhs)
{
    dst->x = lhs->x + rhs->x;
    dst->y = lhs->y + rhs->y;
    dst->z = lhs->z + rhs->z;
    dst->w = lhs->w + rhs->w;
}

static void vec4f_subtract(vec4f *dst, const vec4f *lhs, const vec4f *rhs)
{
    dst->x = lhs->x - rhs->x;
    dst->y = lhs->y - rhs->y;
    dst->z = lhs->z - rhs->z;
    dst->w = lhs->w - rhs->w;
}

static float vec4f_dot(const vec4f *lhs, const vec4f *rhs)
{
    return lhs->x * rhs->x + lhs->y * rhs->y + lhs->z * rhs->z + lhs->w * rhs->w;
}

static void vec4f_mul(vec4f *vec, float rhs)
{
    vec->x *= rhs;
    vec->y *= rhs;
    vec->z *= rhs;
    vec->w *= rhs;
}

static int vec4f_is_equal(const vec4f *lhs, const vec4f *rhs)
{
    vec4f tmp;
    float len_sqr;

    vec4f_subtract(&tmp, lhs, rhs);
    len_sqr = vec4f_dot(&tmp, &tmp);
    return (len_sqr < 0.0001);
}


static void matrix4f_make_identity(matrix4f *dst)
{
    dst->m00 = 1, dst->m01 = 0, dst->m02 = 0, dst->m03 = 0;
    dst->m10 = 0, dst->m11 = 1, dst->m12 = 0, dst->m13 = 0;
    dst->m20 = 0, dst->m21 = 0, dst->m22 = 1, dst->m23 = 0;
    dst->m30 = 0, dst->m31 = 0, dst->m32 = 0, dst->m33 = 1;
}

static void matrix4f_make_perspective(matrix4f *dst, float znear, float zfar, float tan_fovy2, float aspect)
{
    float h = tan_fovy2 * znear;
    float w = h * aspect;

    dst->m00 = znear/w,  dst->m01 = 0,        dst->m02 = 0,                       dst->m03 = 0;
    dst->m10 = 0,        dst->m11 = znear/h,  dst->m12 = 0,                       dst->m13 = 0;
    dst->m20 = 0,        dst->m21 = 0,        dst->m22 = zfar/(zfar-znear),       dst->m23 = 1;
    dst->m30 = 0,        dst->m31 = 0,        dst->m32 = znear*zfar/(znear-zfar), dst->m33 = 0;
}

static void matrix4f_make_viewport(matrix4f *dst, float width, float height, float znear, float zfar)
{
    dst->m00 = width/2,  dst->m01 = 0,           dst->m02 = 0,              dst->m03 = 0;
    dst->m10 = 0,        dst->m11 = -height/2,   dst->m12 = 0,              dst->m13 = 0;
    dst->m20 = 0,        dst->m21 = 0,           dst->m22 = zfar - znear,   dst->m23 = 0;
    dst->m30 = width/2,  dst->m31 = height/2,    dst->m32 = znear,          dst->m33 = 1;
}

static void matrix4f_mul(matrix4f *dst, const matrix4f *lhs, const matrix4f *rhs)
{
    dst->m00 = lhs->m00 * rhs->m00 + lhs->m01 * rhs->m10 + lhs->m02 * rhs->m20 + lhs->m03 * rhs->m30;
    dst->m01 = lhs->m00 * rhs->m01 + lhs->m01 * rhs->m11 + lhs->m02 * rhs->m21 + lhs->m03 * rhs->m31;
    dst->m02 = lhs->m00 * rhs->m02 + lhs->m01 * rhs->m12 + lhs->m02 * rhs->m22 + lhs->m03 * rhs->m32;
    dst->m03 = lhs->m00 * rhs->m03 + lhs->m01 * rhs->m13 + lhs->m02 * rhs->m23 + lhs->m03 * rhs->m33;

    dst->m10 = lhs->m10 * rhs->m00 + lhs->m11 * rhs->m10 + lhs->m12 * rhs->m20 + lhs->m13 * rhs->m30;
    dst->m11 = lhs->m10 * rhs->m01 + lhs->m11 * rhs->m11 + lhs->m12 * rhs->m21 + lhs->m13 * rhs->m31;
    dst->m12 = lhs->m10 * rhs->m02 + lhs->m11 * rhs->m12 + lhs->m12 * rhs->m22 + lhs->m13 * rhs->m32;
    dst->m13 = lhs->m10 * rhs->m03 + lhs->m11 * rhs->m13 + lhs->m12 * rhs->m23 + lhs->m13 * rhs->m33;

    dst->m20 = lhs->m20 * rhs->m00 + lhs->m21 * rhs->m10 + lhs->m22 * rhs->m20 + lhs->m23 * rhs->m30;
    dst->m21 = lhs->m20 * rhs->m01 + lhs->m21 * rhs->m11 + lhs->m22 * rhs->m21 + lhs->m23 * rhs->m31;
    dst->m22 = lhs->m20 * rhs->m02 + lhs->m21 * rhs->m12 + lhs->m22 * rhs->m22 + lhs->m23 * rhs->m32;
    dst->m23 = lhs->m20 * rhs->m03 + lhs->m21 * rhs->m13 + lhs->m22 * rhs->m23 + lhs->m23 * rhs->m33;

    dst->m30 = lhs->m30 * rhs->m00 + lhs->m31 * rhs->m10 + lhs->m32 * rhs->m20 + lhs->m33 * rhs->m30;
    dst->m31 = lhs->m30 * rhs->m01 + lhs->m31 * rhs->m11 + lhs->m32 * rhs->m21 + lhs->m33 * rhs->m31;
    dst->m32 = lhs->m30 * rhs->m02 + lhs->m31 * rhs->m12 + lhs->m32 * rhs->m22 + lhs->m33 * rhs->m32;
    dst->m33 = lhs->m30 * rhs->m03 + lhs->m31 * rhs->m13 + lhs->m32 * rhs->m23 + lhs->m33 * rhs->m33;
}

static void matrix4f_transform(vec4f *dst, const vec4f *vec, const matrix4f *mat)
{
    dst->x = vec->x * mat->m00 + vec->y * mat->m10 + vec->z * mat->m20 + vec->w * mat->m30;
    dst->y = vec->x * mat->m01 + vec->y * mat->m11 + vec->z * mat->m21 + vec->w * mat->m31;
    dst->z = vec->x * mat->m02 + vec->y * mat->m12 + vec->z * mat->m22 + vec->w * mat->m32;
    dst->w = vec->x * mat->m03 + vec->y * mat->m13 + vec->z * mat->m23 + vec->w * mat->m33;
}

static void matrix4f_transpose(matrix4f *mat)
{
    mat->m01 = mat->m10, mat->m02 = mat->m20, mat->m03 = mat->m30;
    mat->m12 = mat->m21, mat->m13 = mat->m31;
    mat->m23 = mat->m32;
}


//
// Rasterizer initialization.
//

void rasterizer_init(void (*__dbgprintf)(const char *msg, ...), int width, int height, int pitch, float znear, float zfar, float tan_fovy2)
{
    _dbgprintf = __dbgprintf;

    _width   = width;
    _height  = height;
    _pitch   = pitch;

    matrix4f_make_perspective(&_mvproj_matrix, znear, zfar, tan_fovy2, (float) width / height);
    matrix4f_make_viewport(&_viewport_matrix, (float) width, (float) height, znear, zfar);

    vec4f_assign(&_clip_z_near_base, 0, 0, znear, 1.0f);
    vec4f_assign(&_clip_z_near_norm, 0, 0, (zfar > znear ? 1.0f : -1.0f), 1.0f);
    vec4f_assign(&_clip_z_far_base,  0, 0, zfar, 1.0f);
    vec4f_assign(&_clip_z_far_norm,  0, 0, (zfar > znear ? -1.0f : 1.0f), 1.0f);

    vec4f_assign(&_clip_plane_left_base,   -1.0f + 1.0f/width, 0.0f, 0.0f, 1.0f);  // workaround to improper FIST rounding
    vec4f_assign(&_clip_plane_left_norm,    1.0f, 0.0f, 0.0f, 1.0f);
    vec4f_assign(&_clip_plane_right_base,   1.0f - 1.0f/width, 0.0f, 0.0f, 1.0f);
    vec4f_assign(&_clip_plane_right_norm,  -1.0f, 0.0f, 0.0f, 1.0f);
    vec4f_assign(&_clip_plane_top_base,     0.0f,-1.0f + 1.0f/height, 0.0f, 1.0f);
    vec4f_assign(&_clip_plane_top_norm,     0.0f, 1.0f, 0.0f, 1.0f);
    vec4f_assign(&_clip_plane_bottom_base,  0.0f, 1.0f, 0.0f, 1.0f);
    vec4f_assign(&_clip_plane_bottom_norm,  0.0f,-1.0f, 0.0f, 1.0f);
}

void rasterizer_begin_frame(void *videomem)
{
    _videomem       = (char *) videomem;
}

void rasterizer_set_mvproj(const float matrix[16])
{
    _mvproj_matrix  = *(matrix4f *) matrix;
}

void rasterizer_set_color(int byte)
{
    _color          = byte;
}

void rasterizer_set_texture(void *texture_data, int texture_width, int texture_height)
{
    _texture_data   = (byte *) texture_data;
    _texture_width  = texture_width;
    _texture_height = texture_height;
}


//
// 2D triangle rasterizer.
//

// NEAREST:
//static int _tex2d(float u, float v)
//{
//    int x   = (int)((_texture_width - 1) * u);
//    int y   = (int)((_texture_height - 1) * v);
//
//    //if (x < 0 || x >= _texture_width || y < 0 || y >= _texture_height) {
//    //    *(int *)0 = 0;
//    //}
//
//    return _texture_data[y * _texture_width + x];
//}

// TODO: компилятор должен справляться с инлайнингом этой функции;
// сгенерированный код должен быть идентичным.
//#include <math.h>
//
//// BILINEAR:
//static void _tex2d_bilinear(byte *b, byte *g, byte *r, byte *a, float u, float v)
//{
//    float s     = (_texture_width - 1) * u;
//    float t     = (_texture_height - 1) * v;
//    float s0    = (float) floor(s);
//    float t0    = (float) floor(t);
//    float s1w   = s-s0;
//    float s0w   = 1.0f-s1w;
//    float t1w   = t-t0;
//    float t0w   = 1.0f-t1w;
//    
//    int s0i     = (int) s0;
//    int t0i     = (int) t0;
//    
//    byte *s0t0  = &_texture_data[4 * (t0i * _texture_width + s0i)];
//    byte *s1t0  = &_texture_data[4 * (t0i * _texture_width + s0i+1)];
//    byte *s0t1  = &_texture_data[4 * ((t0i+1) * _texture_width + s0i)];
//    byte *s1t1  = &_texture_data[4 * ((t0i+1) * _texture_width + s0i+1)];
//    
//    *b = (byte)((s0t0[0]*s0w + s1t0[0]*s1w)*t0w + (s0t1[0]*s0w + s1t1[0]*s1w)*t1w);
//    *g = (byte)((s0t0[1]*s0w + s1t0[1]*s1w)*t0w + (s0t1[1]*s0w + s1t1[1]*s1w)*t1w);
//    *r = (byte)((s0t0[2]*s0w + s1t0[2]*s1w)*t0w + (s0t1[2]*s0w + s1t1[2]*s1w)*t1w);
//    *a = (byte)((s0t0[3]*s0w + s1t0[3]*s1w)*t0w + (s0t1[3]*s0w + s1t1[3]*s1w)*t1w);
//
//    //if (x < 0 || x >= _texture_width || y < 0 || y >= _texture_height) {
//    //    *(int *)0 = 0;
//    //}
//}

static void _rasterize_horiz_line(int x1, int x2, int y, float u, float v, float dudx, float dvdx)
{
    char *pixel, *line_end;
    byte blue, green, alpha;
    byte dst_green, dst_blue;
    float float_alpha;


    //if (x1 < 0 || x1 >= _width || x2 < 0 || x2 >= _width || y < 0 || y >= _width) {
    //    *(int *) 0 = 0;
    //}

    pixel       = _videomem + _pitch*y + 4*x1;
    line_end    = pixel + 4*(x2 - x1);

    do {
        //if (u < -0.0001f || u > 1.0001f || v < -0.0001f || v > 1.0001f) {
        //    *(int *)0 = 0;
        //}


        //// byte fill test:
        //*pixel      = _color;


        //// byte interpolation test:
        //red         = (int)(255 * v);
        //green       = (int)(255 * u);
        //blue        = (int)(255 * (2 - u - v) / 2.0f);
        //
        ////if (red < 0 || red > 255 || green < 0 || green > 255 || blue < 0 || blue > 255) {
        ////     *(int *)0 = 0;
        ////}
        //
        //*pixel      = red * 0x10000 + green * 0x100 + blue;


        //// simple texturing test:
        //*pixel      = _tex2d(u, v);


        //// texturing multiplying by alpha test:
        //src_color   = _tex2d(u, v);

        //int_alpha   = ((src_color >> 24) & 0xFF);
        //green       = (src_color & 0x0000FF00) >> 8;
        //blue        = src_color & 0x000000FF;

        //green       = green * int_alpha / 256;
        //blue        = blue * int_alpha / 256;

        ////if (green < 0 || green > 255 || blue < 0 || blue > 255) {
        ////    *(int *)0 = 0;
        ////}

        //res_color   = (green << 8) + blue;
        //*pixel      = res_color;






        //// texturing with alpha-blending test (requires #define EXTRA_BUFFERING 1 in test_main.cpp)
        //_tex2d_bilinear(&blue, &green, &red, &alpha, u, v);
        float s     = (_texture_width - 1) * u;
        float t     = (_texture_height - 1) * v;
        int s0i     = (int) s;
        int t0i     = (int) t;
        float s1w   = s-s0i;
        float s0w   = 1.0f-s1w;
        float t1w   = t-t0i;
        float t0w   = 1.0f-t1w;

        byte *s0t0  = &_texture_data[4 * (t0i * _texture_width + s0i)];
        byte *s1t0  = &_texture_data[4 * (t0i * _texture_width + s0i+1)];
        byte *s0t1  = &_texture_data[4 * ((t0i+1) * _texture_width + s0i)];
        byte *s1t1  = &_texture_data[4 * ((t0i+1) * _texture_width + s0i+1)];

        blue    = (byte)((s0t0[0]*s0w + s1t0[0]*s1w)*t0w + (s0t1[0]*s0w + s1t1[0]*s1w)*t1w);
        green   = (byte)((s0t0[1]*s0w + s1t0[1]*s1w)*t0w + (s0t1[1]*s0w + s1t1[1]*s1w)*t1w);
        //red     = (byte)((s0t0[2]*s0w + s1t0[2]*s1w)*t0w + (s0t1[2]*s0w + s1t1[2]*s1w)*t1w);
        alpha   = (byte)((s0t0[3]*s0w + s1t0[3]*s1w)*t0w + (s0t1[3]*s0w + s1t1[3]*s1w)*t1w);

        if (alpha) {
            float_alpha = alpha / 255.0f;

            dst_blue    = pixel[0];
            dst_green   = pixel[1];

            blue        = (byte)(blue * float_alpha + dst_blue * (1-float_alpha));
            green       = (byte)(green * float_alpha + dst_green * (1-float_alpha));

            //if (green < 0 || green > 255 || blue < 0 || blue > 255) {
            //    *(int *)0 = 0;
            //}

            pixel[0]    = blue;
            pixel[1]    = green;
        }

        u += dudx;
        v += dvdx;
        
        pixel += 4;
    } while (pixel < line_end);
}

static void _rasterize_horiz_line__unordered(int x1, int x2, int y, float u1, float v1, float u2, float v2,
    float dudx, float dvdx)
{
    if (x1 <= x2) {
        _rasterize_horiz_line(x1, x2, y, u1, v1, dudx, dvdx);
    } else {
        _rasterize_horiz_line(x2, x1, y, u2, v2, dudx, dvdx);
    }
}

static void _rasterize_triangle_1i(int x1, int x2, int x3, int y, const vec2f *uv1, const vec2f *uv2, const vec2f *uv3,
    float dudx, float dvdx)
{
    if (x1 < x2) {
        if (x3 > x2) {
            _rasterize_horiz_line(x1, x3, y, uv1->x, uv1->y, dudx, dvdx);
        } else if (x3 < x1) {
            _rasterize_horiz_line(x3, x2, y, uv3->x, uv3->y, dudx, dvdx);
        } else {
            _rasterize_horiz_line(x1, x2, y, uv1->x, uv1->y, dudx, dvdx);
        }
    } else {
        if (x3 < x2) {
            _rasterize_horiz_line(x3, x1, y, uv3->x, uv3->y, -dudx, -dvdx);
        } else if (x3 > x1) {
            _rasterize_horiz_line(x2, x3, y, uv2->x, uv2->y, -dudx, -dvdx);
        } else {
            _rasterize_horiz_line(x2, x1, y, uv2->x, uv2->y, -dudx, -dvdx);
        }
    }
}

static void _rasterize_triangle_2i(const vertex2i *a, const vertex2i *b, const vertex2i *c)
{
    const vertex2i *tmp;
    int x1, x2, y;
    float u1, v1, u2, v2, dudx, dvdx;


    if (a->position.y > b->position.y) { tmp = a; a = b; b = tmp; }
    if (a->position.y > c->position.y) { tmp = a; a = c; c = tmp; }
    if (b->position.y > c->position.y) { tmp = b; b = c; c = tmp; }

    if (a->position.y == c->position.y) {
        if (a->position.y >= 0 && a->position.y < _height) {
            _rasterize_triangle_1i(a->position.x, b->position.x, c->position.x, a->position.y,
                &a->texcoord, &b->texcoord, &c->texcoord, 0, 0);
        }

        return;
    }


    for (y = a->position.y; y < b->position.y; y++) {
        x1 = (y - a->position.y) * (b->position.x - a->position.x) / (b->position.y - a->position.y) + a->position.x;
        x2 = (y - a->position.y) * (c->position.x - a->position.x) / (c->position.y - a->position.y) + a->position.x;

        u1 = (y - a->position.y) * (b->texcoord.x - a->texcoord.x) / (b->position.y - a->position.y) + a->texcoord.x;
        u2 = (y - a->position.y) * (c->texcoord.x - a->texcoord.x) / (c->position.y - a->position.y) + a->texcoord.x;

        v1 = (y - a->position.y) * (b->texcoord.y - a->texcoord.y) / (b->position.y - a->position.y) + a->texcoord.y;
        v2 = (y - a->position.y) * (c->texcoord.y - a->texcoord.y) / (c->position.y - a->position.y) + a->texcoord.y;

        dudx = (u2 - u1) / (x2 - x1);
        dvdx = (v2 - v1) / (x2 - x1);

        _rasterize_horiz_line__unordered(x1, x2, y, u1, v1, u2, v2, dudx, dvdx);
    }


    x2 = (b->position.y - a->position.y) * (c->position.x - a->position.x) / (c->position.y - a->position.y)
       + a->position.x;
    u2 = (b->position.y - a->position.y) * (c->texcoord.x - a->texcoord.x) / (c->position.y - a->position.y)
       + a->texcoord.x;
    v2 = (b->position.y - a->position.y) * (c->texcoord.y - a->texcoord.y) / (c->position.y - a->position.y)
       + a->texcoord.y;

    dudx = (u2 - b->texcoord.x) / (x2 - b->position.x);
    dvdx = (v2 - b->texcoord.y) / (x2 - b->position.x);

    _rasterize_horiz_line__unordered(x2, b->position.x, b->position.y, u2, v2, b->texcoord.x, b->texcoord.y, dudx, dvdx);


    for (y = b->position.y + 1; y < c->position.y; y++) {
        x1 = (y - b->position.y) * (c->position.x - b->position.x) / (c->position.y - b->position.y) + b->position.x;
        x2 = (y - a->position.y) * (c->position.x - a->position.x) / (c->position.y - a->position.y) + a->position.x;

        u1 = (y - b->position.y) * (c->texcoord.x - b->texcoord.x) / (c->position.y - b->position.y) + b->texcoord.x;
        u2 = (y - a->position.y) * (c->texcoord.x - a->texcoord.x) / (c->position.y - a->position.y) + a->texcoord.x;

        v1 = (y - b->position.y) * (c->texcoord.y - b->texcoord.y) / (c->position.y - b->position.y) + b->texcoord.y;
        v2 = (y - a->position.y) * (c->texcoord.y - a->texcoord.y) / (c->position.y - a->position.y) + a->texcoord.y;

        dudx = (u2 - u1) / (x2 - x1);
        dvdx = (v2 - v1) / (x2 - x1);

        _rasterize_horiz_line__unordered(x1, x2, y, u1, v1, u2, v2, dudx, dvdx);
    }
}


//
// Clipping and 3D transformations.
//

static void _clip_on_plain(polygon4f *dst, const polygon4f *src, vec4f *base, vec4f *normal)
{
    const vertex4f *i, *j;
    vec4f tmp, tmp2;
    vec2f texcoord_diff;
    float mul_beg, mul_end, scale;


    dst->points_cnt = 0;

    for (i = src->points, j = src->points + 1; j < src->points + src->points_cnt; i++, j++) {
        vec4f_subtract(&tmp, &i->position, base);
        mul_beg = vec4f_dot(&tmp, normal);

        vec4f_subtract(&tmp, &j->position, base);
        mul_end = vec4f_dot(&tmp, normal);

        if (mul_beg >= 0) {
            dst->points[dst->points_cnt++] = *i;
        }

        if (mul_beg > 0 && mul_end < 0 || mul_end >= 0 && mul_beg < 0) {
            //scale = ( (base - *i) * normal) / ( (*j - *i) * normal);
            vec4f_subtract(&tmp, base, &i->position);
            vec4f_subtract(&tmp2, &j->position, &i->position);
            scale = vec4f_dot(&tmp, normal) / vec4f_dot(&tmp2, normal);

            //inter.position = *i + (*j - *i) * scale;
            vec4f_mul(&tmp2, scale);
            vec4f_add(&dst->points[dst->points_cnt].position, &i->position, &tmp2);

            //inter.texcoord = i->texcoord + (j->texcoord - i->texcoord) * scale;
            vec2f_subtract(&texcoord_diff, &j->texcoord, &i->texcoord);
            vec2f_mul(&texcoord_diff, scale);
            vec2f_add(&dst->points[dst->points_cnt].texcoord, &i->texcoord, &texcoord_diff);

            dst->points_cnt++;
        }
    }

    dst->points[dst->points_cnt++] = dst->points[0];
}

static int _clip_poligon(polygon4f *poly)
{
    polygon4f tmp;

    _clip_on_plain(&tmp, poly, &_clip_z_far_base,       &_clip_z_far_norm);
    _clip_on_plain(poly, &tmp, &_clip_z_near_base,      &_clip_z_near_norm);
    _clip_on_plain(&tmp, poly, &_clip_plane_left_base,  &_clip_plane_left_norm);
    _clip_on_plain(poly, &tmp, &_clip_plane_right_base, &_clip_plane_right_norm);
    _clip_on_plain(&tmp, poly, &_clip_plane_top_base,   &_clip_plane_top_norm);
    _clip_on_plain(poly, &tmp, &_clip_plane_bottom_base,&_clip_plane_bottom_norm);

    return (poly->points_cnt > 1);
}

static void _transform_to_screen_space(vec2i *dst, vec4f *vec)
{
    vec4f viewport_coord;
    float rsp;

    matrix4f_transform(&viewport_coord, vec, &_viewport_matrix);

    rsp      = 1.0f / viewport_coord.w;
    dst->x   = (int) (viewport_coord.x * rsp);
    dst->y   = (int) (viewport_coord.y * rsp);

    if (dst->x < 0 || dst->x >= _width || dst->y < 0 || dst->y >= _height) {
        *(int *)0 = 0;
    }
}

static void _rasterize_polygon_4f(polygon4f *poly)
{
    polygon2i screen_poly;
    int i;


    if (!_clip_poligon(poly)) {
        return;
    }

    if (poly->points_cnt > sizeof(poly->points) / sizeof(poly->points[0])) {
        *(int*)0 = 0;
    }

    for (i = 0; i < poly->points_cnt; i++) {
        _transform_to_screen_space(&screen_poly.points[i].position, &poly->points[i].position);
        screen_poly.points[i].texcoord = poly->points[i].texcoord;
    }

    for (i = 2; i < poly->points_cnt - 1; i++) {
        _rasterize_triangle_2i(&screen_poly.points[0], &screen_poly.points[i - 1], &screen_poly.points[i]);
    }
}

static void _transform_to_projection_space(vec4f *dst, const vec3f *src)
{
    vec4f vertex;

    vec4f_assign(&vertex, src->x, src->y, src->z, 1.0f);
    matrix4f_transform(dst, &vertex, &_mvproj_matrix);
}


void rasterizer_triangle3f(const vec3f *a, const vec3f *b, const vec3f *c,
                           const vec2f *a_tex, const vec2f *b_tex, const vec2f *c_tex)
{
    polygon4f poly;

    _transform_to_projection_space(&poly.points[0].position, a);
    poly.points[0].texcoord = *a_tex;

    _transform_to_projection_space(&poly.points[1].position, b);
    poly.points[1].texcoord = *b_tex;

    _transform_to_projection_space(&poly.points[2].position, c);
    poly.points[2].texcoord = *c_tex;

    poly.points[3]  = poly.points[0];
    poly.points_cnt = 4;

    _rasterize_polygon_4f(&poly);
}


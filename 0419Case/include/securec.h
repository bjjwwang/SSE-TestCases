

#ifndef errno_t
typedef int errno_t;
#endif

#ifndef EOK
#define EOK 0
#endif

#ifndef ERANGE
#define ERANGE 34
#endif


#ifndef SECUREC_API
#if defined(SECUREC_DLL_EXPORT)
#define SECUREC_API __declspec(dllexport)
#elif defined(SECUREC_DLL_IMPORT)
#define SECUREC_API __declspec(dllimport)
#else
#if defined(_MSC_VER)
#define SECUREC_API
#else
#define SECUREC_API extern
#endif
#endif
#endif

#ifdef __cplusplus
extern "C" {
#endif
SECUREC_API const char *GetHwSecureCVersion(unsigned short *verNumber);

#if SECUREC_ENABLE_MEMSET
    SECUREC_API errno_t memset_s(void *dest, size_t destMax, int c, size_t count);
#endif



#if SECUREC_ENABLE_MEMMOVE
    SECUREC_API errno_t memmove_s(void *dest, size_t destMax, const void *src, size_t count);
#endif

#if SECUREC_ENABLE_MEMCPY
    SECUREC_API errno_t memcpy_s(void *dest, size_t destMax, const void *src, size_t count);
#endif

#if SECUREC_ENABLE_STRCPY
    SECUREC_API errno_t strcpy_s(char *strDest, size_t destMax, const char *strSrc);
#endif

#if SECUREC_ENABLE_STRNCPY
    SECUREC_API errno_t strncpy_s(char *strDest, size_t destMax, const char *strSrc, size_t count);
#endif

#if SECUREC_ENABLE_STRCAT
    SECUREC_API errno_t strcat_s(char *strDest, size_t destMax, const char *strSrc);
#endif

#if SECUREC_ENABLE_STRNCAT
    SECUREC_API errno_t strncat_s(char *strDest, size_t destMax, const char *strSrc, size_t count);
#endif

#if SECUREC_ENABLE_VSPRINTF
    SECUREC_API int vsprintf_s(char *strDest, size_t destMax, const char *format,
                               va_list argList) SECUREC_ATTRIBUTE(3, 0);
#endif

#if SECUREC_ENABLE_SPRINTF
    SECUREC_API int sprintf_s(char *strDest, size_t destMax, const char *format, ...) SECUREC_ATTRIBUTE(3, 4);
#endif

#if SECUREC_ENABLE_VSNPRINTF
    SECUREC_API int vsnprintf_s(char *strDest, size_t destMax, size_t count, const char *format,
                                va_list argList) SECUREC_ATTRIBUTE(4, 0);
#endif

#if SECUREC_ENABLE_SNPRINTF
    SECUREC_API int snprintf_s(char *strDest, size_t destMax, size_t count, const char *format,
                               ...) SECUREC_ATTRIBUTE(4, 5);
#endif

#if SECUREC_ENABLE_SCANF
    SECUREC_API int scanf_s(const char *format, ...);
#endif

#if SECUREC_ENABLE_VSCANF
    SECUREC_API int vscanf_s(const char *format, va_list argList);
#endif

#if SECUREC_ENABLE_SSCANF
    SECUREC_API int sscanf_s(const char *buffer, const char *format, ...);
#endif

#if SECUREC_ENABLE_VSSCANF
    SECUREC_API int vsscanf_s(const char *buffer, const char *format, va_list argList);
#endif

#if SECUREC_ENABLE_FSCANF
    SECUREC_API int fscanf_s(FILE *stream, const char *format, ...);
#endif

#if SECUREC_ENABLE_VFSCANF
    SECUREC_API int vfscanf_s(FILE *stream, const char *format, va_list argList);
#endif



#if SECUREC_WITH_PERFORMANCE_ADDONS

    extern errno_t memset_sOptAsm(void *dest, size_t destMax, int c, size_t count);
    extern errno_t memset_sOptTc(void *dest, size_t destMax, int c, size_t count);
    extern errno_t memcpy_sOptAsm(void *dest, size_t destMax, const void *src, size_t count);
    extern errno_t memcpy_sOptTc(void *dest, size_t destMax, const void *src, size_t count);


#define strcpy_sp(dest, destMax, src)  ((__builtin_constant_p((destMax)) && \
    __builtin_constant_p((src))) ?  \
    SECUREC_STRCPY_SM((dest), (destMax), (src)) : \
    strcpy_s((dest), (destMax), (src)))


#define strncpy_sp(dest, destMax, src, count)  ((__builtin_constant_p((count)) && \
    __builtin_constant_p((destMax)) && \
    __builtin_constant_p((src))) ?  \
    SECUREC_STRNCPY_SM((dest), (destMax), (src), (count)) : \
    strncpy_s((dest), (destMax), (src), (count)))


#define strcat_sp(dest, destMax, src) ((__builtin_constant_p((destMax)) && \
    __builtin_constant_p((src))) ?  \
    SECUREC_STRCAT_SM((dest), (destMax), (src)) : \
    strcat_s((dest), (destMax), (src)))


#define strncat_sp(dest, destMax, src, count) ((__builtin_constant_p((count)) &&  \
    __builtin_constant_p((destMax)) && \
    __builtin_constant_p((src))) ?  \
    SECUREC_STRNCAT_SM((dest), (destMax), (src), (count)) : \
    strncat_s((dest), (destMax), (src), (count)))


#define memcpy_sp(dest, destMax, src, count)  (__builtin_constant_p((count)) ? \
    (SECUREC_MEMCPY_SM((dest), (destMax), (src), (count))) : \
    (__builtin_constant_p((destMax)) ? \
    (((size_t)(destMax) > 0 && \
    (((unsigned long long)(destMax) & (unsigned long long)(-2)) < SECUREC_MEM_MAX_LEN)) ? \
    memcpy_sOptTc((dest), (destMax), (src), (count)) : ERANGE) : \
    memcpy_sOptAsm((dest), (destMax), (src), (count))))


#define memset_sp(dest, destMax, c, count)  (__builtin_constant_p((count)) ? \
    (SECUREC_MEMSET_SM((dest), (destMax), (c), (count))) : \
    (__builtin_constant_p((destMax)) ? \
    (((((unsigned long long)(destMax) & (unsigned long long)(-2)) < SECUREC_MEM_MAX_LEN)) ? \
    memset_sOptTc((dest), (destMax), (c), (count)) : ERANGE) : \
    memset_sOptAsm((dest), (destMax), (c), (count))))
#else
#define strcpy_sp   strcpy_s
#define strncpy_sp  strncpy_s
#define strcat_sp   strcat_s
#define strncat_sp  strncat_s
#define memcpy_sp   memcpy_s
#define memset_sp   memset_s
#endif

#ifdef __cplusplus
}
#endif



#ifndef MARPAESLIF_JSON_H
#define MARPAESLIF_JSON_H

#include <stdlib.h>
#include <stddef.h> /* For size_t */
#include <genericLogger.h>
#include <marpaESLIF_JSON/export.h>

typedef struct marpaESLIF_JSONOption {
  genericLogger_t *genericLoggerp;      /* Logger. Default: NULL */
  short            unlimited_commasb;   /* Unlimited number of commas. Default: false */
  short            trailing_separatorb; /* Trailing separator. Default: false */
  short            perl_commentb;       /* Perl style comments. Default: false */
  short            cplusplus_commentb;  /* C++ style comments. Default: false */
  short            infb;                /* Support of [+-]infinity or [+-]inf, case insensitive. Default: false */
  short            nanb;                /* Support of [+-]nan, case insensitive. Default: false */
  short            cntrlb;              /* Support of Unicode's control characters (range [\x00-\x1F]). Default: false */
  short            disallow_dupkeysb;   /* Dot not allow duplicate key in an object. Default: false */
} marpaESLIF_JSONOption_t;

typedef struct marpaESLIF_JSON marpaESLIF_JSON_t; /* Opaque context */

#ifdef __cplusplus
extern "C" {
#endif
  marpaESLIF_JSON_EXPORT marpaESLIF_JSON_t *marpaESLIF_JSON_newp(marpaESLIF_JSONOption_t *marpaESLIF_JSONOptionp);
  marpaESLIF_JSON_EXPORT marpaESLIF_JSON_t *marpaESLIF_JSON_new_globalp(marpaESLIF_JSONOption_t *marpaESLIF_JSONOptionp);
  marpaESLIF_JSON_EXPORT void               marpaESLIF_JSON_freev(marpaESLIF_JSON_t *marpaESLIF_JSONp);
  marpaESLIF_JSON_EXPORT void               marpaESLIF_JSON_free_globalv(marpaESLIF_JSON_t *marpaESLIF_JSONp);
#ifdef __cplusplus
}
#endif

#endif /* MARPAESLIF_JSON_H */

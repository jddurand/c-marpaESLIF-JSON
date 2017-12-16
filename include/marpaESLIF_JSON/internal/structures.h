#ifndef MARPAESLIF_JSON_INTERNAL_STRUCTURES_H
#define MARPAESLIF_JSON_INTERNAL_STRUCTURES_H

#include <marpaESLIF.h>

static marpaESLIF_JSONOption_t marpaESLIF_JSONOption_default = {
  NULL, /* genericLoggerp */
  0,    /* unlimited_commasb */
  0,    /* trailing_separatorb */
  0,    /* perl_commentb */
  0,    /* cplusplus_commentb */
  0,    /* infb */
  0,    /* nanb */
  0,    /* cntrlb */
  0     /* disallow_dupkeysb */
};

struct marpaESLIF_JSON {
  marpaESLIF_JSONOption_t  marpaESLIF_JSONOption;
  marpaESLIF_t            *marpaESLIFp;
  marpaESLIFGrammar_t     *marpaESLIFGrammarp;
  short                    globalb;
};

#endif /* MARPAESLIF_JSON_INTERNAL_STRUCTURES_H */

#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <genericLogger.h>
#include "marpaESLIF_JSON.h"
#include "marpaESLIF_JSON/internal/config.h"
#include "marpaESLIF_JSON/internal/structures.h"
#include "marpaESLIF_JSON/internal/logging.h"

static inline marpaESLIF_JSON_t *_marpaESLIF_JSON_newp(marpaESLIF_JSONOption_t *marpaESLIF_JSONOptionp, short globalb);
static inline void               _marpaESLIF_JSON_freev(marpaESLIF_JSON_t *marpaESLIF_JSONp, short globalb);

/*****************************************************************************/
/* marpaESLIF_JSON_newp                                                     */
/*****************************************************************************/
marpaESLIF_JSON_t *marpaESLIF_JSON_newp(marpaESLIF_JSONOption_t *marpaESLIF_JSONOptionp)
{
  return _marpaESLIF_JSON_newp(marpaESLIF_JSONOptionp, 0 /* globalb */);
}

/*****************************************************************************/
/* marpaESLIF_JSON_new_globalp                                               */
/*****************************************************************************/
marpaESLIF_JSON_t *marpaESLIF_JSON_new_globalp(marpaESLIF_JSONOption_t *marpaESLIF_JSONOptionp)
{
  return _marpaESLIF_JSON_newp(marpaESLIF_JSONOptionp, 1 /* globalb */);
}

/*****************************************************************************/
/* _marpaESLIF_JSON_newp                                                     */
/*****************************************************************************/
static inline marpaESLIF_JSON_t *_marpaESLIF_JSON_newp(marpaESLIF_JSONOption_t *marpaESLIF_JSONOptionp, short globalb)
{
  marpaESLIF_JSON_t *marpaESLIF_JSONp;

  if (marpaESLIF_JSONOptionp == NULL) {
    marpaESLIF_JSONOptionp = &marpaESLIF_JSONOption_default;
  }

  marpaESLIF_JSONp = (marpaESLIF_JSON_t *) malloc(sizeof(marpaESLIF_JSON_t));
  if (marpaESLIF_JSONp == NULL) {
    if (marpaESLIF_JSONOptionp->genericLoggerp != NULL) {
      GENERICLOGGER_ERRORF(marpaESLIF_JSONOptionp->genericLoggerp, "malloc failure, %s", strerror(errno));
    }
    return NULL;
  }

  marpaESLIF_JSONp->marpaESLIF_JSONOption = *marpaESLIF_JSONOptionp;
  marpaESLIF_JSONp->marpaESLIFp           = NULL;
  marpaESLIF_JSONp->marpaESLIFGrammarp    = NULL;
  marpaESLIF_JSONp->globalb               = globalb;

  return marpaESLIF_JSONp;
}

/*****************************************************************************/
/* marpaESLIF_JSON_freev                                                     */
/*****************************************************************************/
void marpaESLIF_JSON_freev(marpaESLIF_JSON_t *marpaESLIF_JSONp) {
  _marpaESLIF_JSON_freev(marpaESLIF_JSONp, 0 /* globalb */);
}

/*****************************************************************************/
/* marpaESLIF_JSON_free_globalv                                               */
/*****************************************************************************/
void marpaESLIF_JSON_free_globalv(marpaESLIF_JSON_t *marpaESLIF_JSONp) {
  _marpaESLIF_JSON_freev(marpaESLIF_JSONp, 1 /* globalb */);
}

/*****************************************************************************/
/* _marpaESLIF_JSON_freev                                                     */
/*****************************************************************************/
static inline void _marpaESLIF_JSON_freev(marpaESLIF_JSON_t *marpaESLIF_JSONp, short globalb)
{
  if (marpaESLIF_JSONp != NULL) {
    if ((marpaESLIF_JSONp->globalb && globalb) || ((! marpaESLIF_JSONp->globalb) && (! globalb))) {
      marpaESLIFGrammar_freev(marpaESLIF_JSONp->marpaESLIFGrammarp);
      marpaESLIF_freev(marpaESLIF_JSONp->marpaESLIFp);
      free(marpaESLIF_JSONp);
    }
  }
}

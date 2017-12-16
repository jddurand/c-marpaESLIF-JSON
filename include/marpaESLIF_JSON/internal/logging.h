#ifndef MARPAESLIF_JSON_INTERNAL_LOGGING_H
#define MARPAESLIF_JSON_INTERNAL_LOGGING_H
#include <stdio.h>

#define MARPAESLIF_JSON_LOC_FMT "[v%s/%s at %s:%04d]"
#define MARPAESLIF_JSON_LOC_VAR MARPAESLIF_JSON_VERSION, funcs, FILENAMES, __LINE__

#define MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, rest) do {                \
    genericLogger_t *_genericLoggerp = ((marpaESLIF_JSONp) != NULL) ? (marpaESLIF_JSONp)->marpaESLIF_JSONOption.genericLoggerp : NULL; \
    if (_genericLoggerp != NULL) {					\
      rest;								\
    }									\
  } while (0)

#ifndef MARPAESLIF_JSON_NTRACE
#define MARPAESLIF_JSON_TRACEF(marpaESLIF_JSONp, funcs, fmts, ...) MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_TRACEF(_genericLoggerp, "[%s at %s:%04d] " fmts, funcs, FILENAMES, __LINE__, __VA_ARGS__))
#define MARPAESLIF_JSON_TRACE(marpaESLIF_JSONp, funcs, msgs)       MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_TRACEF(_genericLoggerp, "[%s at %s:%04d] %s", funcs, FILENAMES, __LINE__, msgs))
#else
#define MARPAESLIF_JSON_TRACEF(marpaESLIF_JSONp, funcs, fmts, ...)
#define MARPAESLIF_JSON_TRACE(marpaESLIF_JSONp, funcs, msgs)
#endif

#define MARPAESLIF_JSON_DEBUGF(marpaESLIF_JSONp, fmts, ...)     MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_DEBUGF    ((_genericLoggerp), (fmts), __VA_ARGS__))
#define MARPAESLIF_JSON_DEBUG(marpaESLIF_JSONp, ...)            MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_DEBUG     ((_genericLoggerp),         __VA_ARGS__))
#define MARPAESLIF_JSON_INFOF(marpaESLIF_JSONp, fmts, ...)      MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_INFOF     ((_genericLoggerp), (fmts), __VA_ARGS__))
#define MARPAESLIF_JSON_INFO(marpaESLIF_JSONp, ...)             MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_INFO      ((_genericLoggerp),         __VA_ARGS__))
#define MARPAESLIF_JSON_NOTICEF(marpaESLIF_JSONp, fmts, ...)    MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_NOTICEF   ((_genericLoggerp), (fmts), __VA_ARGS__))
#define MARPAESLIF_JSON_NOTICE(marpaESLIF_JSONp, ...)           MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_NOTICE    ((_genericLoggerp),         __VA_ARGS__))
#define MARPAESLIF_JSON_WARNF(marpaESLIF_JSONp, fmts, ...)      MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_WARNF     ((_genericLoggerp), (fmts), __VA_ARGS__))
#define MARPAESLIF_JSON_WARN(marpaESLIF_JSONp, ...)             MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_WARN      ((_genericLoggerp),         __VA_ARGS__))
#define MARPAESLIF_JSON_ERRORF(marpaESLIF_JSONp, fmts, ...)     MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_ERRORF    ((_genericLoggerp), (fmts), __VA_ARGS__))
#define MARPAESLIF_JSON_ERROR(marpaESLIF_JSONp, ...)            MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_ERROR     ((_genericLoggerp),         __VA_ARGS__))
#define MARPAESLIF_JSON_CRITICALF(marpaESLIF_JSONp, fmts, ...)  MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_CRITICALF ((_genericLoggerp), (fmts), __VA_ARGS__))
#define MARPAESLIF_JSON_CRITICAL(marpaESLIF_JSONp, ...)         MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_CRITICAL  ((_genericLoggerp),         __VA_ARGS__))
#define MARPAESLIF_JSON_ALERTF(marpaESLIF_JSONp, fmts, ...)     MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_ALERTF    ((_genericLoggerp), (fmts), __VA_ARGS__))
#define MARPAESLIF_JSON_ALERT(marpaESLIF_JSONp, ...)            MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_ALERT     ((_genericLoggerp),         __VA_ARGS__))
#define MARPAESLIF_JSON_EMERGENCYF(marpaESLIF_JSONp, fmts, ...) MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_EMERGENCYF((_genericLoggerp), (fmts), __VA_ARGS__))
#define MARPAESLIF_JSON_EMERGENCY(marpaESLIF_JSONp, ...)        MARPAESLIF_JSON2LOG(marpaESLIF_JSONp, GENERICLOGGER_EMERGENCY ((_genericLoggerp),         __VA_ARGS__))

#endif /* MARPAESLIF_JSON_INTERNAL_LOGGING_H */

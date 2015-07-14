
#pragma once

#include <stdlib.h>
#include <assert.h>

#define __alloc_func(f,...)			({ void *rc = f(__VA_ARGS__); assert (rc != NULL); rc; })
#define	xmalloc(s)							__alloc_func(malloc,s)
#define	xcalloc(n,s)						__alloc_func(calloc,n,s)
#define	xrealloc(n,s)						__alloc_func(realloc,n,s)
#define xfree(b)								({ free(b); })


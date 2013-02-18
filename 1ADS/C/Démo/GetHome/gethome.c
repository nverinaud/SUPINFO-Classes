
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *gethome(void)
{
#if defined(_WIN32)
	return strcat(getenv("HOMEDRIVE"), getenv("HOMEPATH"));
#else
	return getenv("HOME");
#endif
}
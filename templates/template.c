#include <stdio.h>

int main(int argc, char **argv)
{
	if (argc > 1) {
		for (int i = 1; i < argc; ++i) {
			fprintf(stdout, "argv[%i]: %s\n", i, argv[i]);
		}
	}
	fprintf(stdout, "Hello World!\n");
	return 0;
}

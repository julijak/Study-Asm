#include <iostream>

void main()
{
	float a = 10000000;
	float y = 0;
	__asm {
		finit
			fldpi
			fmul a
			frndint
			fdiv a
			fstp y
	}

	printf("%.7f", y);
	getchar();
}
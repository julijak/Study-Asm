/*
Вывести число пи с точностью до 5 знака
*/
#include <iostream>

void main()
{
	float a = 100000;
	float y = 0;
	__asm {
		finit
			fldpi
			fmul a
			frndint
			fdiv a
			fstp y
	}

	printf("%.5f", y);
	getchar();
}
/**
Вычислить значение выражение y=(x-z)*(2x-z)
*/
#include <stdio.h>

int main() {
	float x = 4;
	float z = 5;
	float y = 0;
	float t = 2;
	_asm {
		finit
		fld x
		fsub z
		fld x
		fmul t
		fsub z
		fmul st(1), st
		fxch st(1)
		fst  y
	}
	printf("%f", y);
	getchar();
	return 0;
}
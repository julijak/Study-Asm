/**
Вычислить y=135x+(cx-2042b)/a^2
*/
#include <stdio.h>

int main() {
	float x = 2;
	float a = 5;
	float b = 2;
	float c = 3;
	float y = 0;
	float const1 = 135;
	float const2 = 2042;
	__asm {
		finit
			fld x
			fmul c
			fld b
			fmul const2
			fsub st(1),st
			fxch st(1)
			fld a
			fmul a
			fdiv st(1),st
			fxch st(1)
			fld x
			fmul const1
			fadd st,st(1)
			fst y
	}
	printf("%f", y);
	getchar();
	return 0;
}
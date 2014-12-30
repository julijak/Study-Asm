/**
Вычислить y=(x*e^x)/4
*/
#include <stdio.h>

int main() {
	float x = 2;
	float y = 0;
	float f = 4;
	__asm {
		finit
		fld x
		fldl2e
		fmulp st(1), st
		fld     st
		frndint
		fsub    st(1), st
		fxch    st(1)
		f2xm1
		fld1
		faddp   st(1), st
		fscale
		fstp    st(1)
		fmul x
		fdiv f
		fstp y		
	}
	printf("%f", y);
	getchar();
	return 0;
}
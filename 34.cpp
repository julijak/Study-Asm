/**
Вычислить гипотенузу по 2 катетам
*/
#include <stdio.h>

int main() {
	float kat1 = 3;
	float kat2 = 4;
	float result = 0;
	_asm {
		finit
		fld kat1
		fmul st,st
		fld kat2
		fmul st,st
		fadd
		fsqrt
		fst result
	}
	printf("%f", result);
	getchar();
	return 0;
}
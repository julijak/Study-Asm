/**
Вычислить тангенс
*/
#include <stdio.h>

int main() {
	float a = 0.7;
	float result = 0;
	__asm {
		finit
		fld a
		fptan
		fxch st(1)
		fstp result
	}
	printf("%f", result);
	getchar();
	return 0;
}
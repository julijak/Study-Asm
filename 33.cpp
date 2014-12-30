/**
Вычислить длину окружности
*/
#include <stdio.h>

int main() {
	float r = 1;
	float result = 0;
	float two = 2;
	_asm { 
		finit
		fldpi
		fld r
		fmul
		fld two
		fmul
		fst result		
	}
	printf("%f", result);
	getchar();
	return 0;
}
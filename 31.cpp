/**
Вычислить косинус
*/
#include <stdio.h>

int main() {
	float a = 1.56;
	float result = 0;
	__asm {
		finit
		fld a
		fcos
		fst result
	}
	printf("%f", result);
	getchar();
	return 0;
}
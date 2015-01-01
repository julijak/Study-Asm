#include <iostream>
void main()
{
	float temp = 0;
	int max = 0;
	std::cin >> max;
	for (float i = 2; i < max; i++) {
		for (float j = 2; j < i; j++)
		{
			_asm {
				finit
					fld i
					fdiv j
					fst temp
					frndint
					fsub temp
					fcom 
					fst temp
			}
			if (temp == 0){
				break;
			}
		}
		if (temp != 0){
			std::cout << i << " prostoe.\n";
		}
	}

	system("pause");
}
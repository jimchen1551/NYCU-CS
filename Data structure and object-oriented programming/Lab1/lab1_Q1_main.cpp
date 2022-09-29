#include <iostream>
#include "lab1_Q1.h"

using namespace std;

int main()
{
	int n;
	cin >> n;

	while (n--)
	{
		char command;
		cin >> command;
		QUADRATIC q1, q2;
		switch (command) 
		{
			case '+':	
				cin >> q1.a >> q1.b >> q1.c >> q2.a >> q2.b >> q2.c;	
				q1.add(q2);
				break;
			case 'p':	
				cin >> q1.a >> q1.b >> q1.c;
				q1.print();	
				break;
			case 'd':	
				cin >> q1.a >> q1.b >> q1.c;
				q1.discriminant();
				break;
			default:
				cout << "wrong input!";
				break;
		}
	}
	system("pause");
}
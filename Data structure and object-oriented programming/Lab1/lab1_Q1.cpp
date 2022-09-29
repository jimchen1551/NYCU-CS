#include "lab1_Q1.h"
#include <iostream>
#include <string>
#include <cmath>

using namespace std;

void QUADRATIC::print()
{
	cout << a << "x^2+" << b << "x+" << c << endl;
	return;
}

void QUADRATIC::add(QUADRATIC q)
{
	std::cout << a+q.a << "x^2+" << b+q.b << "x+" << c+q.c << std::endl;
	return;
}

void QUADRATIC::discriminant()
{
	double d = (b*b)-(4*a*c);
	if (d==0)
		std::cout << "There is a double root: " << -0.5*b/a << std::endl;
	else if (d>0)
		std::cout << "There are two roots: " << -0.5*(b-sqrt(d))/a << ", " << -0.5*(b+sqrt(d))/a << std::endl;
	else
		std::cout << "There are two complex roots: " << -0.5*b/a << "+" << 0.5*sqrt(-d)/a << "i, " << -0.5*b/a << "-" << 0.5*sqrt(-d)/a << "i" << std::endl;
	return;
}
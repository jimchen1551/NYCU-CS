#ifndef QUADRATIC_H_INCLUDED
#define QUADRATIC_H_INCLUDED
#include <cmath>
#include <iostream>

class QUADRATIC
{
	public:
		QUADRATIC() : a(0), b(0), c(0) {}
		QUADRATIC(int a, int b, int c) : a(a), b(b), c(c) {}

		int a;
		int b;
		int c;

		void print()
		{
			std::cout.setf(std::ios::showpos);
			std::cout << a << "x^2" << b << "x" << c << std::endl;
			std::cout.unsetf(std::ios::showpos);
			return;
		}
		void add(QUADRATIC q)
		{
			std::cout.setf(std::ios::showpos);
			std::cout << a+q.a << "x^2" << +(b+q.b) << "x" << +(c+q.c) << std::endl;
			std::cout.unsetf(std::ios::showpos);
			return;
		}
		void discriminant()
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
};

#endif // QUADRATIC_H_INCLUDED
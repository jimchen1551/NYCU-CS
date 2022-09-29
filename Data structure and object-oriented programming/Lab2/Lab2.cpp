#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
using namespace std;

class PrimeFactorization {
private:
	int num1, num2;
	vector<int> num1_factor, num2_factor;
	
public:
	PrimeFactorization() {
		//TO_DO: initial constructor
	}
	PrimeFactorization(int _a, int _b) {//TO_DO: _a means the first integer and _b means the second integer
		num1 = _a;
		num2 = _b;
	}
	void Get_Prime_Factorization() {//TO_DO: Prime factorization num1 and num2, push result to the num1_factor and num2_factor.
		int sqrt1 = (int)sqrt(num1), sqrt2 = (int)sqrt(num2);
		while (num1%2==0)
		{
			num1_factor.push_back(2);
			num1 /= 2;
		}
		for (int i=3; i<=sqrt1; i+=2)
		{
			while(num1%i==0)
			{
				num1_factor.push_back(i);
				num1 /= i;
			}
		}
		if (num1!=1)
			num1_factor.push_back(num1);
		while (num2%2==0)
		{
			num2_factor.push_back(2);
			num2 /= 2;
		}
		for (int i=3; i<=sqrt1; i+=2)
		{
			while(num2%i==0)
			{
				num2_factor.push_back(i);
				num2 /= i;
			}
		}
		if (num2!=1)
			num2_factor.push_back(num2);
	}

	void Print_Prime_Factorization() {//TO_DO: Print num1_factor and num2_factor.
		cout << "num1_Prime_factor: \"";
		for (int i = 0; i < num1_factor.size(); i++)
			cout << num1_factor[i] << " ";
		cout << "\"" << endl;
		cout << "num2_Prime_factor: \"";
		for (int i = 0; i < num2_factor.size(); i++)
			cout << num2_factor[i] << " ";
		cout << "\"" << endl;
	}

	void Print_GCD() {//TO_DO: Use num1_factor and num2_factor to find GCD and print the result.
		long gcd = 1;
		int i = 0, j = 0;
		while(i<num1_factor.size() && j<num2_factor.size())
		{
			if (num1_factor[i]==num2_factor[j])
			{
				gcd *= num1_factor[i];
				i++;
				j++;
			}
			else if (num1_factor[i]<num2_factor[j])
				i++;
			else
				j++;
		}
		cout << "GCD: " << gcd << endl;
	}

};

int main() {
	int n;
	cin >> n;

	for (int i = 0; i < n; i++) {
		int a, b;
		cin >> a >> b;

		cout << "num1 = " << a << endl;
		cout << "num2 = " << b << endl;

		PrimeFactorization PF(a, b);

		PF.Get_Prime_Factorization();
		PF.Print_Prime_Factorization();
		PF.Print_GCD();

		cout << endl;

	}

	system("PAUSE");
	return 0;
}

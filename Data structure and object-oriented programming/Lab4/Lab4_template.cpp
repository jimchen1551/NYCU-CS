#include <iostream>
#include <vector>
#include <fstream>

using namespace std;

class matrix
{
public:
	vector<vector<int> > M;
	
	
	matrix(vector<int> values)//TO_DO: Initialize a matrix of size 3 * 3
	{
		vector<int> v;
		for (int i = 0; i < 3; i++)
			M.push_back(v);
		for (int i = 0; i < 9; i++)
		{
			M[i/3].push_back(values[i]);
		}
	}
	
	matrix(vector<vector<int> >& m)
	{
		M = m;
	}
	
	matrix multiply(matrix multiplicand)
	{
		vector<int> results;
		for (int i = 0; i < 3; i++)
			for (int j = 0; j < 3; j++)
				results.push_back(M[i][0]*multiplicand.M[0][j] + M[i][1]*multiplicand.M[1][j] + M[i][2]*multiplicand.M[2][j]);
		return matrix(results);
	}
	
	matrix adjoint()
	{
		vector<int> results;
		results.push_back(M[1][1]*M[2][2]-M[1][2]*M[2][1]);
		results.push_back(M[0][2]*M[2][1]-M[0][1]*M[2][2]);
		results.push_back(M[0][1]*M[1][2]-M[0][2]*M[1][1]);

		results.push_back(M[1][2]*M[2][0]-M[1][0]*M[2][2]);
		results.push_back(M[0][0]*M[2][2]-M[0][2]*M[2][0]);
		results.push_back(M[0][2]*M[1][0]-M[0][0]*M[1][2]);

		results.push_back(M[1][0]*M[2][1]-M[1][1]*M[2][0]);
		results.push_back(M[0][1]*M[2][0]-M[0][0]*M[2][1]);
		results.push_back(M[0][0]*M[1][1]-M[0][1]*M[1][0]);
		return matrix(results);
	}
	
	int determinant()
	{
		matrix m = multiply(adjoint());
		return m.M[0][0];
	}
};

int main() 
{
	fstream fin;
	
	fin.open("Lab4_testcase.txt", ios::in);
	if (!fin) {
		cout << "File is not opened" << endl;
		exit(0);
		system("pause");
	}
	
	int n;
	int value;
	fin >> n;
	vector<int> values;
	for(int i=0; i<n; i++) {// TO_DO: read the input and call the functions you've implemented to generate the output
		for (int j=0; j<9; j++)
		{
			fin >> value;
			values.push_back(value);
		}
		matrix m(values);
		values.clear();
		cout << "The determinant of matrix M is: " << m.determinant() << endl;
	}

	system("read");
	return 0;
}

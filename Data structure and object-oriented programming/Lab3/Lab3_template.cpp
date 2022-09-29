#include <iostream>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>
#define MAX 16
using namespace std;

class Roll_Call_System {

private:
	vector<string> studentNames;
	vector<string> pickedStudentNames;
	int seed;
	int a;
	int c;
	int m;
	int picked_student_num;

public:
	int num;
	char name[MAX];
	char filename[MAX];
	vector<int> alphabets;
	fstream fin;

	void OpenFile() {//TODO: open the file
		cout << "Filename: ";
		cin >> filename;
		fin.open(filename);
		return;
	}

	void AddNames() {//TODO : add name to studentName vector
		fin >> num;
		while (num--)
		{
			fin >> name;
			studentNames.push_back(name);
		}
		return;
	}

	int GenerateRandomNumber(int seed, int a, int c, int m) {//TODO: implement linear random number generator
		return (seed*a+c)%m;
	}

	void PickNames() {//TODO: randomly pick name form studentName vector and add them to pickedStudentName vector
		fin >> seed >> a >> c >> m >> picked_student_num;
		while(picked_student_num--)
		{
			seed = GenerateRandomNumber(seed, a, c, m);
			pickedStudentNames.push_back(studentNames[seed]);
		}
		return;
	}

	void PrintPickedStudentNames() {//TODO: print all picked name form studentName vector
		cout << "Picked Name: " << endl;
		for (int i = 0; i < pickedStudentNames.size(); i++)
			cout << pickedStudentNames[i] << endl;
		return;
	}

	void CaculateAlphabets() {//TODO: calculate how many diffetent alphabets are used and print it
		for (int i = 0; i < pickedStudentNames.size(); i++)
		{
			for (int j = 0; j < pickedStudentNames[i].length(); j++)
			{
				bool d = true;
				int number = (int)pickedStudentNames[i][j];
				for (int k = 0; k < alphabets.size(); k++)
					if (number==alphabets[k]||number==alphabets[k]+32)
						d = false;
				if (d)
					alphabets.push_back((number<90)?number:number-32);
			}
		}
		cout << "Total alphabets: " << alphabets.size() << "\n" << endl;
		pickedStudentNames.clear();
		alphabets.clear();
		return;
	}

};

int main() {
	
	Roll_Call_System rcs;
	rcs.OpenFile();
	rcs.AddNames();

	int times;
	rcs.fin >> times;
	while (times--) {
		rcs.PickNames();
		rcs.PrintPickedStudentNames();
		rcs.CaculateAlphabets();
	}
	
	system("READ");
	return 0;

}
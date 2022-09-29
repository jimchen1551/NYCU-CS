#include "Student.h"
#include "BigLeaf.h"
#include "Traffic.h"
#include "TaiwanNumber1.h"
#include "PorkBall.h"
#include <iostream>
#include <string>
using namespace std;

int main() {
	Student* bigleaf = new BigLeaf("Steve", 60, 50, 0.6);
	bigleaf->printAllInfo();
	bigleaf->ShowSchool();
	cout << endl;

	Student* traffic = new Traffic("Legolas", 99, 20, 0.9);
	traffic->printAllInfo();
	traffic->ShowSchool();
	cout << endl;

	PorkBall* porkball = new PorkBall("bb", 15.5);
	cout << "Check whether the student can ride this porkball." << endl;
	porkball->canRide(bigleaf);
	porkball->canRide(traffic);
	cout << endl;


	Student* taiwan1 = new TaiwanNumber1("Lisa", 80, 30, 0.8);
	taiwan1->printAllInfo();
	taiwan1->ShowSchool();
	cout << endl;
	
	
	porkball->canRide(taiwan1);
	cout << endl;




	system("PAUSE");
	return 0;
}
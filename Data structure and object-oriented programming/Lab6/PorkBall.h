#pragma once
#ifndef PORKBALL_H
#include<iostream>
#include <string>
using namespace std;

class PorkBall {
public:
	PorkBall(string name, float speed): name(name), speed(speed){}

	bool canRide(Student* student) {
		if (isTraffic(student)) 
		{
			cout << student->GetId() << " can ride porkball " << name << ", the speed is " << speed << endl; 
			return true;
		}
		else {return false;}
	}

private:
	string name;
	float speed;
	bool isTraffic(Student* student) {
		Traffic* traffic = dynamic_cast<Traffic*>(student);
		if (traffic) {return (traffic);}
		else 
		{
			cout << "error bad_cast" << endl; 
			return (traffic);
		}
	}
};
#endif

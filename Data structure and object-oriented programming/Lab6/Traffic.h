#ifndef TRAFFIC_H
#include<iostream>
using namespace std;
class Traffic: public Student
{
    public:
        Traffic(string _id, int _score, int _money, float _background): Student(_id, _score, _money, _background){}
        void ShowSchool(void) {cout << "Student " << GetId() << "'s school is Traffic. " << endl;}
};
#endif
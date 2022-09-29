#ifndef TAIWANNUMBER1_H
#include<iostream>
using namespace std;
class TaiwanNumber1: public Student
{
    public:
        TaiwanNumber1(string _id, int _score, int _money, float _background): Student(_id, _score, _money, _background){}
        void ShowSchool(void) {cout << "Student " << GetId() << "'s school is TaiwanNumber1. " << endl;}
};
#endif
#ifndef BIGLEAF_H
#include<iostream>
using namespace std;
class BigLeaf: public Student
{
    public:
        BigLeaf(string _id, int _score, int _money, float _background): Student(_id, _score, _money, _background){}
        void ShowSchool(void) {cout << "Student " << GetId() << "'s school is BigLeaf. " << endl;}
};
#endif
#ifndef STUDENT_H
#include<iostream>
using namespace std;
class Student
{
    private: 
        string id;
        int score;
        int money;
        float background;
    public: 
        Student(string _id, int _score, int _money, float _background): id(_id), score(_score), money(_money), background(_background){}
        void printAllInfo(void)
        {
            cout << "ID: " << id << endl;
            cout << "Score: " << score << endl;
            cout << "Money: " << money << endl;
            cout << "Background: " << background << endl;
            return;
        }
        virtual void ShowSchool(void){}
        string GetId() const { return id; }
};
#endif
#include<iostream>
#include<fstream>
#include"Heap.h"
using namespace std;
int main(void)
{
    ifstream file;
    string filename("input.txt");
    file.open(filename);
    
    int num;
    int value;
    Heap max;
    file >> num;
    while (num--)
    {
        file >> value;
        max.insert(value);
    }
    max.print();
    file.close();
    return 0;
}
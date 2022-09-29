#include <iostream>
#include <algorithm>
#include <string>
#include <vector>
#include <fstream>

using namespace std;

struct info {
	int height;
	int weight;

	// don't change this
	bool operator<(const info& other) const {
		return height < other.height;
	}
};

//TODO: implement three comparsion function 
//example: 
//bool functionName(const dataType& p1, const dataType& p2) {
//	return p1 > p2;
//}

//1.implement compare by height here
bool compareHeight(const pair<string, info> &p1, const pair<string, info> &p2)
{
	return (p1.second.height < p2.second.height);
}
//2.implement compare by weight here
bool compareWeight(const pair<string, info> &p1, const pair<string, info> &p2)
{
	return (p1.second.weight < p2.second.weight);
}
//3.implement compare by height and weight here
bool compareBoth(const pair<string, info> &p1, const pair<string, info> &p2)
{
	if (p1.second.height != p2.second.height) {return (p1.second.height < p2.second.height);}
	else {return (p1.second.weight < p2.second.weight);}
}

class Map
{
public:
	Map()
	{
		people.clear();
	}

	void readFile(){
		fstream file;
		file.open("lab7_input.txt", ios::in);
		int cmdNum;
		file >> cmdNum;
		while (cmdNum--) {
			char cmd;
			file >> cmd;
			switch (cmd) {
				case 'a':
				{
					string name;
					file >> name;
					info ii;
					file >> ii.height >> ii.weight;
					add(name, ii);
					break;
				}
				case 'f':
				{
					string name;
					file >> name;
					find(name);
					break;
				}
				case 'e':
				{
					string name;
					file >> name;
					erase(name);
					break;
				}
			}
		}

		file.close();
	}

	void add(string name, info& _info) {
		//TODO: implement add function add new data into the map(vector<pair<...>>)
		//If the name is already in the map, override his/her data
		bool d = false;
		for (int i = 0; i < people.size(); i++)
		{
			if (people[i].first==name)
			{
				cout << name << "'s h: " << people[i].second.height << " and w: " << people[i].second.weight << " is changed to h: " << _info.height << " and w: " << _info.weight << endl;
				people[i].second.height = _info.height;
				people[i].second.weight = _info.weight;
				d = true;
			}
		}
		if (d==false) {people.push_back(make_pair(name, _info)); }
	}

	void find(string name) {
		//TODO: implement find function to get the information of the given name if the name exist
		//otherwise, print "name is not found"
		//you must use iterator to implement
		bool d = false;
		for (int i = 0; i < people.size(); i++)
		{
			if (people[i].first==name)
			{
				cout << name << " is found! h: " << people[i].second.height << " and w: " << people[i].second.weight << endl;
				d = true;
			}
		}
		if (d==false) {cout << name << " is not found! " << endl; }
	}

	void erase(string name) {
		//TODO: implement erase function to delete the element of the given name if the name exist
		//otherwise, print "name is not found"
		//you must use iterator to implement
		bool d = false;
		for (int i = 0; i < people.size(); i++)
		{
			if (people[i].first==name)
			{
				cout << name << " is erased! " << endl;
				people.erase(people.begin()+i);
				d = true;
			}
		}
		if (d==false) {cout << name << " is not found! " << endl; }
	}

	void sortByName() {
		//TODO: call sort() function (default one)
		sort(people.begin(), people.end());
	}

	void sortByInfo(const string type) {

		if (type == "H") {
			//TODO: call sort() function and compare by height
			sort(people.begin(), people.end(), compareHeight);
		}
		else if (type == "W") {
			//TODO: call sort() function and compare by weight
			sort(people.begin(), people.end(), compareWeight);
		}
		else if (type == "HW") {
			//TODO: call sort() function and compare by height and weight
			sort(people.begin(), people.end(), compareBoth);
		}
	}

	void write(fstream& file) {
		//TODO: Write all elements in the map to the file
		//you must use iterator to implement
		for (vector<pair<string, info> >::iterator it = people.begin(); it!=people.end(); ++it)
		{
			file << it->first << ":\t" << it->second.height << ", " << it->second.weight << "\n";
		}
	}

	void writeFile() {
		fstream file;
		file.open("lab7.txt", ios::out);

		file << "Sort By Name\n";
		sortByName();
		write(file);
		file << "\nSort By Height\n";
		sortByInfo("H");
		write(file);
		file << "\nSort By Weight\n";
		sortByInfo("W");
		write(file);
		file << "\nSort By Height&Weight\n";
		sortByInfo("HW");
		write(file);

		cout << "File lab7.txt saved!\n";
		file.close();
	}

private:
	vector<pair<string, info> > people;
};

int main() {
	Map myMap;

	myMap.readFile();
	myMap.writeFile();

	system("pause");
	return 0;
}
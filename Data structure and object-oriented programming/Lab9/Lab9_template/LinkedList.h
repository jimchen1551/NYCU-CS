#ifndef LINKEDLIST_H
#define LINKEDLIST_H

#include<iostream>
using namespace std;

struct Node
{
	int value;
	Node* next;

	Node() : value(0), next(NULL) {};
	Node(int x) : value(x), next(NULL) {};
};

class LinkedList
{
private:
	Node* head;
public:
	LinkedList();
	~LinkedList();
	void Push_back(int x);
	void Push_front(int x);
	void Insert(int index, int x);
	void Delete(int index);
	void Reverse();
	void Print();
	void Clear();
};

LinkedList::LinkedList()
{
	head = NULL;
}

LinkedList::~LinkedList()
{
	Clear();
}

void LinkedList::Push_back(int x)
{
	//TODO: add a new node to the back of the list with value x
	if (head == NULL)
	{
		head = new Node(x);
		return;
	}
	Node* traveler = head;
	Node* pushed_node = new Node(x);
	while(traveler->next!=NULL)
		traveler = traveler->next;
	traveler->next = pushed_node;
}

void LinkedList::Push_front(int x)
{
	//TODO: add a new node to the front of the list with value x
	Node* pushed_node = new Node(x);
	pushed_node->next = head;
	head = pushed_node;
}

void LinkedList::Insert(int index, int x)
{
	//TODO: add a new node at position "index" of the list with value x
	if (index==0)
	{
		Push_front(x);
		return;
	}
	Node* traveler = head;
	Node* inserted_node = new Node(x);
	for (int i = 0; i < index-1; i++)
		traveler = traveler->next;
	inserted_node->next = traveler->next;
	traveler->next = inserted_node;
}

void LinkedList::Delete(int index)
{
	//TODO: delete the node at position "index"
	if (index==0)
	{
		Node* deleted_node = head;
		head = deleted_node->next;
		delete deleted_node;
		return;
	}
	Node* traveler = head;
	for (int i = 0; i < index-1; i++)
		traveler = traveler->next;
	Node* deleted_node = traveler->next;
	traveler->next = deleted_node->next;
	delete deleted_node;
}

void LinkedList::Reverse()
{
	//TODO: reverse all elements in the list
}

void LinkedList::Print()
{
	//TODO: print out all elements in the list
	// if (head==NULL)
	// {
	// 	cout << "null" << endl;
	// 	return;
	// }
	Node * traveler = head;
	while (true)
	{
		if (traveler==NULL)
		{
			cout << "null" << endl;
			break;
		}
		cout << traveler->value << "->";
		traveler = traveler->next;
	}
	
}

void LinkedList::Clear() 
{
	//TODO: delete all elements in the list
	Node* traveler_0 = head;
	Node* traveler_1;
	while (traveler_1 != NULL)
	{
		traveler_1 = traveler_0->next;
		delete traveler_0;
		traveler_0 = traveler_1;
	}
	head = NULL;
}

#endif
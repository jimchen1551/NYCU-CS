#include<stack>
#include<iostream>
using namespace std;

class Node
{
    public:
        Node(int _value = 0): value(_value), left(NULL), right(NULL){};
        bool isRight(Node*);
        bool isLeft(Node*);
        bool isParent(Node*);
        
        int value;
        Node* left;
        Node* right;
        Node* parent;
};

bool Node::isRight(Node* _parent) {return (this==_parent->right);}
bool Node::isLeft(Node* _parent) {return (this==_parent->left);}
bool Node::isParent(Node* _child) {return (this==_child->parent);}

class Heap
{
    public:
        Heap();
        ~Heap();
        stack<int> getDir(int);
        Node* getNode(int);
        int  update(int);
        void insert(int);
        int  remove(int);
        void print();
        void clear();
    private:
        Node* root;
        int num;
};

Heap::Heap(){root=NULL; num=0;}
Heap::~Heap(){clear();}

//index starts from 1
stack<int> Heap::getDir(const int index)
{
    int x = index;
    stack<int> dir;
    while (x>1)
    {
        dir.push(x%2);
        x /= 2;
    }
    return dir;
}

//next node->parent: index = num/2
Node* Heap::getNode(int index)
{
    stack<int> dir = getDir(index);
    Node* target = root;
    int d, size = dir.size();
    for (int i = 0; i < size; i++)
    {
        d = dir.top();
        if (d) target = target->right;
        else target = target->left;
        dir.pop();
    }
    return target;
}

//return new index of target
int Heap::update(int index)
{
    Node* Target = getNode(index);
    if (index==1) return index;
    else if (Target->value > Target->parent->value)
    {
        Node* Parent = Target->parent;
        Node* Parent_P = Parent->parent;
        Node* Target_L = Target->left;
        Node* Target_R = Target->right;
        Target->parent = Parent_P;
        if (Parent_P!=NULL)
        {
            if (Parent->isLeft(Parent_P))
                Parent_P->left = Target;
            else
                Parent_P->right = Target;
        }
        if (Target->isLeft(Parent))
        {
            Node* Parent_R = Parent->right;
            if (Parent_R!=NULL) Parent_R->parent = Target;
            Target->right = Parent_R;
            Target->left = Parent;
        }
        else
        {
            Node* Parent_L = Parent->left;
            if (Parent_L!=NULL) Parent_L->parent = Target;
            Target->left = Parent_L;
            Target->right = Parent;
        }
        Parent->left = Target_L;
        Parent->right = Target_R;
        if (Target_L!=NULL) Target_L->parent = Parent;
        if (Target_R!=NULL) Target_R->parent = Parent;
        Parent->parent = Target;
        if (root==Parent) root = Target;
        return index / 2;
    }
    else return index;
}

void Heap::insert(int x)
{
    Node* inserted = new Node(x);
    num++;
    if (num==1)
    {
        root = inserted;
        return;
    }
    Node* _parent = getNode(num / 2);
    inserted->parent = _parent;
    if (num % 2) _parent->right = inserted;
    else _parent->left = inserted;
    int d, index = num;
    while (true)
    {
        d = update(index);
        if (d==index) break;
        else index = d;
    }
}

int Heap::remove(int index)
{
    Node* target = getNode(index);
    Node* last = getNode(num);
    int answer = target->value;
    num--;
    if (num==0)
    {
        root = NULL;
        delete target;
        return answer;
    }
    if (last->isLeft(last->parent)) last->parent->left = NULL;
    else last->parent->right = NULL;
    last->left = target->left;
    last->right = target->right;
    last->parent = target->parent;
    if (target->parent!=NULL)
    {
        if (target->isLeft(target->parent)) target->parent->left = last;
        else target->parent->right = last;
    }
    if (target->left!=NULL) target->left->parent = last;
    if (target->right!=NULL) target->right->parent = last;
    if (index==1) root = last;
    int d, id;
    for (int i = 2; i < num+1; i++)
    {
        id = i;
        while (true)
        {
            d = update(id);
            if (d==id) break;
            else id = d;
        }
    }
    delete target;
    return answer;
}

void Heap::print()
{
    int n = num;
    for (int i = 1; i < n+1; i++)
    {
        cout << remove(1) << " ";
    }
    cout << endl;
}

void Heap::clear()
{
    while(num)
    {
        Node* target = getNode(num);
        delete target;
        num--;
    }
    return;
}
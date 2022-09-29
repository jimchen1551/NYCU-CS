#include "Vector.h"

//Vector.cpp
//TODO: constructor
Vector::Vector() {}
Vector::Vector(float _x, float _y, float _z): x(_x), y(_y), z(_z) {}
 
Vector Vector::operator+(Vector v)
{
	Vector answer(this->x+v.x, this->y+v.y, this->z+v.z);
	return answer;
}

Vector Vector::operator-(Vector v)
{
	Vector answer(this->x-v.x, this->y-v.y, this->z-v.z);
	return answer;
}


float Vector::operator*(Vector v)
{
	return this->x * v.x + this->y * v.y + this->z * v.z;
}

Vector Vector::operator/(Vector v)
{
	Vector answer(this->y * v.z - this->z * v.y, this->z * v.x - this->x * v.z, this->x * v.y - this->y * v.x);
	return answer;
}

Vector Vector::operator-()
{
	Vector answer(-this->x, -this->y, -this->z);
	return answer;
}

bool Vector::operator>(Vector v) {
	return (x*x+y*y+z*z)>(v.x*v.x+v.y*v.y+v.z*v.z);
}


ifstream& operator>>(ifstream& in, Vector& v)
{
	//TODO: Overload the >> operator.
	//Read the input.txt file and store vector in v
	in >> v.x >> v.y >> v.z;
	return in;
}

ostream& operator<<(ostream& out, const Vector& v)
{
	//TODO: Overload the << operator.
	//Output the vector v
	out << "(" << v.x << ", " << v.y << ", " << v.z << ")";
	return out;
}
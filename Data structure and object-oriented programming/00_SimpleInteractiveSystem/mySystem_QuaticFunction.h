//
// Instructor: Sai-Keung WONG
// Email:	cswingo@cs.nctu.edu.tw
//			wingo.wong@gmail.com
//
// National Yang Ming Chiao Tung University, Taiwan
// Computer Science
// Date: 2021/07/13
//
#ifndef __MY_QUATIC_FUNCTION_H_
#define __MY_QUATIC_FUNCTION_H_
#include "../../headers.h"
#include <string>
#include "../../primitives/vector3d.h"
#include <vector>
using std::vector;
class QUARTIC_FUNCTION
{
protected:
	// ax^4 + bx^3 + cx^2 +dx + e 
	double a, b, c, d, e;
	double x0, x1;
	int mNumSamples;
public:
	QUARTIC_FUNCTION( );
	void askForInput( );
	void getRangeOfX( double &x0, double &x1 ) const;
	int getNumOfSamples( ) const;
	double getValue( double x ) const;
    void increase(double dv = 0.1);
    void decrease(double dv = 0.1);
    bool handleKeyEvent( unsigned char key );
    double getA() const { return a; }
    double getB() const { return b; }
    double getC() const { return c; }
    double getD() const { return d; }
    double getE() const { return e; }
};
#endif
// CODE: 2020/07/14. Do not delete this line.
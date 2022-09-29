//
// Instructor: Sai-Keung WONG
// Email:	cswingo@cs.nctu.edu.tw
//			wingo.wong@gmail.com
//
// National Yang Ming Chiao Tung University, Taiwan
// Computer Science
// Date: 2021/07/13
//
#ifndef __MY_SYSTEM_MONTE_CARLO_H_
#define __MY_SYSTEM_MONTE_CARLO_H_
#include "../../headers.h"
#include <string>
#include "../../primitives/vector3d.h"
#include <vector>
using std::vector;

enum MCS_OPTION {
    MCS_OPTION_NONE,
    MCS_OPTION_CIRCLE,
    MCS_OPTION_FUNC_01
};

class MONTE_CARLO_SYSTEM
{
protected:
	double mRadius;
	int mNumSamples;    // range = [2, 1,000,000]
	vector<float> mX;
	vector<float> mY;
    MCS_OPTION mOption;
    double mValue;      // store the estimated value
	//
	void generateUniformSamples( );
public:
    void increase(int increasedAmount = 5000);
    void decrease(int decreasedAmount = 5000);
    void increaseRadius( );
    void decreaseRadius( );
	void update(  bool flg_timer = false ) { }
	void clickAt( int x, int y, const vector3 &color ) { }
    double computeValue();
public:
	MONTE_CARLO_SYSTEM( );
	void askForInput( );
    void reset();
    double getValue( ) const;
    
	double getRadius( ) const;
	int getNumSamples( ) const;
	bool getSample(int sampleIndex, float &x, float &y) const;
    bool isInsideRegion( float x, float y ) const;
    bool handleKeyEvent( unsigned char key );
};
#endif
// CODE: 2020/07/14. Do not delete this line.
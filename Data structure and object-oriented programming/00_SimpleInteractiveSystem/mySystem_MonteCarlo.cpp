//
// Instructor: Sai-Keung WONG
// Email:	cswingo@cs.nctu.edu.tw
//			wingo.wong@gmail.com
//
// National Yang Ming Chiao Tung University, Taiwan
// Computer Science
// Date: 2021/07/13
//
#include "mySystem_MonteCarlo.h"
#include <iostream>

using namespace std;

#define MAX_NUM_SAMPLES 1000000
#define MIN_NUM_SAMPLES 2
#define DFT_NUM_SAMPLES 10000

MONTE_CARLO_SYSTEM::MONTE_CARLO_SYSTEM( )
{
	cout.precision(8);
    mValue = 0.0;
    mRadius = 5.0f;
	mNumSamples = DFT_NUM_SAMPLES;
    mOption = MCS_OPTION::MCS_OPTION_CIRCLE;
	reset();
}

void MONTE_CARLO_SYSTEM::reset()
{
    generateUniformSamples( );
    computeValue();
}

//increase the radius of the circle
void MONTE_CARLO_SYSTEM::increaseRadius( )
{
    mRadius += 1;
    if ( mRadius > 10) mRadius = 10;
    cout << "Radius: " << mRadius << endl;
    generateUniformSamples( );
    computeValue();
}

//decrease the number of sample points
void MONTE_CARLO_SYSTEM::decreaseRadius( )
{
    mRadius -= 1;
    if ( mRadius < 1) mRadius = 1;
    cout << "Radius: " << mRadius << endl;

    generateUniformSamples( );
    computeValue();
}

//increase the number of sample points
void MONTE_CARLO_SYSTEM::increase(int increasedAmount)
{
    mNumSamples += increasedAmount;
    //if ( mNumSamples > MAX_NUM_SAMPLES)
    //    mNumSamples = MAX_NUM_SAMPLES;
    //generateUniformSamples( );
    //computeValue();
}

//decrease the number of sample points
void MONTE_CARLO_SYSTEM::decrease(int decreasedAmount)
{
    mNumSamples -= decreasedAmount;
   
}

//
//Show the system name
//Ask to input the radius of the circle
//Ask to input the number of sample points
//Call computeSamples( ) to compute the sample points and pi
//
void MONTE_CARLO_SYSTEM::askForInput( )
{
	
	cout << "This is a Monte Carlo Simulation." << endl;

    while (true) {
	    cout << "Please input the radius of the circle [1,10]:" << endl;
	    cin >> mRadius;
        //
        // 1 and 10 are magic values. This is a poor programming style.
        // 
        if ( mRadius >1 && mRadius <= 10) break;
    }
}

//
// Compute the coordinates of the sample points uniformly.
// There are mNumSamples samples.
//
void MONTE_CARLO_SYSTEM::generateUniformSamples( )
{
	mX.clear( );
	mY.clear( );


	for ( int i = 0; i < mNumSamples; ++i ) {
		float x, y;
		double fx = ( rand( )%RAND_MAX )/(double) (RAND_MAX-1);
		
        x = 2*fx*mRadius - mRadius;
		y = 0.0;

		mX.push_back( x );
		mY.push_back( y );
	}

}

// 
// Compute PI and output it to the console window.
//
double MONTE_CARLO_SYSTEM::computeValue()
{
    	int counter = 0;
	for ( int i = 0; i < mNumSamples; ++i ) {
		bool flgInside = false;
		float x = mX[ i ];
		float y = mY[ i ];

	}
    mValue = 0.0;
	cout << "mValue:" << mValue << endl;
    return mValue;
}

double MONTE_CARLO_SYSTEM::getValue( ) const
{
    return mValue;
}


//
//Return the radius of the circle
//
double MONTE_CARLO_SYSTEM::getRadius( ) const
{
	return mRadius;
}

//Return the number of sample points
int MONTE_CARLO_SYSTEM::getNumSamples( ) const
{
	
	return mNumSamples;
}

//
// If an option is set, compute the value.
//
bool MONTE_CARLO_SYSTEM::handleKeyEvent( unsigned char key )
{
    bool flgHandled = false;

    switch( key ) {
    case '1':
        mOption = MCS_OPTION::MCS_OPTION_CIRCLE;
        flgHandled = true;
        break;
    case '2':
        //MCS_OPTION::MCS_OPTION_FUNC_01;
        flgHandled = true;
        break;
    }

    if (flgHandled) {
        // call a function to compute the required value
    }

    return flgHandled;
}

//
// Determine whether the point (x,y) is inside the region
// Return true if yes
// Return fase otherwise
//
bool MONTE_CARLO_SYSTEM::isInsideRegion( float x, float y ) const
{
    bool flgInside = false;
    float fy;
    switch (mOption) {
     case MCS_OPTION::MCS_OPTION_CIRCLE:
	    if ( x*x > mRadius ) {
	    	flgInside = true;
	    }
      break;

     case MCS_OPTION::MCS_OPTION_FUNC_01:
        break;
    }
    return flgInside;
}

//
// Input: sampleIndex is the index of the sample. 
// The index starts from 0.
// Return the sample coordinates in (x, y).
//
// Return the boolean value indicating 
// whether the sample point (x,y) lying inside the region.
//
bool MONTE_CARLO_SYSTEM::getSample(int sampleIndex, float &x, float &y) const
{
	bool flgInside = false;
	//x = mX[ sampleIndex ];
    y = 0.0;

	return flgInside;
}
//
// CODE: 2020/07/14. Do not delete this line.
//
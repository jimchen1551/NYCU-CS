//
// Instructor: Sai-Keung WONG
// Email:	cswingo@cs.nctu.edu.tw
//			wingo.wong@gmail.com
//
// National Chiao Tung University, Taiwan
// Computer Science
// Date: 2020/07/14
//
#include <sstream>
#include "mySystemApp.h"

using namespace std;

void MY_SYSTEM_APP::increase()
{
    switch( mSystemType ) {
		case SYSTEM_TYPE_MONTE_CARLO:
			mMonteCarloSystem.increase( );
            updateMonteCarloTitle();
			break;
		case SYSTEM_TYPE_QUARTIC_FUNCTION:
            mQuarticFunction.increase();
            updateQuarticFunctionTitle();

			break;
		case SYSTEM_TYPE_STUDENT_RECORD_MANAGER:
			break;
	}
}

void MY_SYSTEM_APP::decrease()
{
    switch( mSystemType ) {
		case SYSTEM_TYPE_MONTE_CARLO:
			mMonteCarloSystem.decrease( );
            updateMonteCarloTitle();
			break;
		case SYSTEM_TYPE_QUARTIC_FUNCTION:
            mQuarticFunction.decrease();
            updateQuarticFunctionTitle();
			break;
		case SYSTEM_TYPE_STUDENT_RECORD_MANAGER:
			break;
	}
}

void MY_SYSTEM_APP::increaseRadius()
{
    switch( mSystemType ) {
		case SYSTEM_TYPE_MONTE_CARLO:
			mMonteCarloSystem.increaseRadius( );
            updateMonteCarloTitle();
			break;
		case SYSTEM_TYPE_STUDENT_RECORD_MANAGER:
			break;
	}
}

void MY_SYSTEM_APP::decreaseRadius()
{
    switch( mSystemType ) {
		case SYSTEM_TYPE_MONTE_CARLO:
			mMonteCarloSystem.decreaseRadius( );
            updateMonteCarloTitle();
			break;
		case SYSTEM_TYPE_STUDENT_RECORD_MANAGER:
			break;
	}
}

void MY_SYSTEM_APP::handle_key01()
{
        switch( mSystemType ) {
		case SYSTEM_TYPE_MONTE_CARLO:
			break;
		case SYSTEM_TYPE_STUDENT_RECORD_MANAGER:
			break;
	}
}

void MY_SYSTEM_APP::handle_key02()
{
        switch( mSystemType ) {
		case SYSTEM_TYPE_MONTE_CARLO:
			break;
		case SYSTEM_TYPE_STUDENT_RECORD_MANAGER:
			break;
	}

}

void MY_SYSTEM_APP::handle_key03()
{
        switch( mSystemType ) {
		case SYSTEM_TYPE_MONTE_CARLO:
			break;
		case SYSTEM_TYPE_STUDENT_RECORD_MANAGER:
			break;
	}
}

void MY_SYSTEM_APP::handle_key04()
{
        switch( mSystemType ) {
		case SYSTEM_TYPE_MONTE_CARLO:
			break;
		case SYSTEM_TYPE_STUDENT_RECORD_MANAGER:
			break;
	}

}

void MY_SYSTEM_APP::askForInput( )
{
	switch( mSystemType ) {
		case SYSTEM_TYPE_MONTE_CARLO:
			mMonteCarloSystem.askForInput( );
			break;
		case SYSTEM_TYPE_STUDENT_RECORD_MANAGER:
			mStudentRecordManager.askForInput( );
			break;
	}
}

void MY_SYSTEM_APP::updateMonteCarloTitle( )
{
    string title;
    string result;
    ostringstream strs;
    ostringstream strs_int;

    double value;
    double r;
    int numSamples;
    title = "SYSTEM_TYPE_MONTE_CARLO_SIMULATION";

    mMonteCarloSystem.reset( );
    r = mMonteCarloSystem.getRadius( );
    value = mMonteCarloSystem.computeValue( );
    
    strs << r;
    title = title + "  Radius:";
    title = title + strs.str();

    strs.str("");
    strs.clear( );
    strs << value;
    title = title + "  Area:";
    title = title + strs.str();
    numSamples = mMonteCarloSystem.getNumSamples();
    strs_int << numSamples;
    title = title + "  #Samples:";
    title = title + strs_int.str();
    glutSetWindowTitle(title.data());
}

void MY_SYSTEM_APP::updateQuarticFunctionTitle()
{
    string title;
    string result;
    ostringstream strs;
    ostringstream strs_d;

    title = "SYSTEM_TYPE_QUARTIC_FUNCTION  ";

   

    {
    double a = mQuarticFunction.getA();
    strs_d.str("");
    strs_d.clear();
    strs_d.precision(5);
    strs_d << a;
    title = title + "  a:";
    title = title + strs_d.str();
    }

    {
    double b = mQuarticFunction.getB();
    strs_d.str("");
    strs_d.clear();
    strs_d.precision(5);
    strs_d << b;
    title = title + "  b:";
    title = title + strs_d.str();
    }

    {
    double c = mQuarticFunction.getC();
    strs_d.str("");
    strs_d.clear();
    strs_d.precision(5);
    strs_d << c;
    title = title + "  c:";
    title = title + strs_d.str();
    }

    {
    double d = mQuarticFunction.getD();
    strs_d.str("");
    strs_d.clear();
    strs_d.precision(5);
    strs_d << d;
    title = title + "  d:";
    title = title + strs_d.str();
    }

    {
    double e = mQuarticFunction.getE();
    strs_d.str("");
    strs_d.clear();
    strs_d.precision(5);
    strs_d << e;
    title = title + "  e:";
    title = title + strs_d.str();
    }

    //
    glutSetWindowTitle(title.data());
}

bool MY_SYSTEM_APP::specialFunc(int key, int x, int y)
{
    string title;
	//cout << "special key:" << key << endl;

	switch( key ) {
	case GLUT_KEY_F1:
		mSystemType = SYSTEM_TYPE_MONTE_CARLO;
		updateMonteCarloTitle();
        cout << "mSystemType = SYSTEM_TYPE_MONTE_CARLO" << endl;
		break;
	case GLUT_KEY_F3:
		mSystemType = SYSTEM_TYPE_QUARTIC_FUNCTION;
        //title = "SYSTEM_TYPE_CUBIC_FUNCTION";
        //glutSetWindowTitle(title.data( ));
		cout << "mSystemType = SYSTEM_TYPE_QUARTIC_FUNCTION" << endl;
        updateQuarticFunctionTitle();
		break;
    case GLUT_KEY_F4:
		mSystemType = SYSTEM_TYPE_STUDENT_RECORD_MANAGER;
		title = "SYSTEM_TYPE_STUDENT_RECORD_MANAGER";
        glutSetWindowTitle(title.data( ));
        cout << "mSystemType = SYSTEM_TYPE_STUDENT_RECORD_MANAGER" << endl;

		break;
	}
	return true;
}

bool MY_SYSTEM_APP::handleKeyEvent( unsigned char key )
{
    bool flgHandled = false;
    if ( mSystemType == SYSTEM_TYPE_QUARTIC_FUNCTION ) {
        flgHandled = mQuarticFunction.handleKeyEvent( key );
        if (flgHandled) {
            updateQuarticFunctionTitle( );
            return flgHandled;
        }
    }

    if ( mSystemType == SYSTEM_TYPE_MONTE_CARLO ) {
        flgHandled = mMonteCarloSystem.handleKeyEvent( key );
        if (flgHandled) {
            updateMonteCarloTitle( );
            return flgHandled;
        }
    }

	
	switch ( key ) {
		case 's':
		case 'S': //fall through
			showMyStudentInfo_2021_Summer( );
			break;
		case 'i':
		case 'I':
			askForInput( );
			break;
		case 'g':
		case 'G':
			mFlgShow_Grid = !mFlgShow_Grid;
			break;
        case 'n':
            decreaseRadius();
            break;
        case 'm':
            increaseRadius();
            break;
        case '<':
            decrease();
            break;
        case '>':
            increase();
            break;
            case '1':
                handle_key01();
                break;
            case '2':
                handle_key02();
                break;
case '3':
                handle_key03();
                break;
            case '4':
                handle_key04();
                break;
	}
	return flgHandled;
}

bool MY_SYSTEM_APP::mouseMotionFunc( int mx, int my )
{
	static vector3 color( 1.0, 0.0, 0.0 );
	if ( mMouseButton == GLUT_LEFT_BUTTON ) {
		//cout << "mouseMotionFunc GLUT_LEFT_BUTTON" << endl;
		float x, y, z;
		mCamera->getCoordinates( x, y, z, (float) mx, (float) my );

		float rf = (rand()%1000)/1000.0f*0.5f;
		color += vector3(0.1f, 0.07f, 0.11f*rf);
		//clickAt( (int) x, (int) z, color );

	} else {
		//if ( mPickedObj == 0 ) {
		return FREE_CANVAS_2D::mouseMotionFunc( mx, my );
		//}
	}

	//cout << "here 5" << endl;

	//float x, y, z;
	//mCamera->getCoordinates( x, y, z, mx, my );
	//cout << "Set Position XZ:" << x << "\t" << z << endl;
	return true;
}

bool MY_SYSTEM_APP::mouseFunc( int button, int state, int mx, int my )
{
	//cout << "button:" << button << endl;
	//if ( mPickedObj == 0 || button == GLUT_MIDDLE_BUTTON ) {
	//if ( button == 3 || button == 4 ) {

	float x, y, z;
	mCamera->getCoordinates( x, y, z, (float) mx, (float) my );

	vector3 color( 1.0, 0.0, 0.0 );
	mMouseButton = button;
	if ( button == GLUT_LEFT_BUTTON ) {
		//clickAt( (int) x, (int) z, color );
	} else {
		return FREE_CANVAS_2D::mouseFunc( button, state, mx, my );
	}
	return true;
}


bool MY_SYSTEM_APP::passiveMouseFunc( int mx, int my )
{
	float x, y, z;
	mCamera->getCoordinates( x, y, z, (float) mx, (float) my );
	return true;
}
// CODE: 2019/02/25. Do not delete this line.
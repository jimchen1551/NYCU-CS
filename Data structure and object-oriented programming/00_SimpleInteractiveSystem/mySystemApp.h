//********************************************
// Student Name			:
// Student ID			:
// Student Email Address:
//********************************************
// Instructor: Sai-Keung WONG
// Email:	cswingo@cs.nctu.edu.tw
//			wingo.wong@gmail.com
//
// National Yang Ming Chiao Tung University, Taiwan
// Computer Science
// Date: 2021/07/13
//
#ifndef __MY_SYSTEM_APP_APP_H_
#define __MY_SYSTEM_APP_APP_H_
/////////////////////////////////////////////
#include "../../headers.h"
#include <string>
#include "../../openGLbasic/opengl_stuff.h"
#include "../../freeCanvas2D/freeCanvas2D.h"
#include "../../textureManager/texture.h"
/////////////////////////////////////////////
#include "mySystem_MonteCarlo.h"
#include "mySystem_QuaticFunction.h"
#include "mySystem_StudentRecordManager.h"

#define SYSTEM_TYPE_MONTE_CARLO         	1
#define SYSTEM_TYPE_STUDENT_RECORD_MANAGER	4
#define SYSTEM_TYPE_QUARTIC_FUNCTION         5

/////////////////////////////////////////////

using namespace ns_opengl;
class MY_SYSTEM_APP : public FREE_CANVAS_2D
{
protected:
	bool mFlgShow_Grid;
	int mMouseButton;
	//
    void updateMonteCarloTitle();
    void updateQuarticFunctionTitle();
    //
	void drawOrigin( ) const;
	void draw_MonteCarlo_Circle( ) const;
	void draw_System_Content( ) const;
	void draw_QuarticFunction( ) const;
	void draw_StudentRecordManager( ) const;
	void askForInput( );
    void increase();
    void decrease();
    void increaseRadius();
    void decreaseRadius();
    void handle_key01();
    void handle_key02();
    void handle_key03();
    void handle_key04();
	//
	void showMyStudentInfo_2021_Summer( ) const;
public:
	MY_SYSTEM_APP( );
	virtual void update( );
	virtual void draw( ) const;
	virtual void initApp( );
	//
	bool specialFunc(int key, int x, int y);
	bool handleKeyEvent( unsigned char key );
	bool passiveMouseFunc( int mx, int my );
	bool mouseMotionFunc( int x, int y );
	bool mouseFunc( int button, int state, int x, int y );
	//////////////////////////////////////////////////
protected:
	int mSystemType;
	MONTE_CARLO_SYSTEM mMonteCarloSystem;
	QUARTIC_FUNCTION mQuarticFunction;

	STUDENT_RECORD_MANAGER mStudentRecordManager;
};

#endif
// CODE: 2021/07/13. Do not delete this line.
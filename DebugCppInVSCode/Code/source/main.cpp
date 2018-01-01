#include "widget.h"
#include <iostream>

using namespace std;

#ifdef MAIN_CPP
int main()
{
    Widget w;
    w.SetHeight(10);
    cout << w.GetHeight() << endl;
    cout << "helloworld" << endl;
    return 0;
}
#endif
#include "widget.h"
#include <iostream>
using namespace std;

Widget::Widget() 
    : m_Height(0)
{

}

Widget::~Widget()
{

}

int Widget::GetHeight()
{
    return m_Height;
}

void Widget::SetHeight(int height)
{
    m_Height = height;
}

#ifdef WIDGET_CPP
int main()
{
    Widget w;
    cout << w.GetHeight() << endl;
    return 0;
}
#endif
#pragma once

class Widget
{
public:
    Widget();
    ~Widget();
    int GetHeight();
    void SetHeight(int);
private:
    int m_Height;
};
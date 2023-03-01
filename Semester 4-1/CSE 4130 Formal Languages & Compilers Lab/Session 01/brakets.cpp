#include <stdio.h>
#include <bits/stdc++.h>

using namespace std;

int main()
{
    fstream file1("input1.c", ios_base::in);
    ostringstream ss;
    string str, res;

    ss << file1.rdbuf();
    str = ss.str();
    int n = str.length();

    if (str.empty())
    {
        cout << "Input file can't be opened";
    }
    else
    {
        bool s_cmt = false;
        bool m_cmt = false;
        int n = str.length();

        for (int i = 0; i < n; i++)
        {
            if (str[i] == '/' && str[i + 1] == '/')
            {
                s_cmt = true;
                i++;
            }
            else if (str[i] == '/' && str[i + 1] == '*')
            {
                m_cmt = true;
                i++;
            }
            else if (s_cmt == true && str[i] == '\n')
            {
                s_cmt = false;
            }
            else if (m_cmt == true && str[i] == '*' && str[i + 1] == '/')
            {
                m_cmt = false, i++;
            }
            else if (s_cmt || m_cmt)
            {
                continue;
            }
            else
            {
                res += str[i];
            }
        }
    }
    str = res;
    str.erase(remove(str.begin(), str.end(), '\t'),str.end());
    str.erase(remove(str.begin(), str.end(), '\n'),str.end());
    str.erase(remove(str.begin(), str.end(), ' '), str.end());
    cout << str;
    file1.close();

    return 0;
}
/*
Offline 01
ID: 190104037 (A2)
*/
#include <bits/stdc++.h>
using namespace std;

int main()
{
    ifstream file1("input1.c");
    string str, res;
    ostringstream ss, ss2;
    int File_length = file1.tellg();
    ss << file1.rdbuf();
    str = ss.str();

    if (str.empty())
    {
        cout << "\n\nInput file can't be opened\n\n";
    }
    else
    {
        cout << "\nDisplaying 'input1.c' file:\n\n";
        cout << str;
        
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
        str = res;
        str.erase(remove(str.begin(), str.end(), '\t'), str.end());
        str.erase(remove(str.begin(), str.end(), '\n'), str.end());
        str.erase(remove(str.begin(), str.end(), ' '), str.end());
        str.erase(remove(str.begin(), str.end(), '*'), str.end());
        str.erase(remove(str.begin(), str.end(), '/'), str.end());
        file1.close();

        fstream file2("output.txt", ios_base::out);
        file2 << str;
        file2.close();

        cout << "\n\nDisplaying 'output.txt' file:\n\n";
        fstream file3("output.txt", ios_base::in);
        ss2 << file3.rdbuf();
        str = ss2.str();
        cout << str<<"\n";
        file3.close();
    }

    return 0;
}
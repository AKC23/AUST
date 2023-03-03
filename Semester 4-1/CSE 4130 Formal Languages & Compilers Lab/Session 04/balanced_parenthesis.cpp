#include <iostream>
using namespace std;

bool check_balanced_paranthesis(char* exp)
{
    int i = 0;
    char stack[100];
    int top = -1;
    while (exp[i])
    {
        if (exp[i] == '(' || exp[i] == '{' || exp[i] == '[')
        {
            stack[++top] = exp[i];
        }
        else if (exp[i] == ')' || exp[i] == '}' || exp[i] == ']')
        {
            if (top < 0)
            {
                return false;
            }
            char ch = stack[top--];
            if ((ch == '(' && exp[i] != ')') || (ch == '{' && exp[i] != '}') || (ch == '[' && exp[i] != ']'))
            {
                return false;
            }
        }
        i++;
    }
    if (top < 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

int main()
{
    char* exp = "float x1 = 3.125;;; double f1(float a, int int x) {if(x<x1) double z;; else z =        0.01;}} else return z; } int main(void) {{{{ int n1; double z; n1=25; z=f1(n1);}";
    if (check_balanced_paranthesis(exp))
    {
        cout << "Balanced" << endl;
    }
    else
    {
        cout << "Not Balanced" << endl;
    }
    return 0;
}

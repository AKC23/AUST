#include <stdio.h>
#include <bits/stdc++.h>
#include <math.h>

using namespace std;

double f(float x)
{
    return (x*x*x - x -1);
}

int main()
{
    float a = 1, b = 2;
    float root;
    float f0, f1, f2;
    if (f(a) * f(b) > 0)
    {
        printf("wrong guess");
    }

    do
    {
        f1 = f(a);
        f2 = f(b);
        root = (a - (f(a) * ((b - a) / (f(b) - f(a)))));
        f0 = f(root);

        if (f1 * f0 < 0)
        {
            b = root;
            f2 = f0;
        }
        else
        {
            a = root;
            f1 = f0;
        }
        printf("\nRoot = %f", root);

    } while (fabs(f(root)) >= 0.01);

    printf("\nRoot = %f", root);
}

#include <bits/stdc++.h>
#include <math.h>
#include <stdlib.h>

using namespace std;
/* Evaluating the function. */

float f(float x)
{
    return 3*x - cos(x) -1;
    // return (pow(x, 4) - 12 * (x) + 7);
}
/* Evaluating the derivative of the function */

float f_der(float x)
{
    return 3 + sin(x);
    // return (4 * pow(x, 3) - 12);
}

int main()
{
    float x0, x1, f0, f1, f_der0, e;
    x0 = 2;
    e = 0.01;

    /* Implementing Newton Raphson Method */

    do
    {
        f_der0 = f_der(x0);
        f0 = f(x0);
        if (f_der0 == 0.0)
        {
            printf("Mathematical Error.");
            break;
        }
        x1 = x0 - f0 / f_der0;
        x0 = x1;
        f1 = f(x1);

    } while (fabs(f1) > e);

    printf("\nRoot is: %.2f", x1);
}
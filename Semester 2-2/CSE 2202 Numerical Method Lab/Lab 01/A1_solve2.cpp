#include <stdio.h>
#include <bits/stdc++.h>
#include <math.h>

using namespace std;

double FunctionEvaluate(float x)
{
    return (x * x * x - x - 1);
}

int main()
{
    float X_lower, X_upper, f0, f1, f2, X_root, AbsoluteError, RelativeError, temp;
    X_lower = X_upper = f0 = f1 = f2 = X_root = AbsoluteError = RelativeError = temp = 0;
    int i = 0;
    printf("Enter the value of a and b respectively: ");
    scanf("%f %f", &X_lower, &X_upper);

    printf("No.of iteration\t  Approximate Root\tAbsolute Error\tRelative Error \n");
    printf("-----------------------------------------------------------------------");

    if (FunctionEvaluate(X_lower) * FunctionEvaluate(X_upper) > 0)
    {
        printf("Please try again");
    }
    do
    {
        f1 = FunctionEvaluate(X_lower);
        f2 = FunctionEvaluate(X_upper);
        X_root = (X_lower + X_upper) / 2;
        // X_root = (X_lower - (FunctionEvaluate(X_lower) * ((X_upper - X_lower) / (FunctionEvaluate(X_upper) - FunctionEvaluate(X_lower)))));
        f0 = FunctionEvaluate(X_root);

        if (f1 * f0 < 0)
        {
            X_upper = X_root;
            f2 = f0;
        }
        else
        {
            X_lower = X_root;
            f1 = f0;
        }
            i++;
            AbsoluteError = fabs(X_root - temp);
        RelativeError = fabs(AbsoluteError / X_root);

        printf("\n\t%d\t\t%f\t %f\t %f", i, X_root, fabsf(AbsoluteError), fabsf(RelativeError));
        temp = X_root; 
    } while (fabs(FunctionEvaluate(X_root)) >= 0.000001);

    printf("\nApproximate Root = %f", X_root);
}

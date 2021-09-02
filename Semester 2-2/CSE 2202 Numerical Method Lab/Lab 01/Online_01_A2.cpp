#include <stdio.h>
#include <bits/stdc++.h>
#include <math.h>

using namespace std;

double FunctionEvaluate(float x)
{
    return(exp(x) - 4*(x));
}

int main()
{
    float X_lower, X_upper, f0, f1, f2, X_root, AbsoluteError, RelativeError, temp, Update_limit, temp_upper, temp_lower;
    X_lower = X_upper = f0 = f1 = f2 = X_root = AbsoluteError = RelativeError = temp = 0;
    int i = 0;
    string s1;
    X_lower = 2, X_upper = 3;                      
    printf("\n\nEnter the value of a and b respectively: %f %f\n",X_lower, X_upper);

    printf("\nNo.of iteration\t  Approximate Root  Absolute Error  Relative Error   Change of limit\n");
    printf("--------------------------------------------------------------------------------------\n\n");

    if (FunctionEvaluate(X_lower) * FunctionEvaluate(X_upper) > 0)
    {
        printf("\nPlease try again\n");
    }
    do
    {
        f1 = FunctionEvaluate(X_lower);
        f2 = FunctionEvaluate(X_upper);
        X_root = (X_lower - (FunctionEvaluate(X_lower) * ((X_upper - X_lower) / (FunctionEvaluate(X_upper) - FunctionEvaluate(X_lower)))));
        f0 = FunctionEvaluate(X_root);

        // if (f1 * f0 < 0)
        // if (f2 * f0 > 0)
        if (f1 * f0 > 0)
        // if (f2 * f0 < 0)
        {
            X_upper = X_root;
            f2 = f0;

            if(temp_upper == X_upper )
                s1 = "No change";
            else
                s1 = "Upper limit changed";
            temp_upper = X_upper;
        }
        else
        {
            X_lower = X_root;
            f1 = f0;

            if(temp_lower == X_lower )
                s1 = "No change";
            else
                s1 = "Lower limit changed";            
            temp_lower = X_lower;
        }
        i++;
        AbsoluteError = fabs(X_root - temp);
        RelativeError = fabs(AbsoluteError / X_root);

        printf("%d\t\t  %.5f\t    %f\t    %f       ", i, X_root, fabsf(AbsoluteError), fabsf(RelativeError));
        cout << s1<<"\n";

        temp = X_root;
    } while (fabs(FunctionEvaluate(X_root)) > 0.0001);

    printf("\nApproximate Root = %.5f\n\n", X_root);
}

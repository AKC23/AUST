#include <stdio.h>
#include <bits/stdc++.h>
#include <math.h>

using namespace std;

double FunctionEvaluate(float x)
{
    return (tan(x) + x);
}

int main()
{
    float X_lower, X_upper, f0, f1, f2, X_root, AbsoluteError, RelativeError, temp, Update_limit, temp_upper, temp_lower;
    X_lower = X_upper = f0 = f1 = f2 = X_root = AbsoluteError = RelativeError = temp = 0;
    char limit[100];
    string s1;

    int i = 0;
    printf("Enter The Value of Xlower and Xupper: ");
    scanf("%f %f", &X_lower, &X_upper);

    printf("\nNo.of iteration\t  Xroot\t\t Xlower\t\t Xupper\t\t f(xroot)    Relative Error   Update of Limit\n");
    printf("---------------------------------------------------------------------------------------------------------------\n");

    if (FunctionEvaluate(X_lower) * FunctionEvaluate(X_upper) > 0)
    {
        printf("Please try again");
    }
    do
    {
        f1 = FunctionEvaluate(X_lower);
        f2 = FunctionEvaluate(X_upper);
        X_root = (X_lower + X_upper) / 2;
        f0 = FunctionEvaluate(X_root);

        if (f1 * f0 < 0)
        {
            X_upper = X_root;
            f2 = f0;
            // limit[i] = "Upper limit changed";
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
            // limit[i] = "Lower limit changed";
            if(temp_lower == X_lower )
                s1 = "No change";
            else
                s1 = "Lower limit changed";            
            temp_lower = X_lower;
            
        }
        i++;
        AbsoluteError = fabs(X_root - temp);
        RelativeError = fabs(AbsoluteError / X_root);

        // printf("\t%d\t%f\t%f\t%f\t%f\t%f %s\n", i, X_root, X_lower, X_upper, FunctionEvaluate(X_root), fabsf(RelativeError),limit[i-1]);
        printf("\t%d\t%f\t%f\t%f\t%f\t%f      ", i, X_root, X_lower, X_upper, FunctionEvaluate(X_root), fabsf(RelativeError));
        cout << s1<<"\n";
        temp = X_root;
    } while (fabs(FunctionEvaluate(X_root)) >= 0.000001);

    printf("\nApproximate Root = %f", X_root);
    printf("\nNumber of Iteration needed = %d", i);
}

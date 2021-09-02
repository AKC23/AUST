#include <stdio.h>
#include <math.h>

float FunctionEvaluate(float x);

int main()
{
    float Xlower, Xupper, Xroot, temp = 0, AbsoluteError, RelativeError;
    int i = 0;

    printf("Enter the value of a and b respectively:\n");
    scanf("%f %f", &Xlower, &Xupper);

    printf("No.of iteration|\t  Xroot|\tAbsolute Error|\tRelative Error|\n");
    printf("----------------------------------------------------------------------------------");

    if ((FunctionEvaluate(Xlower) * FunctionEvaluate(Xupper)) > 0)
        printf("Wrong guess, please try again");
    else
    {
        do
        {
            Xroot = (Xlower + Xupper) / 2;
            if ((FunctionEvaluate(Xlower) * FunctionEvaluate(Xroot)) <= 0)
                Xupper = Xroot;
            else
                Xlower = Xroot;

            i++;
            AbsoluteError = Xroot - temp;
            RelativeError = AbsoluteError / Xroot;

            printf("\n\t%d\t\t %f\t %f\t %f", i, Xroot, fabsf(AbsoluteError), fabsf(RelativeError));
            temp = Xroot;
        } while (fabs(FunctionEvaluate(Xroot)) > 0.000001);

        printf("\n\nApproximate Root: %f", Xroot);
    }
    return 0;
}

float FunctionEvaluate(float x)
{
    return ((pow(x, 3)) - x - 1);
}
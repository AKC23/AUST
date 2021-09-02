/* 
// Evaluate value of 2x3 - 6x2 + 2x - 1 for x = 3
Input: poly[] = {2, -6, 2, -1}, x = 3
Output: 5

// Evaluate value of 2x3 + 3x + 1 for x = 2
Input: poly[] = {2, 0, 3, 1}, x = 2
Output: 23

f(x) = x^3 + 2x^2 + 10x - 20 = 0

*/

#include <stdio.h>
#include <bits/stdc++.h>
#include <math.h>

using namespace std;

int main()
{
    float a[100], sum = 0, x;
    int n, i;

    printf("\nEnter degree of the polynomial x: ");
    scanf("%d", &n);
    printf("\nEnter coefficient's of the polynomial x: ");

    for (i = n; i >= 0; i--)
    {
        printf("\nCoefficient of x^%d: ", i);
        scanf("%f", &a[i]);
    }

    cout << "\nThe polynomial is: ";
    for (i = n; i >= 0; i--)
    {
        // printf("\nCoefficient of x^%d: ", i);
        if (i == 0)
            cout <<"("<<a[i]<<"x^" <<i<<")";
        else
            cout <<"("<<a[i]<<"x^" <<i<<")"<<" + ";
        // if (i != n - 1)
        //     cout << " + ";
    }
    cout <<"\n\n";

    printf("\nEnter the value of x: ");
    scanf("%f", &x);

    for (i = n; i > 0; i--)
    {
        sum = (sum + a[i]) * x;
    }

    sum = sum + a[0];
    printf("\nValue of the polynomial is f[%.1f] = %.3f \n", x, sum);

    return 0;
}
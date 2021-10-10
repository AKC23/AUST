#include <bits/stdc++.h>
#include <math.h>
using namespace std;

void LagrangeInterpolation()
{
    int n;
    cout << "\n\nEnter the input number: ";
    cin >> n;
    double x1, y1;
    double xs[n], ys[n];

    for (int c = 1; c <= n; c++)
    {
        cin >> x1 >> y1;
        xs[c] = x1;
        ys[c] = y1;
    }
    double p = 0;

    cout << "\n\n\nx \t"
         << "Interpolated Cube root of x\t"
         << "True value\t"
         << "Absolute Error" << endl;
    for (double x = 1.15; x <= 1.65; x += 0.05)
    {

        double ans = 0; //Yp = 0

        for (int i = 0; i < n; i++)
        {
            double temp = 1; //Set p(Xp) = 1
            for (int j = 0; j < n; j++)
            {
                if (i != j)
                {
                    temp *= (x - xs[j]) / (xs[i] - xs[j]); //p(Xp) = p(Xp) * (Xp - Xi)/(Xi-Xj)
                }
            }
            ans += temp * ys[i];
        }

        cout << x << "\t" << ans << "\t \t \t \t" << cbrt(x) << "\t \t" << abs(ans - cbrt(x)) << endl;
    }
}


void NewtonDividedDifferenceInterpolation()
{
    int n;
    cout << "\nEnter the number of input: ";
    cin >> n;

    double x1, y1;
    double xs[n], ys[n + 1][n + 1];

    for (int c = 0; c < n; c++) //taking input
    {
        cin >> x1 >> y1;
        xs[c] = x1;
        ys[c][0] = y1;
    }

    n = 4;
    for (int i = 1; i < n; i++) //calculating divided difference table
    {
        for (int j = 0; j < n - i; j++)
        {
            //yj,i = (yj+1,i − yj ,i - 1) / (xj+i − x j);
            ys[j][i] = (ys[j][i - 1] - ys[j + 1][i - 1]) / (xs[j] - xs[i + j]);
        }
    }

    cout << "\n\n\nx \t"
         << "Interpolated Cube root of x\t"
         << "True value\t"
         << "Absolute Error" << endl;
    //independent variable Xp whose corresponding value of Yp is to be determined
    
    for (double x = 1.15; x <= 1.65; x += 0.05) //Apply Divided Difference Formula
    {
        double ans = 0;

        for (int i = 0; i < n; i++)
        {
            double temp = 1; //product = 1
            for (int j = 0; j < i; j++)
            {
                temp *= (x - xs[j]); //product = product * (xp - xj)
            }
            ans += temp * ys[0][i]; //yp = yp + product * y0i
        }

        cout << x << "\t" << ans << "\t \t \t \t" << cbrt(x) << "\t \t" << abs(ans - cbrt(x)) << endl;
    }
}

int main()
{
    // LagrangeInterpolation();

    cout << "\n\n";
    NewtonDividedDifferenceInterpolation();

    cout << "\n\n";
}

/* 

11

1.0 1.0
1.1 1.032
1.2 1.063
1.3 1.091
1.4 1.119
1.5 1.145
1.6 1.170
1.7 1.193
1.8 1.216
1.9 1.239
2.0 1.260

 */
#include <bits/stdc++.h>

using namespace std;

void NewtonDividedDifferenceInterpolation()
{
    int n;
    cout << "Enter the number of data points: ";
    cin >> n;

    double x1, y1;
    double xs[n], ys[n + 1][n + 1];
    cout << "\nGive " << n << " inputs\n";
    for (int c = 0; c < n; c++)
    {
        cin >> x1 >> y1;
        xs[c] = x1;
        ys[c][0] = y1;
    }

    n = 4;
    cout << "\nDegree: " <<n<<"\n\n";
    for (int i = 1; i < n; i++)
    {
        for (int j = 0; j < n - i; j++)
        {
            ys[j][i] = (ys[j][i - 1] - ys[j + 1][i - 1]) /(xs[j] - xs[i + j]);
        }
    }

    cout << "x \t"
         << "Interpolated Cube root of x\t"
         << "True value\t"
         << "Absolute Error" << endl;

    for (double x = 1.0; x <= 2.0; x += 0.1)
    {
        double ans = 0;

        for (int i = 0; i < n; i++)
        {
            double temp = 1;
            for (int j = 0; j < i; j++)
            {
                temp *= (x - xs[j]);
            }
            ans += temp * ys[0][i];
        }

        cout << x << "\t" << ans << "\t \t \t \t" << cbrt(x) << "\t \t" << abs(ans - cbrt(x)) << endl;
    }
}

int main()
{
    // cout.precision(7);
    NewtonDividedDifferenceInterpolation();
}
/* 
10

1993 25.00317 
1994 25.26167 
1996 25.44025 
1997 24.85925 
1998 25.52417 
1999 25.71483 
2000 25.89920 
2001 25.33700 
2002 25.38033 
2003 25.39678 


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
#include <bits/stdc++.h>
#include <math.h>

using namespace std;

void Linear_Regression()
{
    int n;
    cout << "Enter the number of n: ";
    cin >> n;

    double x[n], y[n];
    double x1, y1;

    for (int c = 1; c <= n; c++)
    {
        cin >> x1 >> y1;
        x[c] = x1;
        y[c] = y1;
    }
    double sumX = 0, sumX2 = 0, sumY = 0, sumXY = 0;

    for (int c = 1; c <= n; c++)
    {
        sumX = sumX + x[c];
        sumX2 = sumX2 + (x[c] * x[c]);
        sumY = sumY + y[c];
        sumXY = sumXY + (x[c] * y[c]);
    }

    double b = (((n * sumXY) - (sumX * sumY)) / ((n * sumX2) - (sumX * sumX)));
    double a = (sumY - (b * sumX)) / n;

    cout << "\n";
    cout << "\nValue of a: " << a;
    cout << "\nValue of b: " << b;
}

int main()
{
    Linear_Regression();
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
#include<bits/stdc++.h>

using namespace std;

double correlation(double x[], double y[], int n){

    double R;

    R = ((n * summation(XY(x, y, 1, n), 1, n)) - (summation(x, 1, n) * summation(y, 1, n))) / (sqrt(((n * summation(x, 2, n)) - pow(summation(x, 1, n), 2)) * ((n * summation(y, 2, n)) - pow(summation(y, 1, n), 2))));

    printf("Correlation Coefficient R\t %lf",R);
    return R;
}
int main()
{
    int n;
    cin>>n;
    double x[n],y[n];

    for(int c=0;c<n;c++)
    {
        cin>>x[c]>>y[c];
    }
    double value = correlation(x,y,n);
}


/* 
// C++ program for implementation of Newton Raphson Method for solving equations 
https://www.geeksforgeeks.org/program-for-newton-raphson-method/
*/
#include <bits/stdc++.h>
#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#define EPSILON 0.01
using namespace std;

// An example function whose solution is determined using
// Bisection Method. The function is x^3 - x^2  + 2
double func(double x)
{
    // return x * x * x - x * x + 2;
    // return x * x * x * x - 12 * x + 7;
    return ( pow(x,4) - 12*(x) + 7);
}

// Derivative of the above function which is 3*x^x - 2*x
double derivFunc(double x)
{
    // return 3 * x * x - 2 * x;
    // return 4 * x * x * x - 12;
    return ( 4 * pow(x,3) - 12);
}

// Function to find the root
void newtonRaphson(double x)
{
    double h = func(x) / derivFunc(x);
    while (abs(h) >= EPSILON)
    {
        h = func(x) / derivFunc(x);
        // x(i+1) = x(i) - f(x) / f'(x)
        x = x - h;
    }

    cout << "\nThe value of the root is : " << x << "\n";
}

int main()
{
    // double x0 = -20; // Initial values assumed
    double x0 = 2; // Initial values assumed
    newtonRaphson(x0);
    return 0;
}
/* 
https://www.geeksforgeeks.org/horners-method-polynomial-evaluation/

// Evaluate value of 2x3 - 6x2 + 2x - 1 for x = 3
Input: poly[] = {2, -6, 2, -1}, x = 3
Output: 5

// Evaluate value of 2x3 + 3x + 1 for x = 2
Input: poly[] = {2, 0, 3, 1}, x = 2
Output: 23
 */
#include <iostream>
using namespace std;

// returns value of poly[0]x(n-1) + poly[1]x(n-2) + .. + poly[n-1]
float horner(float poly[], int n, float x)
{
    float result = poly[0]; // Initialize result

    // Evaluate value of polynomial using Horner's method
    for (int i = 1; i < n; i++)
        result = result * x + poly[i];

    return result;
}

int main()
{
    // // Let us evaluate value of 2x3 - 6x2 + 2x - 1 for x = 3
    // int poly[] = {2, -6, 2, -1};
    // int x = 3;

    // float poly[] = {5, 4, 3, 2, 1, 12};
    // float x = 1.5;

    // float poly[] = {1,2,10,-20};
    // float x = -2;
    
    float poly[] = {1,-1,-1};
    float x = 2;

    int n = sizeof(poly) / sizeof(poly[0]);
    cout << "\nValue of polynomial is " << horner(poly, n, x) << "\n";
    return 0;
}
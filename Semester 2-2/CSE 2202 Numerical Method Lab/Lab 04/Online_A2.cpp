#include <bits/stdc++.h>
#include <time.h>
using namespace std;
#define SIZE 10

void GaussElimination(int n)
{
    cout << "Gauss Elimination"<<endl;
    
    float a[SIZE][SIZE], x[SIZE], factor;
    int i, j, k, itr=0;

    /// Setting precision and writing floating point values in fixed-point notation.
    cout << setprecision(3) << fixed;
    /// Reading Augmented Matrix
    cout << "Enter Coefficients of Augmented Matrix: " << endl;
    for (i = 1; i <= n; i++)
    {
        for (j = 1; j <= n + 1; j++)
        {
            cout << "a[" << i << "][" << j << "]= ";
            cin >> a[i][j];
        }
    }
    cout<<"Starting of execution of Gauss Elimination method..."<<endl;
    auto begin = std::chrono::high_resolution_clock::now();
    /// Applying Gauss Elimination
    for (k = 1; k<=n; k++)
    {
        if (a[k][k] == 0.0)
        {
            cout << "Mathematical Error!";
            exit(0);
        }
        for (i=1; i<=n; i++)
        {
            if (k != i)
            {
                factor = a[k][k] / a[i][k];
                for (j = 1; j <= n+1; j++)
                {
                    a[i][j] = a[k][j] - a[i][j]*factor;
                    itr++;
                }
            }
        }
    }
    ///Printing reduced matrix:
    // cout<<"Reduced matrix:"<<endl;
    // for (i = 1; i<=n; i++)
    // {
    //     for (j = 1; j<=n; j++)
    //         cout<<a[i][j]<<"   ";
    //     cout<<endl;
    // }

    /// Back Substitution
    for (i = 1; i <= n; i++)
        x[i] = a[i][n + 1] / a[i][i];
    cout << endl;

    cout << "Solution: " << endl;
    for (i = 1; i <= n; i++)
        cout << "x[" << i << "] = " << x[i] << endl;

    cout << endl << "End of execution...." << endl;
    cout << "Number of iterations: "<< itr << endl;
    auto end = std::chrono::high_resolution_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - begin);
    cout << "Running time of Gauss Elimination method: " << elapsed.count() << " microseconds" << endl;
}

void GaussSeidel(int n)
{
    cout << " Gauss Seidel"<<endl;

    double error = 0.005;
    double a[n + 1][n + 1];
    double b[n + 1];
    double result[n + 1];
    double x[n + 1];
    int itr = 0;

    cout << "Enter coefficients:"<<endl;
    for (int k = 1; k <= n; k++)
    {
        for (int j = 1; j <= n; j++)
        {
            cout << "[" << k << "][" << j << "] = ";
            cin >> a[k][j];
        }
    }

    for (int i = 1; i <= n; i++)
    {
        cout << "For equation " << i << " right side value: ";
        cin >> b[i];
    }

    for (int i = 1; i <= n; i++)
    {
        x[i] = 0.0;
    }

    cout<<"Starting of execution of Gauss Seidel method..."<<endl;
    auto begin = std::chrono::high_resolution_clock::now();

    for (int k = 1; k <= n; k++)
    {
        for (int i = 1; i <= n; i++)
        {
            result[i] = b[i] / a[i][i];

            for (int j = 1; j <= n; j++)
            {
                if (j == i) continue;

                result[i] = result[i] - ((a[i][j] / a[i][i]) * x[j]);
                x[i] = result[i];
                itr++;
            }
        }

        for (int i = 1; i <= n; i++)
            cout << "x" << i << "\t" << result[i] << "\n";

        if (abs(x[k + 1] - x[k]) < error) break;
    }

    cout << "\nResult:\n";
    for (int i = 1; i <= n; i++)
    {
        cout << "x" << i << "\t" << result[i] << endl;
    }

    cout << endl << "End of execution...." << endl;
    cout << "Number of iterations: "<< itr << endl;
    auto end = std::chrono::high_resolution_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(end - begin);
    cout << "Running time of Gauss Seidel method: " << elapsed.count() << " microseconds" << endl;
}

int main()
{
    int n;
    cout << "Enter the size of the equations: ";
    cin >> n;

    GaussElimination(n);
    GaussSeidel(n);

    return 0;
}
/* 
3
1 1 -2 3
4 -2 1 5
3 -1 3 8

3 
1 1 -2 
4 -2 1 
3 -1 3 


3

7 7 -7 2
-1 11 7 1
11 5 7 0

3
7 7 -7
-1 11 7
11 5 7

a[1][1] = 7     
a[1][2] = 7
a[1][3] = -7
a[1][4] = 2
a[2][1] = -1
a[2][2] = 11
a[2][3] = 7
a[2][4] = 1
a[3][1] = 11
a[3][2] = 5
a[3][3] = 7
a[3][4] = 0 

Output
The solution of linear equation is:
x[1] = -1.929
x[2] = 1.956
x[3] = -0.987


*/




*/
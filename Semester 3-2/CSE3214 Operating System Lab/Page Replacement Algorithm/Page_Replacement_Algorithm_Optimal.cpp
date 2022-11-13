#include <bits/stdc++.h>
#include <iostream>
#include <algorithm>
using namespace std;
int k = 0;

printOutput(vector<int> &vec)
{
    k = k + 1;
    cout << "Loop " << k << ": ";
    for (int i = 0; i < vec.size(); i++)
    {

        if (i == 0)
        {
            cout << vec[i];
        }
        else
            cout << " -> " << vec[i];
    }
    cout << "\n";
}

int Predict_Future(int pg[], vector<int> &Q, int n, int index)
{
    int res = -1, farthest = index;
    for (int i = 0; i < Q.size(); i++)
    {
        int j;
        for (j = index; j < n; j++)
        {
            if (Q[i] == pg[j])
            {
                if (j > farthest)
                {
                    farthest = j;
                    res = i;
                }
                break;
            }
        }

        if (j == n)
            return i;
    }

    return (res == -1) ? 0 : res;
}

void Optimal(int pages[], int n, int capacity)
{
    vector<int> Q;
    Q.clear();
    int count, page_faults;
    count = page_faults = 0;

    for (int i = 0; i < n; i++)
    {
        sort(Q.begin(), Q.end());
        if (binary_search(Q.begin(), Q.end(), pages[i]) == true)
        {
            count++;
            continue;
        }

        if (Q.size() < capacity)
        {
            Q.push_back(pages[i]);
        }
        else
        {
            int j = Predict_Future(pages, Q, n, i + 1);
            Q[j] = pages[i];
        }
        printOutput(Q);
    }

    cout << "\nNumber of page fault using Optimum Page replacement Algorithm:: " << n - count;

    double percentage = ((n - count) * 100) / n;
    cout << "\nPage Fault Rate: ";
    cout << setprecision(2) << percentage << "%";
}

int main()
{
    int n, capacity;
    cout << "Number of pages: ";
    cin >> n;

    int pages[n];
    cout << "/nReference String: ";
    for (int i = 0; i < n; i++)
    {
        cin >> pages[i];
    }

    cout << "Number of memory page frame: ";
    cin >> capacity;

    Optimal(pages, n, capacity);

    return 0;
}

/*
22
7 0 1 2 0 3 0 4 2 3 0 3 0 3 2 1 2 0 1 7 0 1
3

28
0 15 4 2 12 0 1 7 9 7 15 0 4 7 10 5 21 3 11 5 1 21 15 1 17 12 9 7
3


29
15 1 4 22 14 10 1 7 9 25 10 4 7 10 5 21 3 11 5 11 21 15 1 17 22 19 21 7 9
4


*/
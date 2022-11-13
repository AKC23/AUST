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

void LRU(int pages[], int n, int capacity)
{
    vector<int> Q;
    vector<int>::iterator it;
    Q.clear();
    int count, page_faults;
    count = page_faults = 0;

    for (int k = 0; k < n; k++)
    {
        int i = pages[k];
        it = find(Q.begin(), Q.end(), i);

        if (it == Q.end())
        {
            ++page_faults;
            if (Q.size() == capacity)
            {
                Q.erase(Q.begin());
                Q.push_back(i);
            }
            else
            {
                Q.push_back(i);
            }
            printOutput(Q);
        }
        else
        {
            Q.erase(it);
            Q.push_back(i);
            printOutput(Q);
        }
        
    }

    cout << "\nNumber of page fault using LRU Page replacement Algorithm: " << page_faults;
    cout << "\nPage Fault Rate: ";
    double percentage = (page_faults * 100) / n;
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

    LRU(pages, n, capacity);

    return 0;
}

/*
22
7 0 1 2 0 3 0 4 2 3 0 3 0 3 2 1 2 0 1 7 0 1
3

28
0 15 4 2 12 0 1 7 9 7 15 0 4 7 10 5 21 3 11 5 1 21 15 1 17 12 9 7
4

29
15 1 4 22 14 10 1 7 9 25 10 4 7 10 5 21 3 11 5 11 21 15 1 17 22 19 21 7 9
4

*/
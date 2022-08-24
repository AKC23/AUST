#include <bits/stdc++.h>
#include <iostream>
#include <algorithm>
using namespace std;

void FIFO(int pages[], int n, int capacity)
{
    set<int> s;
    vector<int> Q;
    vector<int>::iterator it;
    Q.clear();
    int page_faults = 0;

    for (int i = 0; i < n; i++)
    {
        if (s.size() < capacity)
        {

            if (s.find(pages[i]) == s.end())
            {
                s.insert(pages[i]);
                it = Q.end();
                Q.insert(it, pages[i]);
                page_faults++;    
            }
        }
        else
        {
            if (s.find(pages[i]) == s.end()) 
            {
                int val = Q.front(); 
                it = Q.begin();
                Q.erase(it);
                s.erase(val);       
                
                it = Q.end();
                Q.insert(it, pages[i]);
                s.insert(pages[i]); 
                page_faults++; 
            }
        }
    }

    cout << "\n Number of page fault using FIFO Page replacement Algorithm: " << page_faults;
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

    FIFO(pages, n, capacity);

    return 0;
}

/*
22
7 0 1 2 0 3 0 4 2 3 0 3 0 3 2 1 2 0 1 7 0 1
3
*/
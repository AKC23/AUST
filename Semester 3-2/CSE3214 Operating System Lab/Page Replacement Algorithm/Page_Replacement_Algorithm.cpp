
#include <iostream>
#include <bits/stdc++.h>
using namespace std;

void FIFO(int pages[], int n, int capacity)
{
    set<int> s;// To represent set of current pages. We use a set so that we quickly check if a page is present in set or not
    vector<int> Q; // To store the pages in FIFO manner
    vector<int>::iterator it;

    int page_faults = 0; // Start from initial page
    for (int i = 0; i < n; i++)
    {
        // Check if the set can hold more pages
        if (s.size() < capacity)
        {
            // Insert it into set if not present already which represents page fault
            // Return Value: The function returns an iterator which points to the element which is searched in the set container. If the element is not found, then the iterator points to the position just after the last element in the set.
            if (s.find(pages[i]) == s.end())
            {
                s.insert(pages[i]); // Insert the current page into the set
                page_faults++;      // increment page fault
                it = Q.end();
                Q.insert(it, pages[i]);
            }
        }

        // If the set is full then need to perform FIFO i.e. remove the first page of the queue from set and queue both and insert the current page
        else
        {
            if (s.find(pages[i]) == s.end()) // Check if current page is not already present in the set
            {
                int val = Q.front(); // Store the first page in the queue to be used to find and erase the page from the set
                // Q.pop();             // Pop the first page from the queue
                it = Q.begin();
                Q.erase(it);
                s.erase(val);       // Remove the Q page from the set
                s.insert(pages[i]); // insert the current page in the set
                it = Q.end();
                Q.insert(it, pages[i]);// push the current page into the queue
                page_faults++; // Increment page faults
            }
        }
    }

    cout << "\nNumber of page fault using FIFO Page replacement Algorithm: "<<page_faults;
    double percentage = (page_faults * 100) / n;
    cout << "\nPage Fault Rate: ";
    cout << setprecision(2) <<percentage <<"%";
}

void LRU(int pages[], int n, int capacity)
{
    vector<int> q;
    int count = 0;
    int page_faults = 0;
    vector<int>::iterator itr;
    q.clear();

    for (int k = 0; k < n; k++)
    {
        int i = pages[k];
        itr = find(q.begin(), q.end(), i); // Insert it into set if not present already which represents page fault
        if (itr == q.end())
        {
            ++page_faults;
            if (q.size() == capacity) // Check if the set can hold equal pages
            {
                q.erase(q.begin());
                q.push_back(i);
            }
            else
            {
                q.push_back(i);
            }
        }
        else
        {   //if data already exist
            q.erase(itr);   // Remove the indexes page
            q.push_back(i); // insert the current page
        }
    }

    cout << "\nNumber of page fault using Least Recently Used Page replacement Algorithm:: " << page_faults;

    double percentage = (page_faults * 100) / n;
    cout << "\nPage Fault Rate: ";
    cout << setprecision(2) <<percentage <<"%";
    
}

// Function to check whether a page exists in a Qame or not
bool search(int key, vector<int> &Q)
{
    for (int i = 0; i < Q.size(); i++)
        if (Q[i] == key)
            return true;
    return false;
}

// Function to find the frame that will not be used recently in future after given index in pg[0..pn-1]
int predict(int pg[], vector<int> &Q, int pn, int index)
{

    int res = -1, farthest = index; // Store the index of pages which are going to be used recently in future
    for (int i = 0; i < Q.size(); i++)
    {
        int j;
        for (j = index; j < pn; j++)
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

        // If a page is never referenced in future, return it.
        if (j == pn)
            return i;
    }

    return (res == -1) ? 0 : res; // If all of the frames were not in future, return any of them, we return 0. Otherwise we return res.
}

void Optimal(int pg[], int pn, int capacity)
{

    vector<int> Q; // Create an array for given number offrames and initialize it as empty.

    // Traverse through page reference array and check for miss and hit.
    int hit = 0;
    for (int i = 0; i < pn; i++)
    {
        if (search(pg[i], Q)) // Page found in a frame : HIT
        {
            hit++;
            continue;
        }
        // Page not found in a frame : MISS
        // If there is space available in frames.
        if (Q.size() < capacity)
        {
            Q.push_back(pg[i]);
        }
        else // Find the page to be replaced.
        {
            int j = predict(pg, Q, pn, i + 1);
            Q[j] = pg[i];
        }
    }
    // cout << "\nNo. of hits = " << hit << endl;
    // cout << "\nNo. of misses = " << pn - hit << endl;
    cout << "\nNumber of page fault using Optimal Page replacement Algorithm:: " << pn - hit;

    double percentage = ((pn - hit) * 100) / pn;
    cout << "\nPage Fault Rate: ";
    cout << setprecision(2) <<percentage <<"%";
}

int main()
{
    int n, capacity;
    cout << "Number of pages: ";
    cin >> n;
    int pages[n];
    cout << "\nReference String: ";
    for (int i = 0; i < n; i++)
    {
        cin >> pages[i];
    }

    cout << "\nNumber of Memory Page Frame: ";
    cin >> capacity;

    FIFO(pages, n, capacity);
     
    Optimal(pages, n, capacity);
    LRU(pages, n, capacity);

    return 0;
}

/*
22
7 0 1 2 0 3 0 4 2 3 0 3 0 3 2 1 2 0 1 7 0 1
3

28
0 15 4 2 12 0 1 7 9 7 15 0 4 7 10 5 21 3 11 5 1 21 15 1 17 12 9 7
3

30
15 1 4 22 14 10 1 7 9 7 25 10 4 7 10 5 21 3 11 5 11 21 15
1 17 22 19 21 7 9
4

*/

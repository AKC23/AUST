#include <bits/stdc++.h>
using namespace std;

vector<int> myVec;
int count, page_faults;
vector<int>::iterator itr;

void printVec(vector<int> &a, int size)
{
    for (int i = 0; i < size; i++)
    {
        cout << a.at(i) << " ";
    }
    cout << "\n";
}

void Find_Element(vector<int> &myVec, int size, int pages[], vector<int>::iterator itr)
{
    int index = itr - myVec.begin();

    if (index == 1)
    {
        swap(myVec[0], myVec[1]);
        printVec(myVec, myVec.size());
    }
    else if (index = 2)
    {
        rotate(myVec.begin(), myVec.begin() + index, myVec.end());
        printVec(myVec, myVec.size());
    }
}

void Push_And_Rotate(vector<int> &myVec, int pages[], int i)
{
    myVec.push_back(pages[i]);
    rotate(myVec.rbegin(), myVec.rbegin() + 1, myVec.rend());
    printVec(myVec, myVec.size());
}

void LRU_Stack(int pages[], int n, int capacity)
{
    for (int i = 0; i < n; i++)
    {
        if (myVec.size() < capacity)
        {
            itr = find(myVec.begin(), myVec.end(), pages[i]);
            if (itr != myVec.end())
            {
                int index = itr - myVec.begin();
                if (index != 0)
                {
                    Find_Element(myVec, n, pages, itr);
                }
            }
            else
            {
                Push_And_Rotate(myVec, pages, i);
            }
        }
        else
        {
            itr = find(myVec.begin(), myVec.end(), pages[i]);
            if (itr != myVec.end())
            {
                
                Find_Element(myVec, n, pages, itr);
            }
            else
            {
                myVec.pop_back();
                Push_And_Rotate(myVec, pages, i);
            }
        }
    }
}
int main()
{
    int n, capacity;
    cout << "Number of pages: ";
    cin >> n;
    int pages[n];
    cout << "Reference String: ";
    for (int i = 0; i < n; i++)
    {
        cin >> pages[i];
    }

    cout << "Number of Memory Page Frame: ";
    cin >> capacity;
    cout << "Output: \n";
    LRU_Stack(pages, n, capacity);
    return 0;
}

/*
Number of pages: 22
Reference String : 7 0 1 2 0 3 0 4 2 3 0 3 0 3 2 1 2 0 1 7 0 1
Number of memory page frame: 3

22
7 0 1 2 0 3 0 4 2 3 0 3 0 3 2 1 2 0 1 7 0 1
3

6
7 7 0 7 3 0
3

6 
7 7 7 7 7 7 
3
*/

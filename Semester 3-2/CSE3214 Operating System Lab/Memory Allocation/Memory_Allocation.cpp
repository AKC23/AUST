#include <bits/stdc++.h>
using namespace std;

vector<int> extractIntegerWords(string str)
{
    vector<int> numbers;
    stringstream ss;
    ss << str;
    string temp;
    int found;
    while (!ss.eof())
    {
        ss >> temp;
        if (stringstream(temp) >> found)
            numbers.push_back(found);
        temp = "";
    }
    return numbers;
}

/* Allocate the first hole that is big enough to fit the request */
void First_Fit_Allocation(vector<int> holes, vector<int> requests)
{
    int calculationMatrix[holes.size() + 1][requests.size() + 1];
    for (int i = 0; i < requests.size(); i++)
    {
        calculationMatrix[0][i] = requests.at(i);
    }

    for (int i = 0; i < holes.size(); i++)
    {
        calculationMatrix[i + 1][0] = holes.at(i);
    }

    for (int i = 1; i <= holes.size(); i++)
    {
        for (int j = 1; j < requests.size(); j++)
        {
            calculationMatrix[i][j] = 0;
        }
    }

    int diff;
    int rq = 0;
    int changeIndex;
    bool rqflag;
    bool exfrag = false;
    int exfragsum = 0;
    while (rq < requests.size())
    {
        rqflag = true;
        for (int i = 1; i <= holes.size(); i++)
        {
            diff = calculationMatrix[i][rq] - requests.at(rq);
            if (diff >= 0)
            {
                rqflag = false;
                calculationMatrix[i][rq] = diff;
                break;
            }
        }
        if (rqflag)
        {
            for (int i = 1; i <= holes.size(); i++)
            {
                exfragsum += calculationMatrix[i][rq];
                calculationMatrix[i][rq] = 0;
            }
            exfrag = true;
            break;
        }
        for (int i = 1; i <= holes.size(); i++)
        {
            calculationMatrix[i][rq + 1] = calculationMatrix[i][rq];
        }
        rq++;
    }
    cout << "-----------------\nFirst Fit Memory Allocation:" << endl;
    for (int i = 0; i <= holes.size(); i++)
    {
        for (int j = 0; j < requests.size(); j++)
            cout << calculationMatrix[i][j] << "\t";
        cout << endl;
    }
    if (exfrag)
    {
        cout << "External Fragmentation : " << exfragsum << endl;
    }
    else
    {
        cout << "No External Fragmentation" << endl;
    }
}

// Allocate the smallest hole that is big enough; must search entire list, (unordered list by size)
void Best_Fit_Allocation(vector<int> holes, vector<int> requests)
{
    int calculationMatrix[holes.size() + 1][requests.size() + 1];
    for (int i = 0; i < requests.size(); i++)
        calculationMatrix[0][i] = requests.at(i);
    for (int i = 0; i < holes.size(); i++)
        calculationMatrix[i + 1][0] = holes.at(i);

    for (int i = 1; i <= holes.size(); i++)
        for (int j = 1; j < requests.size(); j++)
            calculationMatrix[i][j] = 0;

    int diff[holes.size() + 1];
    int rq = 0;
    bool rqflag;
    bool exfrag = false;
    int exfragsum = 0;
    while (rq < requests.size())
    {
        for (int i = 1; i <= holes.size(); i++)
            diff[i - 1] = calculationMatrix[i][rq] - requests.at(rq);
        rqflag = true;
        int minIndex = holes.size();
        diff[minIndex] = INT_MAX;
        for (int i = 0; i < holes.size(); i++)
        {
            if (diff[minIndex] > diff[i] && diff[i] >= 0)
            {
                minIndex = i;
            }
        }

        if (diff[minIndex] == INT_MAX)
        {
            for (int i = 1; i <= holes.size(); i++)
            {
                exfragsum += calculationMatrix[i][rq];
                calculationMatrix[i][rq] = 0;
            }
            exfrag = true;
            break;
        }
        calculationMatrix[minIndex + 1][rq] = diff[minIndex];
        for (int i = 1; i <= holes.size(); i++)
        {
            calculationMatrix[i][rq + 1] = calculationMatrix[i][rq];
        }
        rq++;
    }
    cout << "-----------------\nBest Fit Memory Allocation:" << endl;
    for (int i = 0; i <= holes.size(); i++)
    {
        for (int j = 0; j < requests.size(); j++)
            cout << calculationMatrix[i][j] << "\t";
        cout << endl;
    }
    if (exfrag)
    {
        cout << "External Fragmentation : " << exfragsum << endl;
    }
    else
    {
        cout << "No External Fragmentation" << endl;
    }
}

// Allocate the largest hole; must also search entire list.
void Worst_Fit_Allocation(vector<int> holes, vector<int> requests)
{
    int calculationMatrix[holes.size() + 1][requests.size() + 1];
    for (int i = 0; i < requests.size(); i++)
    {
        calculationMatrix[0][i] = requests.at(i);
    }

    for (int i = 0; i < holes.size(); i++)
    {
        calculationMatrix[i + 1][0] = holes.at(i);
    }

    for (int i = 1; i <= holes.size(); i++)
    {
        for (int j = 1; j < requests.size(); j++)
        {
            calculationMatrix[i][j] = 0;
        }
    }

    int diff[holes.size() + 1];
    int rq = 0;
    bool rqflag;
    bool exfrag = false;
    int exfragsum = 0;
    while (rq < requests.size())
    {
        for (int i = 1; i <= holes.size(); i++)
            diff[i - 1] = calculationMatrix[i][rq] - requests.at(rq);
        rqflag = true;
        int minIndex = holes.size();
        diff[minIndex] = INT_MIN;
        for (int i = 0; i < holes.size(); i++)
        {
            if (diff[minIndex] < diff[i] && diff[i] >= 0)
            {
                minIndex = i;
            }
        }

        if (diff[minIndex] == INT_MIN)
        {
            for (int i = 1; i <= holes.size(); i++)
            {
                exfragsum += calculationMatrix[i][rq];
                calculationMatrix[i][rq] = 0;
            }
            exfrag = true;
            break;
        }
        calculationMatrix[minIndex + 1][rq] = diff[minIndex];
        for (int i = 1; i <= holes.size(); i++)
        {
            calculationMatrix[i][rq + 1] = calculationMatrix[i][rq];
        }
        rq++;
    }
    cout << "-----------------\nWorst Fit Memory Allocation:" << endl;
    for (int i = 0; i <= holes.size(); i++)
    {
        for (int j = 0; j < requests.size(); j++)
            cout << calculationMatrix[i][j] << "\t";
        cout << endl;
    }
    if (exfrag)
    {
        cout << "External Fragmentation : " << exfragsum << endl;
    }
    else
    {
        cout << "No External Fragmentation" << endl;
    }
}

int main()
{
    vector<int> holes, requests;
    string s;
    getline(cin, s);

    holes = extractIntegerWords(s);

    getline(cin, s);
    requests = extractIntegerWords(s);

    First_Fit_Allocation(holes, requests);
    Best_Fit_Allocation(holes, requests);
    Worst_Fit_Allocation(holes, requests);
}

/*
Input:

Memory Holes 50 200 70 115 15
Memory Requests 100 10 35 15 23 6 25 55 88 40
-----------------

Output

First Fit Memory Allocation:
100     10      35      15      23      6       25      55      88      40
50      40      5       5       5       5       5       5       5       0
100     100     100     85      62      56      31      31      31      0
70      70      70      70      70      70      70      15      15      0
115     115     115     115     115     115     115     115     27      0
15      15      15      15      15      15      15      15      15      0
External Fragmentation : 93
-----------------
Best Fit Memory Allocation:
100     10      35      15      23      6       25      55      88      40
50      50      15      0       0       0       0       0       0       0
200     200     200     200     200     200     200     145     57      17
70      70      70      70      47      47      22      22      22      22
15      5       5       5       5       5       5       5       5       5
15      15      15      15      15      9       9       9       9       9
No External Fragmentation
-----------------
Worst Fit Memory Allocation:
100     10      35      15      23      6       25      55      88      40
50      50      50      50      50      50      50      50      0       0
100     100     100     85      62      62      62      62      0       0
70      70      70      70      70      64      64      9       0       0
115     105     70      70      70      70      45      45      0       0
15      15      15      15      15      15      15      15      0       0
External Fragmentation : 181



*/
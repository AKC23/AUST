#include <bits/stdc++.h>
using namespace std;

#define RESOURCES 3
#define MX 50

struct processStructure
{
    int id;
    int allocation[RESOURCES];
    int maxx[RESOURCES];
    int need[RESOURCES];
    bool complete = false;
};

processStructure process[MX];
int n;
int totalResources[RESOURCES];
int available[RESOURCES];
bool complete[MX];

void printt()
{

    for (int i = 0; i < RESOURCES; i++)
        cout << totalResources[i] << " ";

    cout << endl;
    for (int i = 0; i < RESOURCES; i++)
        cout << available[i] << " ";

    cout << endl;
    for (int i = 0; i < n; i++)
        cout << process[i].id << " ";
    cout << endl;

    for (int i = 0; i < n; i++)
        cout << complete[i] << " ";

    cout << "\n"
         << endl;

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < RESOURCES; j++)
        {
            cout << process[i].allocation[j] << " ";
        }
        cout << endl;
    }
    cout << endl;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < RESOURCES; j++)
        {
            cout << process[i].maxx[j] << " ";
        }
        cout << endl;
    }
    cout << endl;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < RESOURCES; j++)
        {
            cout << process[i].need[j] << " ";
        }
        cout << endl;
    }
}

void inputt()
{
    freopen("input3.txt", "r", stdin);
    for (int i = 0; i < RESOURCES; i++)
        cin >> totalResources[i];

    for (int i = 0; i < RESOURCES; i++)
        cin >> available[i];

    cin >> n;

    for (int i = 0; i < n; i++)
    {
        process[i].id = i;
        for (int j = 0; j < RESOURCES; j++)
            cin >> process[i].allocation[j];
    }

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < RESOURCES; j++)
        {
            cin >> process[i].maxx[j];
            process[i].need[j] = process[i].maxx[j] - process[i].allocation[j];
        }
    }
}

void bankerAlgo()
{
    for (int tt = 0; tt < n; tt++)
    {
        for (int i = 0; i < n; i++)
        {
            if (!complete[i])
            {
                //                if(process[i].need[0] <= available[0] && process[i].need[1] <= available[1] && process[i].need[2] <= available[2])
                //                {
                //                    cout << process[i].id << endl;
                //                    complete[i] = true;
                //                    available[0] += process[i].allocation[0];
                //                    available[1] += process[i].allocation[1];
                //                    available[2] += process[i].allocation[2];
                //                }

                bool check = true;
                for (int j = 0; j < RESOURCES; j++)
                {
                    check = check & (process[i].need[j] <= available[j]);
                }
                if (check)
                {
                    cout << process[i].id << endl;
                    complete[i] = true;
                    for (int j = 0; j < RESOURCES; j++)
                    {
                        available[j] += process[i].allocation[j];
                    }
                }
            }
        }
    }
}

void remain()
{
    for (int i = 0; i < n; i++)
    {
        if (!complete[i])
            cout << i << " needs additional resources" << endl;
    }
}
int main()
{
    inputt();
    // printt();
    bankerAlgo();
    remain();
}

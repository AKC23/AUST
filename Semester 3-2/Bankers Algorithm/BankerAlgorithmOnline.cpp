#include<bits/stdc++.h>
using namespace std;

#define RESOURCES 10
#define MX 10

struct processStructure
{
    char id;
    int allocation[RESOURCES];
    int need[RESOURCES];
};

processStructure process[MX];
int n, resources;
int totalResources[RESOURCES];
int available[RESOURCES];
bool complete[MX];
string safeState = "";


int main()
{
    freopen("in.txt", "r", stdin);
    cin >> n >> resources;


    for(int i = 0 ; i < resources ; i++)
        cin >> totalResources[i];

    for(int i = 0 ; i < resources ; i++)
        cin >> available[i];

    for(int i = 0 ; i < n ; i++)
    {
        cin >> process[i].id;
        for(int j = 0 ; j < resources ; j++)
            cin >> process[i].allocation[j];
    }

    for(int i = 0 ; i < n ; i++)
    {
        for(int j = 0 ; j < resources ; j++)
        {
            cin >>process[i].need[j];
        }
    }

    ///printt();

    for(int i = 0 ; i < n ; i++)
    {
        if(!complete[i])
        {
            bool check = true;
            for(int j = 0 ; j < resources ; j++)
            {
                check = check & (process[i].need[j] <= available[j]);
            }
            if(check)
            {
                safeState += process[i].id ;
                safeState += " ";
                complete[i] = true;
                for(int j = 0 ; j < resources ; j++)
                {
                    available[j] += process[i].allocation[j];
                }
            }
        }
    }

    for(int i = 0 ; i < n ; i++)
    {
        if(!complete[i])
        {
            cout << "This is not a safe state" << endl;
            return 0;
        }
    }

    cout << "Safe State is " << safeState << endl;

}


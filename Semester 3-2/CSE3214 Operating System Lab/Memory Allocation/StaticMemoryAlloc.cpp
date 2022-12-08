#include<bits/stdc++.h>
using namespace std;
#define MX 100


struct bInfo
{
    int id;
    int sz;
    bool taken;
};

bool cmp(const bInfo &lhs, const bInfo &rhs)
{
    return lhs.sz > rhs.sz;
}

bool cmp2(const bInfo &lhs, const bInfo &rhs)
{
    return lhs.sz < rhs.sz;
}

bInfo blockInfo[MX];
int nBlock;
int nFile;
int blockSize[MX];
int fileSize[MX];
int frag[MX];
bool taken[MX];

void printBlockInfo()
{
    for(int i = 0 ; i < nBlock ; i++)
    {
        cout << blockInfo[i].id << " "<< blockInfo[i].sz << " "<< blockInfo[i].taken<< endl;
    }
}

void worstFit()
{
    cout << "File\t"<< "F SZ\t"<< "Block\t"<< "B SZ\t"<< "FRAG\t" << endl;

    for(int i = 0 ; i < nFile ; i++)
    {
        for(int j = 0 ; j < nBlock ; j++)
        {
            if(!blockInfo[j].taken && blockInfo[j].sz >= fileSize[i])
            {
                cout << i+1 << "\t" << fileSize[i]<< "\t" << blockInfo[j].id << "\t";
                cout << blockInfo[j].sz << "\t" << blockInfo[j].sz - fileSize[i] << endl;
                blockInfo[j].taken = true;
                break;
            }
        }
    }

}

void bestFit()
{
    cout << "File\t"<< "F SZ\t"<< "Block\t"<< "B SZ\t"<< "FRAG\t" << endl;

    for(int i = 0 ; i < nFile ; i++)
    {
        for(int j = 0 ; j < nBlock ; j++)
        {
            if(!blockInfo[j].taken && blockInfo[j].sz >= fileSize[i])
            {
                cout << i+1 << "\t" << fileSize[i]<< "\t" << blockInfo[j].id << "\t";
                cout << blockInfo[j].sz << "\t" << blockInfo[j].sz - fileSize[i] << endl;
                blockInfo[j].taken = true;
                break;
            }
        }
    }
}
int main()
{
    ///freopen("input.txt", "r", stdin);
    cin >> nBlock >> nFile;

    for(int i = 0 ; i < nBlock ; i++)
    {
        cin >> blockSize[i];
        blockInfo[i].id = i;
        blockInfo[i].sz = blockSize[i];
        blockInfo[i].taken = false;
    }

    for(int i = 0 ; i < nFile ; i++)
    {
        cin >> fileSize[i];
    }

    sort(blockInfo, blockInfo+nBlock, cmp);
    
    ///sort(blockInfo, blockInfo+nBlock, cmp2);
    
    printBlockInfo();
    worstFit();
    bestFit();
}

/*
8
2
6 14 13 19 21 8 9 18
12 7
*/

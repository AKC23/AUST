#include <bits/stdc++.h>
using namespace std;

int main()
{
    FILE *p1;
    char c;
    int count = 1;

    p1 = fopen("Exercise1.txt", "r");

    if (!p1)
    {
        printf("\nFile can't be opened");
    }
    else
    {
        cout << count << ": ";
        while ((c = fgetc(p1)) != EOF)
        {
            cout << c;

            if (c == '\n')
            {
                count++;
                cout << count << ": ";
            }
        }
    }
    fclose(p1);

    return 0;
}
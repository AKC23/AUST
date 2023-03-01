#include <bits/stdc++.h>

using namespace std;

int main()
{
    FILE *p1;
    char c;

    p1 = fopen("Exercise1.txt", "r");

    if (!p1)
    {
        printf("\nFile can't be opened");
    }
    else
    {
        while ((c = fgetc(p1)) != EOF)
        {
            if (c == '<')
            {
                while ((c = fgetc(p1)) != '>')
                {
                    cout << c;
                }
                cout << "\n";
            }
        }
    }
    fclose(p1);

    return 0;
}
#include <bits/stdc++.h>

using namespace std;

int main()
{
    int m, n, i, j, k, l, x, y, z, Available[100];
    int Need[100][100], Allocation[100][100], Max[100][100];

    cout << "Enter the no. of processes: ";
    cin >> m;
    cout << "Enter the no. of resources: ";
    cin >> n;

    for (i = 0; i < m; i++)
    {
        cout << "Process " << i + 1 << endl;
        for (j = 0; j < n; j++)
        {
            cout << "Maximum value for resource " << j + 1 << ": ";
            cin >> k;
            Max[i][j] = k;
        }
        for (l = 0; l < n; l++)
        {
            cout << "Allocated from resource " << l + 1 << ": ";
            cin >> x;
            Allocation[i][l] = x;
        }
        cout << endl;
    }

    for (i = 0; i < n; i++)
    {
        cout << "Enter total value of available " << i + 1 << ": ";
        cin >> y;
        Available[i] = y;
    }

    for (i = 0; i < m; i++)
    {
        for (j = 0; j < n; j++)
        {
            Available[j] -= Allocation[i][j]; // Available = total_no_of_instance - Allocation
        }
    }

    int f[m], ans[m], ind = 0;
    
    for (k = 0; k < m; k++)
    {
        f[k] = 0; // All process = 0 (initialize)
    }

    for (i = 0; i < m; i++)
    {
        for (j = 0; j < n; j++)
            Need[i][j] = Max[i][j] - Allocation[i][j];
    }

    z = 0;
    for (k = 0; k < m; k++)
    {
        for (i = 0; i < m; i++)
        {
            if (f[i] == 0)
            {
                int flag = 0;
                for (j = 0; j < n; j++)
                {
                    if (Need[i][j] > Available[j])
                    {
                        flag = 1; // Process not taken
                        break;
                    }
                }

                if (flag == 0) // Process taken
                {
                    ans[ind++] = i;
                    for (z = 0; z < n; z++)
                        Available[z] += Allocation[i][z];
                    f[i] = 1; // work on process done
                    break;
                }
            }
        }
    }

    int flag = 1;

    for (int i = 0; i < m; i++)
    {
        if (f[i] == 0) // incomplete work on any process
        {
            flag = 0;
            cout << "\nThe given sequence is not safe";
            break;
        }
    }

    if (flag == 1)
    {
        cout << "\nFollowing is the safe Sequence" << endl;
        for (i = 0; i < m - 1; i++)
            cout << " P" << ans[i] + 1 << " ->";
        cout << " P" << ans[m - 1] + 1 << endl;
    }

    return (0);
}

/*

Input:
4 3
3 2 2
1 0 0

6 1 3
5 1 1

3 1 4
2 1 1

4 2 2
0 0 2

9 3 6

Output:

Enter the no. of processes: 4
Enter the no. of resources: 3
Process 1
Maximum value for resource 1:
1
Maximum value for resource 2: 2
Maximum value for resource 3: 2
Allocated from resource 1: 1
Allocated from resource 2: 0
Allocated from resource 3: 0

Process 2
Maximum value for resource 1: 6
Maximum value for resource 2: 1
Maximum value for resource 3: 3
Allocated from resource 1: 5
Allocated from resource 2: 1
Allocated from resource 3: 1

Process 3
Maximum value for resource 1: 3
Maximum value for resource 2: 1
Maximum value for resource 3: 4
Allocated from resource 1: 2
Allocated from resource 2: 1
Allocated from resource 3: 1

Process 4
Maximum value for resource 1: 4
Maximum value for resource 2: 2
Maximum value for resource 3: 2
Allocated from resource 1: 0
Allocated from resource 2: 0
Allocated from resource 3: 2

Enter total value of resource 1: 9
Enter total value of resource 2: 3
Enter total value of resource 3: 6
The given sequence is not safe




Enter the no. of processes: 7
Enter the no. of resources: 3
Process 1
Maximum value for resource 1: 9
Maximum value for resource 2: 4
Maximum value for resource 3: 5
Allocated from resource 1: 0
Allocated from resource 2: 1
Allocated from resource 3: 1

Process 2
Maximum value for resource 1: 5
Maximum value for resource 2: 7
Maximum value for resource 3: 5
Allocated from resource 1: 2
Allocated from resource 2: 3
Allocated from resource 3: 3

Process 3
Maximum value for resource 1: 7
Maximum value for resource 2: 2
Maximum value for resource 3: 8
Allocated from resource 1: 3
Allocated from resource 2: 0
Allocated from resource 3: 5

Process 4
Maximum value for resource 1: 8
Maximum value for resource 2: 8
Maximum value for resource 3: 6
Allocated from resource 1: 2
Allocated from resource 2: 2
Allocated from resource 3: 0

Process 5
Maximum value for resource 1: 11
Maximum value for resource 2: 4
Maximum value for resource 3: 5
Allocated from resource 1: 6
Allocated from resource 2: 1
Allocated from resource 3: 0

Process 6
Maximum value for resource 1: 4
Maximum value for resource 2: 6
Maximum value for resource 3: 3
Allocated from resource 1: 1
Allocated from resource 2: 2
Allocated from resource 3: 1

Process 7
Maximum value for resource 1: 2
Maximum value for resource 2: 9
Maximum value for resource 3: 2
Allocated from resource 1: 1
Allocated from resource 2: 1
Allocated from resource 3: 1

Enter total value of available 1: 8
Enter total value of available 2: 12
Enter total value of available 3: 6

The given sequence is not safe



7 3

9 4 5
0 1 1

5 7 5
2 3 3

7 2 8
3 0 5

8 8 6
2 2 0

11 4 5
6 1 0

4 6 3
1 2 1

2 9 2
1 1 1

23 22 17




 */
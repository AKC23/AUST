#include <bits/stdc++.h>
using namespace std;

void print_stack(stack<int> st)
{
    while (!st.empty())
    {
        cout << st.top() << " ";
        st.pop();
    }
}

void lru_stack(int n, vector<int> req)
{
    int m, i, curr, faults;
    stack<int> st, temp;
    bool found;

    m = req.size();
    faults = 0;

    for (int x : req)
    {
        found = 0;

        while (!st.empty())
        {
            curr = st.top();
            st.pop();
            if (curr == x)
                found = 1;
            else
                temp.push(curr);
        }

        if (!found && (temp.size() == n))
            temp.pop();

        while (!temp.empty())
        {
            st.push(temp.top());
            temp.pop();
        }
        st.push(x);

        cout << x << " -> ";
        print_stack(st);
        cout << "\n";
    }
}

int main()
{
    int n, m, i;

    cout << "Number of pages: ";
    cin >> n;

    cout << "Number of requests: ";
    cin >> m;

    vector<int> req(m);
    for (i = 0; i < m; ++i)
        cin >> req[i];

    cout << "\n";
    lru_stack(n, req);

    return 0;
}

/*

29
15 1 4 22 14 10 1 7 9 25 10 4 7 10 5 21 3 11 5 11 21 15 1 17 22 19 21 7 9
4

}
*/



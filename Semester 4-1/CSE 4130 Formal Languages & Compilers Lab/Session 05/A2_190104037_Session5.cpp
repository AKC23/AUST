#include <iostream>
#include <string>

using namespace std;

int pos = 0;
string input;

bool match(char expected)
{
    if (pos >= input.length() || input[pos] != expected)
    {
        return false;
    }
    pos++;
    return true;
}

bool keyword()
{
    string keywords[] = {"if", "else"};
    for (string keyword : keywords)
    {
        int len = keyword.length();
        if (input.substr(pos, len) == keyword)
        {
            pos += len;
            return true;
        }
    }
    return false;
}

bool identifier()
{
    if (!isalpha(input[pos]))
    {
        return false;
    }
    pos++;
    while (isalnum(input[pos]))
    {
        pos++;
    }
    return true;
}

bool statement()
{
    if (keyword())
    {
        if (match('('))
        {
            if (identifier())
            {
                if (match(')'))
                {
                    if (match('{'))
                    {
                        while (statement())
                            ;
                        if (match('}'))
                        {
                            return true;
                        }
                    }
                }
            }
        }
    }
    else if (identifier())
    {
        if (match('='))
        {
            if (identifier())
            {
                if (match(';'))
                {
                    return true;
                }
            }
        }
    }
    return false;
}

int main()
{
    cout << "Enter a statement: ";
    getline(cin, input);

    if (statement())
    {
        cout << "Accepted" << endl;
    }
    else
    {
        cout << "Not Accepted" << endl;
    }

    return 0;
}
/*

if (x) {
  y = x;
}

*/
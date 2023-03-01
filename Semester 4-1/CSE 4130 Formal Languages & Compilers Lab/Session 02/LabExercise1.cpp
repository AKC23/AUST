#include <bits/stdc++.h>
#include <string.h>
using namespace std;

string result;

int temp_count = 1, token_count = 1, count_semicolon = 1;
// token_count -> how many tokens in here.

bool isDelimiter(char ch)
{
    if (ch == ' ' || ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '>' || ch == ',' || ch == ';' || ch == '\'' ||
        ch == '<' || ch == '=' || ch == '(' || ch == ')' || ch == '[' || ch == ']' || ch == '{' || ch == '}')
    {
        return (true);
    }
    return (false);
}

// Returns 'true' if the character is an OPERATOR.
bool isOperator(char ch)
{
    if (ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '>' || ch == '<' || ch == '=')
        return (true);
    return (false);
}

bool validIdentifier(char *str)
{
    if (str[0] == '0' || str[0] == '1' || str[0] == '2' || str[0] == '3' || str[0] == '4' || str[0] == '5' ||
        str[0] == '6' || str[0] == '7' || str[0] == '8' || str[0] == '9')
        return (false);
    return (true);
}

bool isKeyword(char *str)
{
    if (!strcmp(str, "if") || !strcmp(str, "else") || !strcmp(str, "while") || !strcmp(str, "do") || !strcmp(str, "break") ||
        !strcmp(str, "continue") || !strcmp(str, "int") || !strcmp(str, "double") || !strcmp(str, "float") || !strcmp(str, "return") || !strcmp(str, "char") || !strcmp(str, "case") || !strcmp(str, "char") || !strcmp(str, "sizeof") || !strcmp(str, "long") || !strcmp(str, "short") || !strcmp(str, "typedef") || !strcmp(str, "switch") || !strcmp(str, "unsigned") || !strcmp(str, "void") || !strcmp(str, "static") || !strcmp(str, "struct") || !strcmp(str, "goto"))
    {
        return (true);
    }

    return (false);
}

bool isInteger(char *str)
{
    int i, len = strlen(str);

    if (len == 0)
        return (false);
    for (i = 0; i < len; i++)
    {
        if (str[i] != '0' && str[i] != '1' && str[i] != '2' && str[i] != '3' && str[i] != '4' && str[i] != '5' && str[i] != '6' && str[i] != '7' && str[i] != '8' && str[i] != '9')
            return (false);
    }
    return (true);
}

bool isRealNumber(char *str)
{
    int i, len = strlen(str);
    bool hasDecimal = false;
    
    if (len == 0)
        return (false);
    for (i = 0; i < len; i++)
    {
        if (str[i] != '0' && str[i] != '1' && str[i] != '2' && str[i] != '3' &&
            str[i] != '4' && str[i] != '5' && str[i] != '6' && str[i] != '7' && str[i] != '8' && str[i] != '9' && str[i] != '.')
            return (false);
        if (str[i] == '.' && isdigit(str[i - 1]) && isdigit(str[i + 1]) )
        //if (str[i] == '.' )
        {
            hasDecimal = true;
            
        }
    }
    return (hasDecimal);
}

char *subString(char *str, int left, int right)
{
    int i;
    char *subStr = (char *)malloc(sizeof(char) * (right - left + 2));

    for (i = left; i <= right; i++)
    {
        subStr[i - left] = str[i];
    }
    subStr[right - left + 1] = '\0';
    return (subStr);
}

void parse(char *str)
{
    bool double_operators = false;
    int left = 0, right = 0;
    int len = strlen(str);

    while (right <= len && left <= right)
    {
        if (isDelimiter(str[right]) == false)
        {
            right++;
            token_count--;
        }
        if (isDelimiter(str[right]) == true && left == right)
        {
            result += to_string(token_count);
            if (str[right] == ',' || str[right] == ';' || str[right] == '\'')
            {
                result += "[sep ";
                result += str[right];
                result += "]";

                if (str[right] == ';')
                {
                    count_semicolon++;
                }
            }
            else if (str[right] == '(' || str[right] == ')' || str[right] == '{' || str[right] == '}')
            {
                result += "[par ";
                result += str[right];
                result += "]";
            }

            if (isOperator(str[right]) == true)
            {

                if ((str[right] == '<' && str[right + 1] == '=') || (str[right] == '>' && str[right + 1] == '='))
                {
                    result += "[op ";
                    result += str[right];
                    result += str[right + 1];
                    result += "]";
                    right += 1;
                    double_operators = true;
                }
                else if (double_operators == false)
                {
                    result += "[op ";
                    result += str[right];
                    result += "]";
                }
                double_operators = false;
                token_count++;
            }
            right++;
            left = right;
            // result += to_string(token_count);
        }
        else if (isDelimiter(str[right]) == true && left != right || (right == len && left != right))
        {
            result += to_string(token_count);
            char *subStr = subString(str, left, right - 1);

            if (isKeyword(subStr) == true)
            {
                result += "[kw ";
                result += subStr;
                result += "]";
            }
            else if (isInteger(subStr) == true)
            {
                result += "[num ";
                result += subStr;
                result += "]";
            }
            else if (isRealNumber(subStr))
            {

                result += "[num ";
                result += subStr;
                result += "]";
            }
            else if (validIdentifier(subStr) == true && isDelimiter(str[right - 1]) == false)
            {
                result += "[id ";
                result += subStr;
                result += "]";
            }
            else if (validIdentifier(subStr) == false && isDelimiter(str[right - 1]) == false)
            {
                result += "[unkn ";
                result += subStr;
                result += "]";
            }
            left = right;
        }

        token_count++;
    }
    cout << "\ntoken_count: " << token_count;
    cout << "\nTotal count_semicolon: " << count_semicolon << "\n\n";
    // cout << result;
    return;
}

int main()
{
    ifstream file5("input1.txt");
    string str5, str6;
    ostringstream ss5, ss6;

    ss5 << file5.rdbuf();
    str5 = ss5.str();

    if (str5.empty())
    {
        cout << "\n\nInput file can't be opened\n\n";
    }
    else
    {
        cout << "\nDisplaying 'input1.c' file:\n\n";
        cout << str5 << "\n\n\n";
        int n = str5.length();

        char char_str[n + 1];
        strcpy(char_str, str5.c_str());
        parse(char_str);
    }

    // save result in text file
    fstream file6("output.txt", ios_base::out);
    file6 << result;

    string result2 = "\n\nTotal tokens: ";
    file6 << result2;
    // file6 << (token_count + count_semicolon);
    file6 << (token_count);
    file6.close();

    // display output from text file
    cout << "\n\nDisplaying 'output.txt' file:\n\n";
    fstream file7("output.txt", ios_base::in);
    ss6 << file7.rdbuf();
    str6 = ss6.str();
    cout << str6 << "\n";
    file6.close();

    /* cout << "After replacing: ";
    string replace1 = "id x1";
    string replace2 = "id 1";
    string s = std::regex_replace(str6, regex(replace1), replace2);
    cout << s; */

    return 0;
}
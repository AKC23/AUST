
#include <bits/stdc++.h>
using namespace std;

string result;
int temp_count = 1;

// Returns 'true' if the character is a DELIMITER.
bool isDelimiter(char ch)
{
    if (ch == ' ' || ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '>' || ch == ',' || ch == ';' || ch == '\'' ||
        ch == '<' || ch == '=' || ch == '(' || ch == ')' || ch == '[' || ch == ']' || ch == '{' || ch == '}')
    {
        return (true);
    }
    return (false);
}

bool isSeparator(char ch)
{
    if (ch == ',' || ch == ';')
        return (true);
    return (false);
}

// Returns 'true' if the character is an OPERATOR.
bool isOperator(char ch)
{
    if (ch == '+' || ch == '-' || ch == '*' ||
        ch == '/' || ch == '>' || ch == '<' ||
        ch == '=')
        return (true);
    return (false);
}

// Returns 'true' if the string is a VALID IDENTIFIER.
bool validIdentifier(char *str)
{
    if (str[0] == '0' || str[0] == '1' || str[0] == '2' ||
        str[0] == '3' || str[0] == '4' || str[0] == '5' ||
        str[0] == '6' || str[0] == '7' || str[0] == '8' ||
        str[0] == '9' || isDelimiter(str[0]) == true)
        return (false);
    return (true);
}

// Returns 'true' if the string is a KEYWORD.
bool isKeyword(char *str)
{
    if (!strcmp(str, "if") || !strcmp(str, "else") || !strcmp(str, "while") || !strcmp(str, "do") || !strcmp(str, "break") ||
        !strcmp(str, "continue") || !strcmp(str, "int") || !strcmp(str, "double") || !strcmp(str, "float") || !strcmp(str, "return") || !strcmp(str, "char") || !strcmp(str, "case") || !strcmp(str, "char") || !strcmp(str, "sizeof") || !strcmp(str, "long") || !strcmp(str, "short") || !strcmp(str, "typedef") || !strcmp(str, "switch") || !strcmp(str, "unsigned") || !strcmp(str, "void") || !strcmp(str, "static") || !strcmp(str, "struct") || !strcmp(str, "goto"))
    {
        return (true);
    }

    return (false);
}

// Returns 'true' if the string is an INTEGER.
bool isInteger(char *str)
{
    int i, len = strlen(str);

    if (len == 0)
        return (false);
    for (i = 0; i < len; i++)
    {
        if (str[i] != '0' && str[i] != '1' && str[i] != '2' && str[i] != '3' && str[i] != '4' && str[i] != '5' && str[i] != '6' && str[i] != '7' && str[i] != '8' && str[i] != '9' || (str[i] == '-' && i > 0))
            return (false);
    }
    return (true);
}

// Returns 'true' if the string is a REAL NUMBER.
bool isRealNumber(char *str)
{
    int i, len = strlen(str);
    bool hasDecimal = false;

    if (len == 0)
        return (false);
    for (i = 0; i < len; i++)
    {
        if (str[i] != '0' && str[i] != '1' && str[i] != '2' && str[i] != '3' &&
                str[i] != '4' && str[i] != '5' && str[i] != '6' && str[i] != '7' && str[i] != '8' && str[i] != '9' && str[i] != '.' ||
            (str[i] == '-' && i > 0))
            return (false);
        if (str[i] == '.')
            hasDecimal = true;
    }
    return (hasDecimal);
}

// Extracts the SUBSTRING.
char *subString(char *str, int left, int right)
{
    int i;
    char *subStr = (char *)malloc(sizeof(char) * (right - left + 2));

    for (i = left; i <= right; i++)
        subStr[i - left] = str[i];
    subStr[right - left + 1] = '\0';
    return (subStr);
}

// Parsing the input STRING.
void parse(char *str)
{

    int left = 0, right = 0;
    int len = strlen(str);

    while (right <= (len+1) && left <= right)
    {
        if (isDelimiter(str[right]) == false)
        {
            right++;
        }
        if (isDelimiter(str[right]) == true && left == right)
        {
            if (str[right] == ',' || str[right] == ';' || str[right] == '\'')
            {
                result += "[sep ";
                result += str[right];
                result += "]";
            }
            else if (str[right] == '(' || str[right] == ')')
            {
                result += "[par ";
                result += str[right];
                result += "]";
            }

            if (isOperator(str[right]) == true)
            {

                /* if ((str[right] == '<' && str[right + 1] == '=') || (str[right] == '>' && str[right + 1] == '='))
                {
                    result += "[op ";
                    result += str[right];
                    result += str[right + 1];
                    result += "]";
                    right += 1;
                    temp_count == 2;
                } */

                // printf("'%c' IS AN OPERATOR\n", str[right]);
                if (temp_count != 2)
                {
                    result += "[op ";
                    result += str[right];
                    result += "]";
                    temp_count = 3;
                }
            }
            right++;
            left = right;
            // temp_count == 1;
        }
        else if (isDelimiter(str[right]) == true && left != right || (right == len && left != right))
        {
            char *subStr = subString(str, left, right - 1);
            char subStrs[10];
            strcpy(subStrs, subStr);
            // char cx = '1.0';
            // locale loc;

            if (isKeyword(subStr) == true)
            {
                // printf("'%s' IS A KEYWORD\n", subStr);
                //  result = "[kw "+ subStr + "]";
                result += "[kw ";
                result += subStr;
                result += "]";
            }
            else if (isInteger(subStr) == true)
            {
                // printf("'%s' IS AN INTEGER\n", subStr);
                result += "[num ";
                result += subStr;
                result += "]";
            }
            // else if ( isdigit(*subStr) )
            else if (isRealNumber(subStr))
            // isdigit(subStr2)   isRealNumber (subStr)
            {
                // printf("'%s' IS A REAL NUMBER\n", subStr);
                result += "[num ";
                result += subStr;
                result += "]";
            }

            else if (validIdentifier(subStr) == true && isDelimiter(str[right - 1]) == false)
            {
                // printf("'%s' IS A VALID IDENTIFIER\n", subStr);
                result += "[id ";
                result += subStr;
                result += "]";
            }

            else if (validIdentifier(subStr) == false && isDelimiter(str[right - 1]) == false)
            {
                // printf("'%s' IS NOT A VALID IDENTIFIER\n", subStr);
                result += "[unkn ";
                result += subStr;
                result += "]";
            }
            left = right;
        }
    }
    cout << result << "\n\n";
    return;
}

int main()
{

    char str[200] = "char c; int x1, x_2; float y1, y2; x1=5; x_2= 10; y1=2.5+x1*45; y2=100.o5-x_2/3; if(y1<=y2) c='y'; else c='n';";

    parse(str); 

    return (0);
}

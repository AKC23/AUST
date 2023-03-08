/*
FLC Lab - Final Merged Code
ID                  : 190104037
Name                : Ahmadul Karim Chowdhury
Group               : A2
Section             : A
Session             : Spring 2022
Year                : 2022-2023
Semester            : 4th Year 1st Semester
Course No           : CSE 4130
Course Title        : Formal Languages & Compilers Lab
Submitted To        : Mr. Aminur Rahman & Mr. Al Hasib Mahamud
*/

#include <bits/stdc++.h>
#include <string.h>
using namespace std;

string result, str5, str6, str7;
vector<string> sym_arr;
vector<string> syntactic;
stack<char> s;

bool isDelimiter(char ch)
{
    if (ch == ' ' || ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '>' || ch == ',' || ch == ';' || ch == '\'' ||
        ch == '<' || ch == '=' || ch == '(' || ch == ')' || ch == '[' || ch == ']' || ch == '{' || ch == '}')
    {
        return (true);
    }
    return (false);
}

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
        if (str[i] == '.' && isdigit(str[i - 1]) && isdigit(str[i + 1]))
        // if (str[i] == '.' )
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

string removeComments(string str)
{
    int k = str.length();
    string result;
    bool single_comments = false;
    bool multiple_comments = false;

    for (int j = 0; j < k; j++)
    {
        if (single_comments == true && str[j] == '\n')
            single_comments = false;
        else if (multiple_comments == true && str[j] == '*' && str[j + 1] == '/')
            multiple_comments = false, j++;
        else if (single_comments || multiple_comments)
            continue;
        else if (str[j] == '/' && str[j + 1] == '/')
            single_comments = true, j++;
        else if (str[j] == '/' && str[j + 1] == '*')
            multiple_comments = true, j++;
        else
            result += str[j];
    }
    return result;
}

string parse(char *str)
{
    bool keyword, bracket, b_global;
    int serial = 1;
    keyword = bracket = false;
    // vector<string> sym_arr,key_arr, id_arr,result1;
    string key_arr, id_arr, result1;

    string var = "var";
    string func = "func";
    string var_type = "global";
    string var_type2 = var_type;
    string func_name = " ";

    bool double_operators = false;
    int left = 0, right = 0;
    int len = strlen(str);

    while (right <= len && left <= right)
    {
        // var_type = "global";
        if (isDelimiter(str[right]) == false)
        {
            right++;
        }
        if (isDelimiter(str[right]) == true && left == right)
        {
            // check separator
            if (str[right] == ',' || str[right] == ';' || str[right] == '\'')
            {
                result += "[sep ";
                result += str[right];
                result += "]";
                keyword = false;
            }
            // check parenthesis
            else if (str[right] == '(' || str[right] == ')' || str[right] == '{' || str[right] == '}')
            {
                if (str[right] == '{' || str[right] == '(')
                {
                    bracket = true;
                }
                if (str[right] == '}' || str[right] == ')')
                {
                    bracket = false;
                    func_name = "";
                }
                result += "[par ";
                result += str[right];
                result += "]";
            }
            // check operatore
            if (isOperator(str[right]) == true)
            {
                // check double operator first
                if ((str[right] == '<' && str[right + 1] == '=') || (str[right] == '>' && str[right + 1] == '='))
                {
                    result += "[op ";
                    result += str[right];
                    result += str[right + 1];
                    result += "]";
                    right += 1;
                    double_operators = true;
                }
                // check single operator
                else if (double_operators == false)
                {
                    result += "[op ";
                    result += str[right];
                    result += "]";
                }
                double_operators = false;
            }
            right++;
            left = right;
        }
        // character in middle or the last element
        else if (isDelimiter(str[right]) == true && left != right || (right == len && left != right))
        {
            char *subStr = subString(str, left, right - 1); // substring(string, position, length);

            if (isKeyword(subStr) == true)
            {
                if (!strcmp(subStr, "float") || !strcmp(subStr, "double") || !strcmp(subStr, "int"))
                {
                    keyword = true;
                    key_arr = subStr;
                }
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
                if (keyword && bracket) // keyword found before and inside the bracket
                {
                    id_arr = subStr;
                    // cout << id_arr<<" ";
                    sym_arr.push_back(id_arr);
                    // cout << var<<" ";
                    sym_arr.push_back(var);
                    // cout << key_arr<<" ";
                    sym_arr.push_back(key_arr);
                    // cout << var_type;
                    sym_arr.push_back(var_type);
                    // cout << "\n";
                }
                else if (keyword && !bracket) // keyword found before and outside the bracket
                {
                    id_arr = subStr;
                    // cout << id_arr<<" ";
                    sym_arr.push_back(id_arr);
                    if (str[right] == '(')
                    {
                        // cout << func<<" ";
                        sym_arr.push_back(func);
                        var_type2 = id_arr;
                        // cout << key_arr<<" ";
                        sym_arr.push_back(key_arr);
                        var_type = "global";
                        // cout <<var_type;
                        sym_arr.push_back(var_type);
                    }
                    else
                    {
                        // cout << var<<" ";
                        sym_arr.push_back(var);
                        // cout << key_arr<<" ";
                        sym_arr.push_back(key_arr);
                        // cout <<var_type;
                        sym_arr.push_back(var_type);
                    }

                    cout << "\n";
                    var_type = var_type2;
                }

                result += "[id ";
                result += subStr;
                result += "]";

                auto str_check = std::find(syntactic.begin(), syntactic.end(), subStr);
                if (str_check == syntactic.end())
                {
                    syntactic.push_back(subStr);
                }
            }
            else if (validIdentifier(subStr) == false && isDelimiter(str[right - 1]) == false)
            {
                result += "[unkn ";
                result += subStr;
                result += "]";
            }
            left = right;
        }
    }

    return result;
}

string modified_token_stream(string str)
{
    string newString, oldString;

    int count = 1;

    for (int i = 0; i < syntactic.size(); i++)
    {
        oldString = syntactic[i];

        newString = to_string(count);
        // cout << newString << " ";
        size_t pos = 0;
        while (pos += newString.length())
        {

            pos = str.find(oldString, pos);
            if (pos == std::string::npos)
            {
                break;
            }
            str.erase(pos, oldString.length());
            str.insert(pos, newString);
        }
        count++;
    }

    return str;
}

string only_identifiers(string str)
{
    string str5 = str;
    string substring;
    // char gap = ' ';

    vector<string> substrings = {"num ", "kw ", "op ", "par ", "sep "};

    for (const auto &substring : substrings)
    {
        size_t pos = str.find(substring);
        while (pos != std::string::npos)
        {
            str.erase(pos, substring.length());
            pos = str.find(substring);
        }
    }

    return str;
}

void Display_Symbol_Table(vector<string> sym_arr)
{
    cout << "\n\nSymbol Table\n"; // Symbol Table generation
    int count = 1;
    cout << "Sl.No.\t Name\tId Type\tData Type   Scope\n";
    cout << "  " << count << "\t";

    for (int i = 1; i < sym_arr.size() + 1; i++)
    {
        cout << sym_arr[i - 1] << "\t";
        if ((i % 4) == 0 && (i < sym_arr.size()))
        {
            cout << "\n";
            count++;
            cout << "  " << count << "\t";
        }
    }
}

bool isOpeningParen(char c)
{
    return c == '(' || c == '{';
}

bool isClosingParen(char c)
{
    return c == ')' || c == '}';
}

bool isMatch(char opening, char closing)
{
    if (opening == '(' && closing == ')')
        return true;
    if (opening == '{' && closing == '}')
        return true;
    return false;
}

void checkMisplacedParens(string line, int lineNumber)
{

    for (char c : line)
    {
        if (isOpeningParen(c))
        {
            s.push(c);
        }
        else if (isClosingParen(c))
        {
            if (s.empty() || !isMatch(s.top(), c))
            {
                str6 = str6 + "Misplaced ";
                str6 = str6 + c + " on line ";
                str6 = str6 + to_string(lineNumber);
                str6 = str6 + "\n";
                // cout << "Misplaced " << c << " on line " << lineNumber << endl;
            }
            else
            {
                s.pop();
            }
        }
    }
}

void checkSyntaxErrors(string line, int lineNumber)
{
    stack<char> s;
    map<string, int> keywords;
    string word = "";
    for (char c : line)
    {
        if (isalnum(c) || c == '_')
        {
            word += c;
            continue;
        }
        if (!word.empty())
        {
            if (keywords.count(word) == 0)
            {
                keywords[word] = 1;
            }
            else
            {
                str6 = str6 + "Duplicate keyword: ";
                str6 = str6 + word;
                str6 = str6 + " on line ";
                str6 = str6 + to_string(lineNumber);
                str6 = str6 + "\n";
                // cout << "Duplicate keyword: " << word << " on line " << lineNumber << endl;
            }
            word = "";
        }
        if (c == ';' || c == ',' || c == '.')
        {
            if (s.empty() || s.top() != c)
            {
                s.push(c);
            }
            else
            {
                str6 = str6 + "Duplicate punctuation: ";
                str6 = str6 + c;
                str6 = str6 + " on line ";
                str6 = str6 + to_string(lineNumber);
                str6 = str6 + "\n";

                // cout << "Duplicate punctuation: " << c << " on line " << lineNumber << endl;
            }
        }
    }
}

int main()
{
    ifstream file1("A2_190104037.txt");
    ifstream file2("A2_190104037.txt");
    string str1, str2, str3;
    str5 = str6 = str7 = "";
    ostringstream ss5, ss6;

    ss5 << file1.rdbuf();
    str1 = ss5.str();

    if (str1.empty())
    {
        cout << "\n\nInput file can't be opened\n\n";
    }
    else
    {
        int n = str1.length();

        char char_str[n + 1];

        str1 = removeComments(str1); // remove single and multiline comments

        // cout<<"\n\nString without comments\n"<<str5;

        str1.erase(remove(str1.begin(), str1.end(), '\t'), str1.end());
        str1.erase(remove(str1.begin(), str1.end(), '\n'), str1.end());
        // str.erase(remove(str.begin(), str.end(), ' '), str.end());
        // str1.erase(remove(str1.begin(), str1.end(), '*'), str1.end());
        str1.erase(remove(str1.begin(), str1.end(), '/'), str1.end());

        cout << "\nAfter removing extra space from 'A2_190104037.txt' file\n";
        cout << str1 << "\n";

        strcpy(char_str, str1.c_str()); // string to character
        str2 = parse(char_str);
        cout << "\nSample input based on the program fragment:\n"
             << str2;
        str2 = only_identifiers(str2);

        cout << "\n\nStep1:\n";
        cout << str2;

        cout << "\n\nStep2:\n"; // Symbol Table generation
        int count = 1;

        Display_Symbol_Table(sym_arr);

        cout << "\n\nStep3:\n";
        cout << "Modified Token Stream\n";
        str3 = modified_token_stream(str2); // Modified token stream for Syntactic Analysis:
        cout << str3;

        // Types of detected errors

        string str6;
        int lineNumber = 0;

        if (!file2.is_open())
        {
            cerr << "Error: Unable to open file." << endl;
            return 1;
        }
        else
        {
            while (getline(file2, str6))
            {
                lineNumber++;
                checkMisplacedParens(str6, lineNumber);
                checkSyntaxErrors(str6, lineNumber);
            }
        }
    }
    cout << "\n\nStep4: Types of detected errors\n";
    cout << str6;

    str5 = "\nAll outputs from file:\n";
    str5 = str5 + (str1 + "\n" + str2 + "\n" + str3 + "\n");

    result = str5 + " \n";
    result = result + str6;
    fstream file6("output.txt", ios_base::out);
    file6 << result; // save result in text file
    file6.close();

    // display output from text file
    cout << "\n\nDisplaying 'output.txt' file:\n\n";
    fstream file7("output.txt", ios_base::in);
    ss6 << file7.rdbuf();
    str7 = ss6.str();
    cout << str7 << "\n";
    file6.close();

    sym_arr.clear();
    syntactic.clear();

    return 0;
}
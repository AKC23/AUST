#include <iostream>
#include <fstream>
#include <string.h>
#include <ctype.h>
using namespace std;

char keywords[] = "int char string int double return auto breka; case const continue default do long register short signed sizeof static struct switch typedef union unsigned void volatile while double else enum extern float for goto if";
char keywordList[100];
unsigned int keywordCounter = 0;
void keywordChecker(char **);

int main()
{
    memset(keywordList, NULL, sizeof(keywordList));

    string line;

    /*input.txt has some c++ program*/
    ifstream myinputdocumnt("input.txt");

    /*output.txt will have uncommented code from input.txt and also prints Keyword List */

    ofstream myoutputdocumnt("output.txt");
    int c = 0;
    if (myinputdocumnt.is_open())
    {
        while (getline(myinputdocumnt, line))
        {
            char *newline = new char[line.length() + 1];
            strcpy(newline, line.c_str());
            for (int i = 0; i2)
            {
                strcat(keywordList, p);
                strcat(keywordList, " ");
                keywordCounter++;
            }
            p = strtok(NULL, *ptr);
        }
    }

    return 0;
}
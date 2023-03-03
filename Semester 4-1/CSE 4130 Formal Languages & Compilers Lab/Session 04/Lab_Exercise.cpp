#include <iostream>
#include <fstream>
#include <stack>
using namespace std;

bool isKeyword(string token) {
    // Add keywords here to check for duplicates
    string keywords[] = {"if", "for", "while", "do", "switch", "case", "break", "continue", "return", "default"};
    int n = sizeof(keywords) / sizeof(keywords[0]);

    for (int i = 0; i < n; i++) {
        if (token == keywords[i])
            return true;
    }
    return false;
}

bool checkDuplicateKeywords(string line) {
    string word = "";
    string prevWord = "";
    for (int i = 0; i < line.length(); i++) {
        if (line[i] == ' ' || line[i] == '\t') {
            if (word != "") {
                if (isKeyword(word) && word == prevWord) {
                    cout << "Duplicate keyword " << word << " at line\n";
                    return false;
                }
                prevWord = word;
                word = "";
            }
        } else {
            word += line[i];
        }
    }
    return true;
}

bool checkBraces(string line) {
    stack<char> s;
    for (int i = 0; i < line.length(); i++) {
        if (line[i] == '{')
            s.push('{');
        else if (line[i] == '}') {
            if (s.empty()) {
                cout << "Unbalanced curly braces at line \n";
                return false;
            }
            s.pop();
        }
    }
    if (!s.empty()) {
        cout << "Unbalanced curly braces at line \n";
        return false;
    }
    return true;
}

int main() {
    string line;
    int lineNumber = 1;
    ifstream file("input1.txt");
    if (file.is_open()) {
        while (getline(file, line)) {
            if (!checkDuplicateKeywords(line) || !checkBraces(line)) {
                cout << lineNumber << endl;
                return 0;
            }
            lineNumber++;
        }
        file.close();
    } else {
        cout << "Unable to open file\n";
        return 0;
    }
    cout << "No syntax errors found\n";
    return 0;
}

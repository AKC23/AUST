#include <iostream>
#include <string>
#include <vector>
using namespace std;

// Helper function to split the input string on whitespace
vector<string> split(string input) {
    vector<string> tokens;
    string token;
    for (char c : input) {
        if (c == ' ') {
            if (!token.empty()) {
                tokens.push_back(token);
                token.clear();
            }
        } else {
            token += c;
        }
    }
    if (!token.empty()) {
        tokens.push_back(token);
    }
    return tokens;
}

int main() {
    cout << "Step 1: After complete recognition of all the lexemes only identifiers are kept in pairs for formation of Symbol Tables." << endl;
    cout << "The token stream should look like the one as follows:" << endl;
    string input;
    getline(cin, input);
    vector<string> tokens = split(input);

    // cout<<tokens;

    cout << "Step 2: Symbol Table generation" << endl;
    cout << "Symbol Table:" << endl;
    int id = 1;
    int scope = 0;
    for (int i = 0; i < tokens.size(); i++) {
        string token = tokens[i];
        if (token == "float" || token == "double" || token == "int") {
            string type = token;
            string name = tokens[i + 1];
            cout << id << " " << name << " " << "var " << type << " " << "global" << endl;
            id++;
        }
        else if (token == "func") {
            string type = tokens[i - 1];
            string name = tokens[i + 1];
            cout << id << " " << name << " " << "func " << type << " " << "global" << endl;
            id++;
            scope++;
        }
        else if (token == "{") {
            scope++;
        }
        else if (token == "}") {
            scope--;
        }
    }
    return 0;
}

#include <bits/stdc++.h>
#include <string.h>
using namespace std;


int main() {
    ifstream file("input1.txt"); // open the file
    string line;
    int line_num = 0;
    while (getline(file, line)) { // read the file line by line
        line_num++; // increment the line number
        cout << line_num << ": " << line << endl; // print the line number and the line
    }
    file.close(); // close the file
    return 0;
}


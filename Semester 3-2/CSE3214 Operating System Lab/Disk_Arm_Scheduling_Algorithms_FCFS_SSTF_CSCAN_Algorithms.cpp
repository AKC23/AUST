/*
ID 190104037
Algorithms: FCFS, SSTF, C-SCAN
Sample input/output is given after code
*/

#include <iostream>
#include <bits/stdc++.h>
using namespace std;

FindAndErase(vector<int> &vec, int head)
{
    vector<int>::iterator it;
    it = find(vec.begin(), vec.end(), head);
    if (it != vec.end())
    {
        vec.erase(it);
    }
}

printOutput(vector<int> &vec)
{
    for (int i = 0; i < vec.size(); i++)
    {
        if (i == 0)
        {
            cout << vec[i];
        }
        else
            cout << " -> " << vec[i];
    }
    cout << "\n";
}

void FCFS(vector<int> &vec, int head, int total_head)
{
    cout << "\n/*** First Come First Serve (FCFS)  Scheduling ***\\";
    vector<int> vec2;
    vector<int>::iterator it;
    int movement, distance, temp_head;
    movement = distance = temp_head = 0;

    vec2.push_back(head);

    for (int i = 0; i < vec.size(); i++)
    {
        temp_head = vec[i];
        distance = abs(temp_head - head);
        movement = movement + distance;
        head = temp_head;
        vec2.push_back(head);
    }
    cout << "\nCylinder Serving Order: ";
    printOutput(vec2);
    cout << "Total Cylinder movement: " << movement;
}

void SSTF(vector<int> &vec, int head, int total_head)
{
    cout << "\n\n/*** SSTF (Shortest Seek time First) Scheduling ***\\";
    vector<int> vec2;
    vector<int>::iterator it;
    int minValue, movement, distance;
    minValue = movement = distance = 0;

    sort(vec.begin(), vec.end());
    vec2.push_back(head);

    for (int i = 0; i <= vec.size(); i++)
    {
        if (head < vec[i])
        {
            distance = abs(head - vec[i]);
            minValue = vec[i];
            if (distance > abs(abs(head - vec[i - 1])))
            {
                distance = abs(head - vec[i - 1]);
                minValue = vec[i - 1];
                i = 0;
            }
            movement = movement + distance;
            head = minValue;
            FindAndErase(vec, head);
            vec2.push_back(head);
        }
    }
    cout << "\nCylinder Serving Order: ";
    printOutput(vec2);

    cout << "Total Cylinder movement: " << movement;
}

void CSCAN(vector<int> &vec, int head, int total_head)
{
    cout << "\n\n/*** C-SCAN Scheduling ***\\";
    vector<int> vec2;
    vector<int>::iterator it;
    int maxValue, maxIndex, movement, dis;
    movement = dis = 0;
    total_head = total_head - 1;

    sort(vec.begin(), vec.end()); // sort before scheduling

    maxValue = vec[vec.size() - 1]; // find maxValue and maxIndex for later
    it = find(vec.begin(), vec.end(), maxValue);
    maxIndex = vec.size() - 1;
    vec2.push_back(head);

    for (int i = 0; i < vec.size(); i++)
    {
        if (head < vec[i])
        {
            dis = head - vec[i];
            movement = movement + abs(dis);
            head = vec[i];
            FindAndErase(vec, head);
            i = 0;
            vec2.push_back(head);
        }
        else if (head == maxValue) // when head is the maxValue in array, go to max Limit value and then 0
        {
            FindAndErase(vec, head);

            dis = head - total_head;
            movement = movement + abs(dis);

            head = total_head; // head = max Limit value
            vec2.push_back(head);
            head = 0; // head = 0 for new calculation
            vec2.push_back(head);
            dis = abs(head - total_head);
            movement = movement + abs(dis);

            dis = abs(head - vec[0]);
            movement = movement + abs(dis);
            head = vec[0]; // head = first element for remaining vector's element
            vec2.push_back(head);

            for (int i = 1; i <= vec.size(); i++)
            {
                dis = head - vec[i];
                movement = movement + abs(dis);
                head = vec[i];
                vec2.push_back(head);
                FindAndErase(vec, head);
            }
        }
    }
    cout << "\nCylinder serving order: ";
    printOutput(vec2);
    cout << "Total Cylinder movement: " << movement;
}

int main()
{
    int total_head, head, input, inputSize;
    cout << "Number of heads: ";
    cin >> total_head;
    cout << "Number of inputs: ";
    cin >> inputSize;
    vector<int> vec1, vec2, vec3;
    cout << "Cylinder Requests: ";

    for (int i = 0; i < inputSize; i++)
    {
        cin >> input;
        vec1.push_back(input);
    }

    cout << "Current head position: ";
    cin >> head;

    vec2 = vec3 = vec1; // 3 vector for 3 algorithms

    FCFS(vec1, head, total_head);
    SSTF(vec2, head, total_head);
    CSCAN(vec3, head, total_head);
    cout << "\n\n";
    return 0;
}

/*
Input:

200
8
176 79 34 60 92 11 41 114
50

Output:

/*** First Come First Serve (FCFS)  Scheduling ***\
Cylinder Serving Order: 50 -> 176 -> 79 -> 34 -> 60 -> 92 -> 11 -> 41 -> 114
Total Cylinder movement: 510

/*** SSTF (Shortest Seek time First) Scheduling ***\
Cylinder Serving Order: 50 -> 41 -> 34 -> 11 -> 60 -> 79 -> 92 -> 114 -> 176
Total Cylinder movement: 204

/*** C-SCAN Scheduling ***\
Cylinder serving order: 50 -> 60 -> 79 -> 92 -> 114 -> 176 -> 199 -> 0 -> 11 -> 34 -> 41
Total Cylinder movement: 389
*/

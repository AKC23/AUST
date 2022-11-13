#include <bits/stdc++.h>
/* #include <pthread.h>
#include <semaphore.h> */
#include <stdlib.h>
#include <unistd.h>
#include <cstdint>
using namespace std;

sem_t wait;
pthread_mutex_t myMutex;
int content = 1;
int numOfReader = 0;

void *Writer(void *writerNo)
{
    sem_wait(&wait);
    content = content * 2;

    printf("Writer %d modified content to: %d\n", (*((int *)writerNo)), content);
    sem_post(&wait);
}

void *Reader(void *readerNo)
{
    pthread_mutex_lock(&myMutex);
    numOfReader++;

    if (numOfReader == 1)
    {
        sem_wait(&wait);
    }
    pthread_mutex_unlock(&myMutex);
    printf("Reader %d read content as: %d\n", *((int *)readerNo), content);

    pthread_mutex_lock(&myMutex);
    numOfReader--;

    if (numOfReader == 0)
    {
        sem_post(&wait);
    }
    pthread_mutex_unlock(&myMutex);
}

int main()
{
    cout << "Reader Writer\n";
    cout << ".............\n";

    pthread_t read[5], write[5];
    pthread_mutex_init(&myMutex, NULL);
    sem_init(&wait, 0, 1);

    int arr[5] = {1, 2, 3, 4, 5};

    for (int i = 0; i < 5; i++)
    {
        pthread_create(&read[i], NULL, Reader, (void *)&arr[i]);
    }

    for (int i = 0; i < 5; i++)
    {
        pthread_create(&write[i], NULL, Writer, (void *)&arr[i]);
    }

    for (int i = 0; i < 5; i++)
    {
        pthread_join(read[i], NULL);
    }

    for (int i = 0; i < 5; i++)
    {
        pthread_join(write[i], NULL);
    }

    pthread_mutex_destroy(&myMutex);
    sem_destroy(&wait);

    return 0;
}
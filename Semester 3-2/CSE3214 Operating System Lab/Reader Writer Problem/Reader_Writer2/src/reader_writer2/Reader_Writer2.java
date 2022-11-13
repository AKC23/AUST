package reader_writer2;

import java.util.concurrent.Semaphore;

public class Reader_Writer2 {

    static int read_Count = 0;
    static Semaphore mutex = new Semaphore(1);
    static Semaphore db = new Semaphore(1);

    public static void main(String[] args) {

        Reader read = new Reader();
        Writer write = new Writer();
        Thread t1 = new Thread(read);
        t1.setName("Thread 1");
        Thread t2 = new Thread(write);
        t2.setName("Thread 2");
        Thread t3 = new Thread(read);
        t3.setName("Thread 3");
        Thread t4 = new Thread(read);
        t4.setName("Thread 4");
        Thread t5 = new Thread(write);
        t5.setName("Thread 5");

        t1.start();
        t2.start();
        t4.start();
        t3.start();
        t5.start();
    }

}

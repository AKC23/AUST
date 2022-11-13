package readerwriter;

import java.util.Scanner;
import java.util.concurrent.Semaphore;

public class ReaderWriter {

    static int read_Count = 0;
    static Semaphore mutex = new Semaphore(1);
    static Semaphore db = new Semaphore(1);

    static class Read implements Runnable {

        @Override
        public void run() {
            try {
                mutex.acquire();
//                synchronized (ReaderWriter.class) {
//                    read_Count++;
//                }
                read_Count++;
                if (read_Count == 1) {
                    db.acquire();
                }
                mutex.release();

                System.out.println(Thread.currentThread().getName() + " -> started reading");
                Thread.sleep(3000);

                mutex.acquire();
//                synchronized (ReaderWriter.class) {
//                    read_Count--;
//                }
                read_Count--;
                if (read_Count == 0) {
                    db.release();
                }
                System.out.println(Thread.currentThread().getName() + " -> left");
                mutex.release();

            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }

        }
    }

    static class Write implements Runnable {

        @Override
        public void run() {
//            System.out.println("");
            try {
                db.acquire();
                System.out.println(Thread.currentThread().getName() + " -> started writing");
                Thread.sleep(3000);
                System.out.println(Thread.currentThread().getName() + " -> stopped writing");
                db.release();
            } catch (InterruptedException e) {
                System.out.println(e.getMessage());
            }

        }
    }

    public static void main(String[] args) {

        System.out.println("Please input the number of Threads you want to create: ");
        Scanner input = new Scanner(System.in);
        int n = input.nextInt();
        
        System.out.println("Total Threads: " + n);
        
        Read read = new Read();
        Write write = new Write();

        for (int x = 0; x < n; x++) {
//            Thread temp = new Thread("Thread #" + x);
            Thread temp;
            System.out.println("Thread-" + x + " entered in the resource");
            if (x % 2 == 0) {
                temp = new Thread(read);
            } else {
                temp = new Thread(write);
            }
            temp.start();
        }

//        Read read = new Read();
//        Write write = new Write();
//        Thread t1 = new Thread(read);
//        t1.setName("Thread 1");
//        Thread t2 = new Thread(write);
//        t2.setName("Thread 2");
//        Thread t3 = new Thread(read);
//        t3.setName("Thread 3");
//        Thread t4 = new Thread(read);
//        t4.setName("Thread 4");
//        Thread t5 = new Thread(write);
//        t5.setName("Thread 5");
//
//        t1.start();
//        t2.start();
//        t4.start();
//        t3.start();
//        t5.start();
    }

}

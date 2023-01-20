/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package twothread_evenodd_sum;

import java.util.Scanner;
import java.util.concurrent.Semaphore;

/**
 *
 * @author Acer
 */
public class TwoThread_EvenOdd_Sum {

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
        int sum1,sum2;
        sum1 = sum2 = 0;
        
        System.out.println("Total Threads: " + n);
        
        Read read = new Read();
        Write write = new Write();
        
        for (int x = 0; x < n; x++) {
//            Thread temp = new Thread("Thread #" + x);
            Thread temp;
            //System.out.println("Thread-" + x + " entered in the resource");
            if (x <= 50) {
                temp = new Thread();
                sum1 = sum1 + x;
            } else {
                temp = new Thread();
                sum2 = sum2 + x;
            }
            
            temp.start();
        }
    }

}

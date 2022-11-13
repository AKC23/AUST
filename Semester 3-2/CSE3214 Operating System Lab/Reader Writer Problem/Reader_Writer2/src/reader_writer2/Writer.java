package reader_writer2;

import java.util.concurrent.Semaphore;

public class Writer implements Runnable {

    static int read_Count = 0;
    static Semaphore mutex = new Semaphore(1);
    static Semaphore db = new Semaphore(1);

    @Override
    public void run() {

        try {
            db.acquire();
            System.out.println(Thread.currentThread().getName() + " -> writing");
            Thread.sleep(800);
            System.out.println(Thread.currentThread().getName() + " -> left");
            db.release();
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }
    }
}

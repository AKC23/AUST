package reader_writer2;

import java.util.concurrent.Semaphore;

public class Reader implements Runnable {

    static int read_Count = 0;
    static Semaphore mutex = new Semaphore(1);
    static Semaphore db = new Semaphore(1);

    @Override
    public void run() {
        try {
            mutex.acquire();
            synchronized (Reader_Writer2.class) {
                read_Count++;
            }
//            read_Count++;
            if (read_Count == 1) {
                db.acquire();
            }
            mutex.release();

            System.out.println(Thread.currentThread().getName() + " -> reading");
            Thread.sleep(800);

            mutex.acquire();
            synchronized (Reader_Writer2.class) {
                read_Count--;
            }

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

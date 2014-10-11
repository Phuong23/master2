import java.util.concurrent.Callable;

public class CallablePremier implements Callable<Boolean> {
    private int n;
    public CallablePremier (String n) { this.n = new Integer(n); }
    public CallablePremier (int n) { this.n = n; }
    public Boolean call () { 
	try { Thread.sleep(3000); }
	catch (InterruptedException e) { Log.p(e); }
	return Premier.isPremier(n); 
    }
}
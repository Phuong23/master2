import java.util.concurrent.Callable;

public class CallablePremier implements Callable<Premier> {
    private Integer n;
    
    public CallablePremier (String n) { this.n = new Integer(n); }
    public CallablePremier (Integer n) { this.n = n; }
    
    public Premier call () { 
	Premier premier = new Premier(n);
	return premier; 
    }
}
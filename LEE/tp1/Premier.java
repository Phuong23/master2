public class Premier {

    public Integer n;
    public Boolean premier;

    public Premier (Integer n) {
	this.n = n;
	this.premier = Premier.isPremier(this.n);
    }

    public static Boolean isPremier (Integer n) {
	try { Thread.sleep(5000); }
	catch (InterruptedException e) { Log.p(e); }
	int k = 2;
	while (k * k <= n) {
	    if (n % k == 0) return false;
	    k ++;
	}
	return true;
    }
}
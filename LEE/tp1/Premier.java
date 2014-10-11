public class Premier {
    public static Boolean isPremier (String entier) {
	return isPremier(new Integer(entier));
    }
    public static Boolean isPremier (int n) {
	int k = 2;
	while (k * k <= n) {
	    if (n % k == 0) return false;
	    k ++;
	}
	return true;
    }
}
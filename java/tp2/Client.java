import java.net.Socket;
import java.io.IOException;

public class Client {
    
    private static int port = 33333;
    private static String host = "localhost";

    public Client () {
	Log.p("Trying to reach " + Client.host + " on port " + Client.port);
	try (
	    Socket connexionSocket = new Socket(Client.host, Client.port)
	) {
	    Log.p("Connecté !");
	}
	catch (IOException e) { Log.p(e); }
    }

    public static void main (String[] args) {
	// Launch
	new Client();
    }
}
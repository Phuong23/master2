import java.net.Socket;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.IOException;

public class Client {
    
    private static int port = 33333;
    private static String host = "localhost";

    public Client () {
	Log.p("Trying to reach " + Client.host + " on port " + Client.port);
	try (
	    Socket connexionSocket = new Socket(Client.host, Client.port);
	    PrintWriter toServer = new PrintWriter(connexionSocket.getOutputStream(), true);
	    BufferedReader fromServer = new BufferedReader(new InputStreamReader(connexionSocket.getInputStream()));
	    BufferedReader fromConsole = new BufferedReader(new InputStreamReader(System.in))
	) {
	    Log.p("Connecté !");
	    String consoleInput;
	    Thread canalServerIn = new Thread(new CanalServerIn(fromServer));
	    canalServerIn.start();
	    while ((consoleInput = fromConsole.readLine()) != null && canalServerIn.isAlive()) {
		toServer.println(consoleInput);
		if (consoleInput.equals(Config.EXIT)) { break; }
	    }
	}
	catch (IOException e) { Log.p(e); }
    }

    private class CanalServerIn implements Runnable {
	private BufferedReader fromServer; 
	public CanalServerIn (BufferedReader fromServer) { this.fromServer = fromServer; }
	
	public void run () {
	    String serverInput;
	    try {
		while ((serverInput = fromServer.readLine()) != null) {
		    Log.p(serverInput);
		}
	    }
	    catch (IOException e) { Log.p(e); }
	}
    }

    public static void main (String[] args) {
	// Launch
	new Client();
    }
}
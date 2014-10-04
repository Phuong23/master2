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
	    String consoleInput, serverInput;
	    while ((consoleInput = fromConsole.readLine()) != null) {
		if (consoleInput.equals("exit")) { throw new InterruptedException(); }
		toServer.println(consoleInput);
		serverInput = fromServer.readLine();
		if (serverInput == null) break;
		Log.p("from Server : " + serverInput);
	    }
	}
	catch (IOException e) { Log.p(e); }
	catch (InterruptedException e) {}
    }

    public static void main (String[] args) {
	// Launch
	new Client();
    }
}
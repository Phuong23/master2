import java.util.ArrayList;
import java.net.ServerSocket;
import java.net.Socket;
import java.io.IOException;

public class Server {

    private static int port = 33333;

    private ArrayList<Enseignant> enseignantsL;

    public Server () {
	this.initEnseignantsL();
	Log.p("Listen on port " + Server.port);
	try (
	    ServerSocket serverSocket = new ServerSocket(Server.port);
	    Socket clientSocket = serverSocket.accept()
	) {
	    Log.p("Client connecté !");
	}
	catch (IOException e) { Log.p(e); }
    }

    public boolean initEnseignantsL () { this.enseignantsL = new ArrayList<Enseignant>(); return true; }

    public static void main (String[] args) {
	// Launch
	new Server();
    }

}
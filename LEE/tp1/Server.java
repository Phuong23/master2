import java.util.ArrayList;
import java.net.ServerSocket;
import java.net.Socket;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.IOException;

public class Server {

    private static int port = 33333;

    private ArrayList<Enseignant> enseignantsL;

    public Server () {
	this.initEnseignantsL();
	Log.p("Listen on port " + Server.port);
	try (
	    ServerSocket serverSocket = new ServerSocket(Server.port);
	    Socket clientSocket = serverSocket.accept();
	    PrintWriter toClient = new PrintWriter(clientSocket.getOutputStream(), true); // true for autoflush
	    BufferedReader fromClient = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()))
	) {
	    Log.p("Client connecté !");
	    String clientInput;
	    int ageFound;
	    while ((clientInput = fromClient.readLine()) != null) {
		Log.p("from Client " + clientInput);
		try {
		    ageFound = this.searchWithNom(clientInput).getAge();
		    toClient.println(ageFound);
		    Log.p("to Client " + ageFound);
		}
		catch (EnseignantNotFoundException e) {
		    toClient.println("Not found");
		    Log.p("to Client : Not found");
		}
	    }
	}
	catch (IOException e) { Log.p(e); }
    }

    public Enseignant searchWithNom (String nom) throws EnseignantNotFoundException {
	for (Enseignant ens : this.enseignantsL) {
	    if (ens.getNom().compareToIgnoreCase(nom) == 0) {
		Log.p("Found : " + nom);
		return ens;
	    }
	}
	throw new EnseignantNotFoundException();
    }

    class EnseignantNotFoundException extends Exception {}; 

    public boolean initEnseignantsL () { 
	this.enseignantsL = new ArrayList<Enseignant>(); 
	this.enseignantsL.add(new Enseignant("Kadabra", 77, 1300, Grade.MCU));
	this.enseignantsL.add(new Enseignant("Ghost Dog", 33, 5000, Grade.PRAG));
	this.enseignantsL.add(new Enseignant("Cheminade", 66, 3000, Grade.BIATTS));
	return true;
    }

    public static void main (String[] args) {
	// Launch
	new Server();
    }

}
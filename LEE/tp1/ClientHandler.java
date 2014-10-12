import java.net.Socket;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ExecutionException;

public class ClientHandler implements Runnable {

    private Socket socket;
    private RequestHandler requestHandler;
    private ExecutorService adminPool;

    public ClientHandler (Socket socket, RequestHandler requestHandler, ExecutorService adminPool) {
	setSocket(socket);
	setRequestHandler(requestHandler);
	setAdminPool(adminPool);
    }

    public void run () {
	try (
	    PrintWriter toClient = new PrintWriter(getSocket().getOutputStream(), true); // true for autoflush
	    BufferedReader fromClient = new BufferedReader(new InputStreamReader(getSocket().getInputStream()))
	) {
	    Log.p("Client " + this.toString() + " connecté !");
	    String clientInput;
	    try {
		while ((clientInput = fromClient.readLine()) != null) {
		    try {
			getRequestHandler().answerTo(clientInput, toClient);
		    }
		    catch (AdminRequestException e) {
			try {
			    toClient.println(getAdminPool().submit(new AdminRequest(clientInput, getRequestHandler().getEnseignantsL())).get());
			}
			catch (InterruptedException e2) { Log.p(e2); }
			catch (ExecutionException e2) { Log.p(e2); }
		    }
		}
	    }
	    catch (ClosedClientException e) {}
	    Log.p("Client " + this.toString() + " déconnecté !");
	}
	catch (IOException e) { Log.p(e); }
    }

    public void setSocket (Socket socket) { this.socket = socket; }
    public Socket getSocket () { return socket; }

    public void setRequestHandler (RequestHandler requestHandler) { this.requestHandler = requestHandler; }
    public RequestHandler getRequestHandler () { return requestHandler; }

    public void setAdminPool (ExecutorService adminPool) { this.adminPool = adminPool; }
    public ExecutorService getAdminPool () { return adminPool; }

}
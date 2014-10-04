import java.net.Socket;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.IOException;

public class ClientHandler implements Runnable {

    private Socket socket;
    private RequestHandler requestHandler;

    public ClientHandler (Socket socket, RequestHandler requestHandler) {
	setSocket(socket);
	setRequestHandler(requestHandler);
    }

    public void run () {
	try (
	    PrintWriter toClient = new PrintWriter(getSocket().getOutputStream(), true); // true for autoflush
	    BufferedReader fromClient = new BufferedReader(new InputStreamReader(getSocket().getInputStream()))
	) {
	    Log.p("Client " + this.toString() + " connecté !");
	    String clientInput;
	    while ((clientInput = fromClient.readLine()) != null)
		toClient.println(getRequestHandler().answerTo(clientInput));
	    Log.p("Client " + this.toString() + " déconnecté !");
	}
	catch (IOException e) { Log.p(e); }
    }

    public void setSocket (Socket socket) { this.socket = socket; }
    public Socket getSocket () { return socket; }

    public void setRequestHandler (RequestHandler requestHandler) { this.requestHandler = requestHandler; }
    public RequestHandler getRequestHandler () { return requestHandler; }

}
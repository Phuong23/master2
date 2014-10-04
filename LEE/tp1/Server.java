import java.net.ServerSocket;
import java.net.Socket;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.IOException;

public class Server {

    private static int port = 33333;

    private RequestHandler requestHandler;

    public Server () {
	initRequestHandler();
	Log.p("Listen on port " + Server.port);
	
	try (
	    ServerSocket serverSocket = new ServerSocket(Server.port);
	    Socket clientSocket = serverSocket.accept();
	    PrintWriter toClient = new PrintWriter(clientSocket.getOutputStream(), true); // true for autoflush
	    BufferedReader fromClient = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()))
	) {
	    Log.p("Client connecté !");
	    String clientInput;
	    while ((clientInput = fromClient.readLine()) != null)
		toClient.println(requestHandler.answerTo(clientInput));
	}
	catch (IOException e) { Log.p(e); }
    } 

    public void initRequestHandler() { requestHandler = new RequestHandler(); }
    public RequestHandler getRequestHandler () { return requestHandler; }
    public void setRequestHandler (RequestHandler requestHandler) { this.requestHandler = requestHandler; }

}
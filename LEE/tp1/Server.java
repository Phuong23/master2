import java.net.ServerSocket;
import java.net.Socket;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Server {

    private static final int PORT = 33333, POOL_SIZE = 10;

    private RequestHandler requestHandler;
    private ExecutorService pool;

    public Server () {
	
	initRequestHandler();
	initPool();
	Log.p("Listen on port " + Server.PORT);
	
	try (ServerSocket serverSocket = new ServerSocket(Server.PORT)) {
	    while (42 == 42) 
		getPool().execute(new ClientHandler(serverSocket.accept(), getRequestHandler()));
	}
	catch (IOException e) { getPool().shutdown(); Log.p(e); }
    } 

    public void initRequestHandler() { requestHandler = new RequestHandler(); }
    public RequestHandler getRequestHandler () { return requestHandler; }
    public void setRequestHandler (RequestHandler requestHandler) { this.requestHandler = requestHandler; }

    public void initPool() { pool = Executors.newFixedThreadPool(Server.POOL_SIZE); }
    public ExecutorService getPool () { return pool; }
    public void setPool (ExecutorService pool) { this.pool = pool; }

}
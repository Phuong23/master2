import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.CompletionService;
import java.util.concurrent.ExecutorCompletionService;
import java.io.PrintWriter;

public class RequestHandler {

    private ListEnseignants enseignantsL;

    public RequestHandler () {
	this.initEnseignantsL();	
    }

    public void answerTo (String request, PrintWriter answer) throws AdminRequestException, ClosedClientException {
	String[] elements = request.split(" ", 2);
	String[] elements2;
	ExecutorService executor;

	switch (elements[0]) {
	    case Config.LIST_ACTIONS : answer.println(Config.HELP_CONTENT); break;
	    case Config.AGE : 
		try { answer.println(getEnseignantsL().searchWithNom(elements[1]).getAge()); }
		catch (EnseignantNotFoundException e) { answer.println("Enseignant non trouvé."); }
	       	break;
	    case Config.MOY_AGE : answer.println(getEnseignantsL().moyAge().toString()); break;
	    case Config.MOY_AGE_BETWEEN : 
		elements2 = elements[1].split(" ", 2);
		answer.println(getEnseignantsL().moyAgeBetweenTwoAges(elements2[0], elements2[1]).toString());
		break;
	    case Config.MOY_AGE_GRADE :
		try { answer.println(getEnseignantsL().moyAgeWithGrade(elements[1])); }
		catch (UnknownGradeException e) { answer.println("Grade inconnu."); }
		break;
	    case Config.ADD : 
		throw new AdminRequestException();
	    case Config.LIST :
		answer.println(getEnseignantsL().listEns());
		break;
	    case Config.MOD :
		throw new AdminRequestException();
	    case Config.DEL :
		throw new AdminRequestException();
	    case Config.GET :
		try { answer.println(getEnseignantsL().getEnseignant(elements[1])); }
		catch (EnseignantNotFoundException e) { answer.println("Enseignant inconnu."); }
		break;
	    case Config.PREMIER :
		// methode 1
		// answer.println(Premier.isPremier(elements[1]).toString());
		// methode 2
		executor = Executors.newSingleThreadExecutor();
		Future<Premier> futureResult = executor.submit(new CallablePremier(elements[1]));
		while (!futureResult.isDone()) {
		    answer.println("attente.."); 
		    try { Thread.sleep(1000); }
		    catch (InterruptedException e) { Log.p(e); }
		}
		try { answer.println(futureResult.get().premier.toString()); }
		catch (ExecutionException e) { Log.p(e); }
		catch (InterruptedException e) { Log.p(e); }
		break;
	    case Config.PREMIERS :
		
		elements2 = elements[1].split(" ");
		executor = Executors.newCachedThreadPool();
		CompletionService<Premier> premierDecideur = new ExecutorCompletionService<Premier>(executor);
		
		for (String s : elements2) 
		    premierDecideur.submit(new CallablePremier(s));
		
		for (int i = 0, n = elements2.length; i < n; i ++) {
		    try {
			Premier p = premierDecideur.take().get();
			if (p != null)
			    answer.println("premier " + p.n.toString() + " -> " + p.premier.toString());
		    }
		    catch (InterruptedException e) { Log.p(e); }
		    catch (ExecutionException e) { Log.p(e); }
		}
		break;
	    case Config.EXIT : throw new ClosedClientException();
	    default : 
		answer.println("Commande inconnue. Tapez " + Config.LIST_ACTIONS + ".");
	}
	
    }

    public void initEnseignantsL () { enseignantsL = new ListEnseignants(); }
    public ListEnseignants getEnseignantsL () { return enseignantsL; }
    public void setEnseignantsL (ListEnseignants enseignantsL) { this.enseignantsL = enseignantsL; }

}

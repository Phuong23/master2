public class RequestHandler {

    private ListEnseignants enseignantsL;

    private static final String ASK_AGE = "ageOf";
    private static final String LIST_ACTIONS = "help";

    public RequestHandler () {
	this.initEnseignantsL();	
    }

    public String answerTo (String request) {
	String[] requestEls = request.split(" ", 2);
	String answer = "";

	switch (requestEls[0]) {
	    case LIST_ACTIONS : answer += "help, exit, ageOf <nom>"; break;
	    case ASK_AGE : 
		try { answer += getEnseignantsL().searchWithNom(requestEls[1]).getAge(); }
		catch (EnseignantNotFoundException e) { answer += "Enseignant non trouvé."; }
		break;
	    default : 
		answer += "Commande inconnue.";
		answerTo(LIST_ACTIONS);   
	}
	return answer;
    }

    public void initEnseignantsL () { enseignantsL = new ListEnseignants(); }
    public ListEnseignants getEnseignantsL () { return enseignantsL; }
    public void setEnseignantsL (ListEnseignants enseignantsL) { this.enseignantsL = enseignantsL; }

}

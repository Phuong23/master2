public class RequestHandler {

    private ListEnseignants enseignantsL;

    private static final String AGE = "ageOf",
				LIST_ACTIONS = "help",
	                        MOY_AGE = "moyAge",
	                        MOY_AGE_SPE = "moyAgeSpecial";

    public RequestHandler () {
	this.initEnseignantsL();	
    }

    public String answerTo (String request) {
	String[] requestEls = request.split(" ", 2);
	String answer = "";

	switch (requestEls[0]) {
	    case LIST_ACTIONS : answer += "help, exit, ageOf <nom>, moyAge, moyAgeSpecial"; break;
	    case AGE : 
		try { answer += getEnseignantsL().searchWithNom(requestEls[1]).getAge(); }
		catch (EnseignantNotFoundException e) { answer += "Enseignant non trouvé."; }
		break;
	    case MOY_AGE : answer += getEnseignantsL().moyAge().toString(); break;
	    case MOY_AGE_SPE : answer += getEnseignantsL().moyAgeSpecial().toString(); break;
	    default : 
		answer += "Commande inconnue.";
		answer += answerTo(LIST_ACTIONS);
	}
	return answer;
    }

    public void initEnseignantsL () { enseignantsL = new ListEnseignants(); }
    public ListEnseignants getEnseignantsL () { return enseignantsL; }
    public void setEnseignantsL (ListEnseignants enseignantsL) { this.enseignantsL = enseignantsL; }

}

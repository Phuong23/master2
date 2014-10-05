public class RequestHandler {

    private ListEnseignants enseignantsL;

    private static final String AGE = "ageOf",
				LIST_ACTIONS = "help",
	                        MOY_AGE = "moyAge",
	                        MOY_AGE_SPE = "moyAgeSpecial",
				ADD = "add",
				LIST = "list",
				MOD = "mod",
				DEL = "del";

    public RequestHandler () {
	this.initEnseignantsL();	
    }

    public String answerTo (String request) {
	String answer = "";
	String[] requestEls = request.split(" ", 2);
	String[] elements;
	
	switch (requestEls[0]) {
	    case LIST_ACTIONS : answer += "help, exit, ageOf <nom>, moyAge, moyAgeSpecial, add <nom>:<salaire>:<age>:<grade>, list, mod <currentName>:<name>:<salaire>:<age>:<grade>, del <nom>"; break;
	    case AGE : 
		try { answer += getEnseignantsL().searchWithNom(requestEls[1]).getAge(); }
		catch (EnseignantNotFoundException e) { answer += "Enseignant non trouvé."; }
	       	break;
	    case MOY_AGE : answer += getEnseignantsL().moyAge().toString(); break;
	    case MOY_AGE_SPE : answer += getEnseignantsL().moyAgeSpecial().toString(); break;
	    case ADD : 
		elements = requestEls[1].split(":", 4);
		try { 
		    getEnseignantsL().addEnseignant(elements[0], elements[1], elements[2], elements[3]); 
		    answer += "Enseignant ajouté.";
		}
		catch (UnknownGradeException e) {
		    answer += "Grade inconnu.";
		}
		break;
	    case LIST :
		answer += getEnseignantsL().listEns();
		break;
	    case MOD :
		elements = requestEls[1].split(":", 5);
		try { 
		    getEnseignantsL().modEnseignant(elements[0], elements[1], elements[2], elements[3], elements[4]); 
		    answer += "Enseignant modifié.";
		}
		catch (EnseignantNotFoundException e) { answer += "Enseignant inconnu."; }
		catch (UnknownGradeException e) { answer += "Grade inconnu."; }
		break;
	    case DEL :
		try {
		    getEnseignantsL().delEnseignant(requestEls[1]);
		    answer += "Enseignant supprimé.";
		}
		catch (EnseignantNotFoundException e) { answer += "Enseignant inconnu"; }
		break;
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

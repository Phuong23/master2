public class RequestHandler {

    private ListEnseignants enseignantsL;

    public RequestHandler () {
	this.initEnseignantsL();	
    }

    public String answerTo (String request) throws AdminRequestException {
	String answer = "";
	String[] elements = request.split(" ", 2);
	String[] elements2;
	
	switch (elements[0]) {
	    case Config.LIST_ACTIONS : answer += Config.HELP_CONTENT; break;
	    case Config.AGE : 
		try { answer += getEnseignantsL().searchWithNom(elements[1]).getAge(); }
		catch (EnseignantNotFoundException e) { answer += "Enseignant non trouvé."; }
	       	break;
	    case Config.MOY_AGE : answer += getEnseignantsL().moyAge().toString(); break;
	    case Config.MOY_AGE_BETWEEN : 
		elements2 = elements[1].split(" ", 2);
		answer += getEnseignantsL().moyAgeBetweenTwoAges(elements2[0], elements2[1]).toString(); 
		break;
	    case Config.MOY_AGE_GRADE :
		try { answer += getEnseignantsL().moyAgeWithGrade(elements[1]); }
		catch (UnknownGradeException e) { answer += "Grade inconnu."; }
		break;
	    case Config.ADD : 
		throw new AdminRequestException();
	    case Config.LIST :
		answer += getEnseignantsL().listEns();
		break;
	    case Config.MOD :
		throw new AdminRequestException();
	    case Config.DEL :
		throw new AdminRequestException();
	    case Config.GET :
		try { answer += getEnseignantsL().getEnseignant(elements[1]); }
		catch (EnseignantNotFoundException e) { answer += "Enseignant inconnu."; }
		break;
	    default : 
		answer += "Commande inconnue.";
		answer += answerTo(Config.LIST_ACTIONS);
	}
	
	return answer;
    }

    public void initEnseignantsL () { enseignantsL = new ListEnseignants(); }
    public ListEnseignants getEnseignantsL () { return enseignantsL; }
    public void setEnseignantsL (ListEnseignants enseignantsL) { this.enseignantsL = enseignantsL; }

}

import java.util.concurrent.Callable;

public class AdminRequest implements Callable<String> {
    
    private String input;
    private String output;
    private ListEnseignants enseignantsL;
    
    public AdminRequest (String input, ListEnseignants enseignantsL) {
	setInput(input);
	setEnseignantsL(enseignantsL);
    }
    
    public String call () {
	String[] elements = getInput().split(" ", 2);
	String[] elements2;
	try {Thread.sleep(10000);}catch(InterruptedException e) { Log.p(e); }
	switch (elements[0]) {
	    case Config.ADD :
		add(elements[1].split(":", 4));
		break;
	    case Config.MOD :
		mod(elements[1].split(":", 5));
		break;
	    case Config.DEL :
		try {
		    getEnseignantsL().delEnseignant(elements[1]);
		    setOutput("Enseignant supprimé.");
		    }
		catch (EnseignantNotFoundException e) { setOutput("Enseignant inconnu"); }
		break;
	    default :
		setOutput("Erreur interne.");
		break;
	}
	return getOutput();
    }
    
    @Audit(true)
    public void add (String[] params) {
	GestionAudit.gestion(this, "add", String[].class);
	try { 
	    getEnseignantsL().addEnseignant(params[0], params[1], params[2], params[3]); 
	    setOutput("Enseignant ajouté.");
	}
	catch (UnknownGradeException e) {
	    setOutput("Grade inconnu.");
	}
    }

    @Audit(true)
    public void mod (String[] params) {
	GestionAudit.gestion(this, "mod", String[].class);
    	try { 
	    getEnseignantsL().modEnseignant(params[0], params[1], params[2], params[3], params[4]); 
	    setOutput("Enseignant modifié.");
	}
	catch (EnseignantNotFoundException e) { setOutput("Enseignant inconnu."); }
	catch (UnknownGradeException e) { setOutput("Grade inconnu."); }
    }

    private String getInput () { return input; }
    private void setInput (String input) { this.input = input; }

    private String getOutput () { return output; }
    private void setOutput (String output) { this.output = output; }

    private ListEnseignants getEnseignantsL () { return enseignantsL; }
    private void setEnseignantsL (ListEnseignants enseignantsL) { this.enseignantsL = enseignantsL; }
}
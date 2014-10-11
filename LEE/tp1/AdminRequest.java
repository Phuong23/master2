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
		elements2 = elements[1].split(":", 4);
		try { 
		    getEnseignantsL().addEnseignant(elements2[0], elements2[1], elements2[2], elements2[3]); 
		    setOutput("Enseignant ajouté.");
		}
		catch (UnknownGradeException e) {
		    setOutput("Grade inconnu.");
		}
		break;
	    case Config.MOD :
		elements2 = elements[1].split(":", 5);
		try { 
		    getEnseignantsL().modEnseignant(elements2[0], elements2[1], elements2[2], elements2[3], elements2[4]); 
		    setOutput("Enseignant modifié.");
		}
		catch (EnseignantNotFoundException e) { setOutput("Enseignant inconnu."); }
		catch (UnknownGradeException e) { setOutput("Grade inconnu."); }
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


    private String getInput () { return input; }
    private void setInput (String input) { this.input = input; }

    private String getOutput () { return output; }
    private void setOutput (String output) { this.output = output; }

    private ListEnseignants getEnseignantsL () { return enseignantsL; }
    private void setEnseignantsL (ListEnseignants enseignantsL) { this.enseignantsL = enseignantsL; }
}
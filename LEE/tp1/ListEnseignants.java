import java.util.ArrayList;

public class ListEnseignants extends ArrayList {

    private ArrayList<Enseignant> liste;

    public ListEnseignants () {
	initList();
    }

    public void addEnseignant (String nom, String salaire, String age, String grade) throws UnknownGradeException {
	addEnseignant(nom, new Integer(salaire), new Integer(age), GradeBuild.fromString(grade));
    }
    public void addEnseignant (String nom, int salaire, int age, Grade grade) {
	liste.add(new Enseignant(nom, salaire, age, grade));
    }

    public void modEnseignant (String nomOld, String nom, String salaire, String age, String grade) throws UnknownGradeException, EnseignantNotFoundException {
	modEnseignant(nomOld, nom, new Integer(salaire), new Integer(age), GradeBuild.fromString(grade));
    }
    public void modEnseignant (String nomOld, String nom, int salaire, int age, Grade grade) throws EnseignantNotFoundException {
	Enseignant ens = searchWithNom(nomOld);
	ens.setNom(nom);
	ens.setSalaire(salaire);
	ens.setGrade(grade);
    }

    public String getEnseignant (String nom) throws EnseignantNotFoundException {
	Enseignant ens = searchWithNom(nom);
	String output = 
		  "Nom : " + ens.getNom().toString() 
		+ " Age : " + (new Integer(ens.getAge())).toString()
		+ " Salaire : " + (new Integer (ens.getSalaire())).toString()
		+ " Grade : " + ens.getGrade().toString();
	return output;
    }

    public void delEnseignant (String nom) throws EnseignantNotFoundException {
	getList().remove(searchWithNom(nom));
    }

    public String listEns () {
	String answer = "";
	for (Enseignant ens : getList())
	    answer += ens.getNom() + " ";
	return answer;
    }
    
    // Search Functions
    public Enseignant searchWithNom (String nom) throws EnseignantNotFoundException {
	for (Enseignant ens : getList())
	    if (ens.getNom().compareToIgnoreCase(nom) == 0) 
		return ens;
	throw new EnseignantNotFoundException();
    }
    public ArrayList<Enseignant> searchBetweenTwoAges (int min, int max) {
	ArrayList<Enseignant> output = new ArrayList<Enseignant>();
	for (Enseignant ens : getList())
	    if (ens.getAge() >= min && ens.getAge() <= max)
		output.add(ens);
	return output;
    }
    public ArrayList<Enseignant> searchWithGrade (Grade grade) {
	ArrayList<Enseignant> output = new ArrayList<Enseignant>();
	for (Enseignant ens : getList())
	    if (ens.getGrade() == grade)
		output.add(ens);
	return output;
    }
    
    // Moyenne Functions
    public Double moyAgeOf (ArrayList<Enseignant> liste) {
        int sum = 0;
	for (Enseignant ens : liste) {
	    sum += ens.getAge();
	}
	return new Double(sum / liste.size());
    }
    public Double moyAge () { return moyAgeOf(getList()); }
    public Double moyAgeBetweenTwoAges (String min, String max) { return moyAgeOf(searchBetweenTwoAges(new Integer(min), new Integer(max))); }
    public Double moyAgeBetweenTwoAges (int min, int max) { return moyAgeOf(searchBetweenTwoAges(min, max)); }
    public Double moyAgeWithGrade (String grade) throws UnknownGradeException { return moyAgeOf(searchWithGrade(GradeBuild.fromString(grade))); }
    public Double moyAgeWithGrade (Grade grade) { return moyAgeOf(searchWithGrade(grade)); }

    // GET SET INIT
    public void initList () { 
	liste = new ArrayList<Enseignant>(); 
	liste.add(new Enseignant("Kadabra", 77, 1300, Grade.MCU));
	liste.add(new Enseignant("Ghost Dog", 33, 5000, Grade.PRAG));
	liste.add(new Enseignant("Cheminade", 66, 3000, Grade.BIATTS));
	liste.add(new Enseignant("a", 0, 1000, Grade.PU));
	liste.add(new Enseignant("b", 100, 2000, Grade.PU));
    }
    public ArrayList<Enseignant> getList () { return liste; }
    public void setList ( ArrayList<Enseignant> liste) { this.liste = liste; }

}
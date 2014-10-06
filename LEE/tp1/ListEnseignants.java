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

    public void delEnseignant (String nom) throws EnseignantNotFoundException {
	getList().remove(searchWithNom(nom));
    }

    public String listEns () {
	String answer = "";
	for (Enseignant ens : getList())
	    answer += ens.getNom() + " ";
	return answer;
    }

    public Enseignant searchWithNom (String nom) throws EnseignantNotFoundException {
	for (Enseignant ens : getList())
	    if (ens.getNom().compareToIgnoreCase(nom) == 0) 
		return ens;
	throw new EnseignantNotFoundException();
    }

    public Double moyAge () {
	int sum = 0;
	for (Enseignant ens : getList()) {
	    sum += ens.getAge();
	}
	return new Double(sum / getList().size());
    }

    public Double moyAgeSpecial () {
	int sum = 0;
	for (Enseignant ens : getList()) {
	    if (ens.getAge() >= 40 && ens.getAge() <= 60 && ens.getGrade() == Grade.PU)
		sum += ens.getAge();
	}
	return new Double(sum / getList().size());
    }

    public void initList () { 
	liste = new ArrayList<Enseignant>(); 
	liste.add(new Enseignant("Kadabra", 77, 1300, Grade.MCU));
	liste.add(new Enseignant("Ghost Dog", 33, 5000, Grade.PRAG));
	liste.add(new Enseignant("Cheminade", 66, 3000, Grade.BIATTS));
    }
    public ArrayList<Enseignant> getList () { return liste; }
    public void setList ( ArrayList<Enseignant> liste) { this.liste = liste; }

}
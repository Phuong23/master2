public class Enseignant {

    private String nom;
    private int age, salaire;
    private Grade grade;

    public Enseignant (String nom, int age, int salaire, Grade grade) {
	this.setNom(nom);
	this.setAge(age);
	this.setSalaire(salaire);
	this.setGrade(grade);
    }

    public String getNom     () { return this.nom; }
    public int    getAge     () { return this.age; }
    public int    getSalaire () { return this.salaire; }
    public Grade  getGrade   () { return this.grade; }

    public boolean setNom     (String nom)  { this.nom = nom; return true; }
    public boolean setAge     (int age)     { this.age = age; return true; }
    public boolean setSalaire (int salaire) { this.salaire = salaire; return true; }
    public boolean setGrade   (Grade grade) { this.grade = grade; return true; }

    public static void main (String[] args) {
	// Test
	new Enseignant("Olivier BODINI", 99, 4000, Grade.PU);
    }

}
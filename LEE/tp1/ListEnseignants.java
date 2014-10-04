import java.util.ArrayList;

public class ListEnseignants extends ArrayList {

    private ArrayList<Enseignant> liste;

    public ListEnseignants () {
	initList();
    }

    public Enseignant searchWithNom (String nom) throws EnseignantNotFoundException {
	for (Enseignant ens : liste)
	    if (ens.getNom().compareToIgnoreCase(nom) == 0) 
		return ens;
	throw new EnseignantNotFoundException();
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
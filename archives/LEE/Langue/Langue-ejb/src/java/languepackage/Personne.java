/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package languepackage;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author 11316834
 */
@Entity
@Table(name = "PERSONNE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Personne.findAll", query = "SELECT p FROM Personne p"),
    @NamedQuery(name = "Personne.findById", query = "SELECT p FROM Personne p WHERE p.id = :id"),
    @NamedQuery(name = "Personne.findByNom", query = "SELECT p FROM Personne p WHERE p.nom = :nom"),
    @NamedQuery(name = "Personne.findByPrenom", query = "SELECT p FROM Personne p WHERE p.prenom = :prenom"),
    @NamedQuery(name = "Personne.findByAge", query = "SELECT p FROM Personne p WHERE p.age = :age"),
    @NamedQuery(name = "Personne.findByPays", query = "SELECT p FROM Personne p WHERE p.pays = :pays"),
    @NamedQuery(name = "Personne.findByAddmail", query = "SELECT p FROM Personne p WHERE p.addmail = :addmail"),
    @NamedQuery(name = "Personne.findByTexte", query = "SELECT p FROM Personne p WHERE p.texte = :texte")})
public class Personne implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Size(max = 20)
    @Column(name = "NOM")
    private String nom;
    @Size(max = 20)
    @Column(name = "PRENOM")
    private String prenom;
    @Column(name = "AGE")
    private Integer age;
    @Column(name = "PAYS")
    private Integer pays;
    @Size(max = 256)
    @Column(name = "ADDMAIL")
    private String addmail;
    @Size(max = 100)
    @Column(name = "TEXTE")
    private String texte;
    @JoinTable(name = "N_PERSONNE_N_LANGUE", joinColumns = {
        @JoinColumn(name = "PERSONNE", referencedColumnName = "ID")}, inverseJoinColumns = {
        @JoinColumn(name = "LANGUE", referencedColumnName = "ID")})
    @ManyToMany
    private Collection<Langue> langueCollection;
    @JoinColumn(name = "ID", referencedColumnName = "ID", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Pays pays1;

    public Personne() {
    }

    public Personne(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getPays() {
        return pays;
    }

    public void setPays(Integer pays) {
        this.pays = pays;
    }

    public String getAddmail() {
        return addmail;
    }

    public void setAddmail(String addmail) {
        this.addmail = addmail;
    }

    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
    }

    @XmlTransient
    public Collection<Langue> getLangueCollection() {
        return langueCollection;
    }

    public void setLangueCollection(Collection<Langue> langueCollection) {
        this.langueCollection = langueCollection;
    }

    public Pays getPays1() {
        return pays1;
    }

    public void setPays1(Pays pays1) {
        this.pays1 = pays1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Personne)) {
            return false;
        }
        Personne other = (Personne) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "languepackage.Personne[ id=" + id + " ]";
    }
    
}

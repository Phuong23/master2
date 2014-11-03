/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityLinguiTrocBis;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 11316834
 */
@Entity
@Table(name = "COUCOU")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Coucou.findAll", query = "SELECT c FROM Coucou c"),
    @NamedQuery(name = "Coucou.findById", query = "SELECT c FROM Coucou c WHERE c.id = :id"),
    @NamedQuery(name = "Coucou.findByTexte", query = "SELECT c FROM Coucou c WHERE c.texte = :texte")})
public class Coucou implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID")
    private Integer id;
    @Size(max = 10)
    @Column(name = "TEXTE")
    private String texte;

    public Coucou() {
    }

    public Coucou(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
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
        if (!(object instanceof Coucou)) {
            return false;
        }
        Coucou other = (Coucou) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntityLinguiTrocBis.Coucou[ id=" + id + " ]";
    }
    
}

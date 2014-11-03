/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityLinguiTroc;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 11316834
 */
@Entity
@Table(name = "test")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Test.findAll", query = "SELECT t FROM Test t"),
    @NamedQuery(name = "Test.findByCle", query = "SELECT t FROM Test t WHERE t.cle = :cle"),
    @NamedQuery(name = "Test.findByTexte", query = "SELECT t FROM Test t WHERE t.texte = :texte")})
public class Test implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "cle")
    private Integer cle;
    @Size(max = 10)
    @Column(name = "texte")
    private String texte;

    public Test() {
    }

    public Test(Integer cle) {
        this.cle = cle;
    }

    public Integer getCle() {
        return cle;
    }

    public void setCle(Integer cle) {
        this.cle = cle;
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
        hash += (cle != null ? cle.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Test)) {
            return false;
        }
        Test other = (Test) object;
        if ((this.cle == null && other.cle != null) || (this.cle != null && !this.cle.equals(other.cle))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntityLinguiTroc.Test[ cle=" + cle + " ]";
    }
    
}

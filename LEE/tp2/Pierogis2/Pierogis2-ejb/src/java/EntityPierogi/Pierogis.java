/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityPierogi;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author 11316834
 */
@Entity
@Table(name = "PIEROGIS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pierogis.findAll", query = "SELECT p FROM Pierogis p"),
    @NamedQuery(name = "Pierogis.findByPieId", query = "SELECT p FROM Pierogis p WHERE p.pieId = :pieId"),
    @NamedQuery(name = "Pierogis.findByPiePrix", query = "SELECT p FROM Pierogis p WHERE p.piePrix = :piePrix")})
public class Pierogis implements Serializable {
    @OneToMany(mappedBy = "pieId")
    private Collection<Commandes> commandesCollection;
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "PIE_ID")
    private String pieId;
    @Column(name = "PIE_PRIX")
    private Integer piePrix;
    @OneToMany(mappedBy = "pieId")
    private Collection<Stocks> stocksCollection;

    public Pierogis() {
    }

    public Pierogis(String pieId) {
        this.pieId = pieId;
    }

    public String getPieId() {
        return pieId;
    }

    public void setPieId(String pieId) {
        this.pieId = pieId;
    }

    public Integer getPiePrix() {
        return piePrix;
    }

    public void setPiePrix(Integer piePrix) {
        this.piePrix = piePrix;
    }

    @XmlTransient
    public Collection<Stocks> getStocksCollection() {
        return stocksCollection;
    }

    public void setStocksCollection(Collection<Stocks> stocksCollection) {
        this.stocksCollection = stocksCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (pieId != null ? pieId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pierogis)) {
            return false;
        }
        Pierogis other = (Pierogis) object;
        if ((this.pieId == null && other.pieId != null) || (this.pieId != null && !this.pieId.equals(other.pieId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntityPierogi.Pierogis[ pieId=" + pieId + " ]";
    }

    @XmlTransient
    public Collection<Commandes> getCommandesCollection() {
        return commandesCollection;
    }

    public void setCommandesCollection(Collection<Commandes> commandesCollection) {
        this.commandesCollection = commandesCollection;
    }
    
}

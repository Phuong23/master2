/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityPierogi;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "STOCKS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Stocks.findAll", query = "SELECT s FROM Stocks s"),
    @NamedQuery(name = "Stocks.findByStoId", query = "SELECT s FROM Stocks s WHERE s.stoId = :stoId"),
    @NamedQuery(name = "Stocks.findByStoQuantite", query = "SELECT s FROM Stocks s WHERE s.stoQuantite = :stoQuantite")})
public class Stocks implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "STO_ID")
    private String stoId;
    @Column(name = "STO_QUANTITE")
    private Integer stoQuantite;
    @JoinColumn(name = "PIE_ID", referencedColumnName = "PIE_ID")
    @ManyToOne
    private Pierogis pieId;

    public Stocks() {
    }

    public Stocks(String stoId) {
        this.stoId = stoId;
    }

    public String getStoId() {
        return stoId;
    }

    public void setStoId(String stoId) {
        this.stoId = stoId;
    }

    public Integer getStoQuantite() {
        return stoQuantite;
    }

    public void setStoQuantite(Integer stoQuantite) {
        this.stoQuantite = stoQuantite;
    }

    public Pierogis getPieId() {
        return pieId;
    }

    public void setPieId(Pierogis pieId) {
        this.pieId = pieId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (stoId != null ? stoId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Stocks)) {
            return false;
        }
        Stocks other = (Stocks) object;
        if ((this.stoId == null && other.stoId != null) || (this.stoId != null && !this.stoId.equals(other.stoId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntityPierogi.Stocks[ stoId=" + stoId + " ]";
    }
    
}

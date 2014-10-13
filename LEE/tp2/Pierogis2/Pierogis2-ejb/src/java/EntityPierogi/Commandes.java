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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "COMMANDES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Commandes.findAll", query = "SELECT c FROM Commandes c"),
    @NamedQuery(name = "Commandes.findByComId", query = "SELECT c FROM Commandes c WHERE c.comId = :comId"),
    @NamedQuery(name = "Commandes.findByComQuantite", query = "SELECT c FROM Commandes c WHERE c.comQuantite = :comQuantite"),
    @NamedQuery(name = "Commandes.findByComTotal", query = "SELECT c FROM Commandes c WHERE c.comTotal = :comTotal"),
    @NamedQuery(name = "Commandes.findByComEmail", query = "SELECT c FROM Commandes c WHERE c.comEmail = :comEmail")})
public class Commandes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "COM_ID")
    private Integer comId;
    @Column(name = "COM_QUANTITE")
    private Integer comQuantite;
    @Column(name = "COM_TOTAL")
    private Integer comTotal;
    @Size(max = 20)
    @Column(name = "COM_EMAIL")
    private String comEmail;
    @JoinColumn(name = "PIE_ID", referencedColumnName = "PIE_ID")
    @ManyToOne
    private Pierogis pieId;

    public Commandes() {
    }

    public Commandes(Integer comId) {
        this.comId = comId;
    }

    public Integer getComId() {
        return comId;
    }

    public void setComId(Integer comId) {
        this.comId = comId;
    }

    public Integer getComQuantite() {
        return comQuantite;
    }

    public void setComQuantite(Integer comQuantite) {
        this.comQuantite = comQuantite;
    }

    public Integer getComTotal() {
        return comTotal;
    }

    public void setComTotal(Integer comTotal) {
        this.comTotal = comTotal;
    }

    public String getComEmail() {
        return comEmail;
    }

    public void setComEmail(String comEmail) {
        this.comEmail = comEmail;
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
        hash += (comId != null ? comId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Commandes)) {
            return false;
        }
        Commandes other = (Commandes) object;
        if ((this.comId == null && other.comId != null) || (this.comId != null && !this.comId.equals(other.comId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntityPierogi.Commandes[ comId=" + comId + " ]";
    }
    
}

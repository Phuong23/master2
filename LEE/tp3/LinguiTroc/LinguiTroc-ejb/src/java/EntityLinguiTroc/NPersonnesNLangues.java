/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityLinguiTroc;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 11316834
 */
@Entity
@Table(name = "N_PERSONNES_N_LANGUES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "NPersonnesNLangues.findAll", query = "SELECT n FROM NPersonnesNLangues n"),
    @NamedQuery(name = "NPersonnesNLangues.findByPersonneId", query = "SELECT n FROM NPersonnesNLangues n WHERE n.nPersonnesNLanguesPK.personneId = :personneId"),
    @NamedQuery(name = "NPersonnesNLangues.findByLangueId", query = "SELECT n FROM NPersonnesNLangues n WHERE n.nPersonnesNLanguesPK.langueId = :langueId")})
public class NPersonnesNLangues implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected NPersonnesNLanguesPK nPersonnesNLanguesPK;

    public NPersonnesNLangues() {
    }

    public NPersonnesNLangues(NPersonnesNLanguesPK nPersonnesNLanguesPK) {
        this.nPersonnesNLanguesPK = nPersonnesNLanguesPK;
    }

    public NPersonnesNLangues(int personneId, int langueId) {
        this.nPersonnesNLanguesPK = new NPersonnesNLanguesPK(personneId, langueId);
    }

    public NPersonnesNLanguesPK getNPersonnesNLanguesPK() {
        return nPersonnesNLanguesPK;
    }

    public void setNPersonnesNLanguesPK(NPersonnesNLanguesPK nPersonnesNLanguesPK) {
        this.nPersonnesNLanguesPK = nPersonnesNLanguesPK;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nPersonnesNLanguesPK != null ? nPersonnesNLanguesPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NPersonnesNLangues)) {
            return false;
        }
        NPersonnesNLangues other = (NPersonnesNLangues) object;
        if ((this.nPersonnesNLanguesPK == null && other.nPersonnesNLanguesPK != null) || (this.nPersonnesNLanguesPK != null && !this.nPersonnesNLanguesPK.equals(other.nPersonnesNLanguesPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntityLinguiTroc.NPersonnesNLangues[ nPersonnesNLanguesPK=" + nPersonnesNLanguesPK + " ]";
    }
    
}

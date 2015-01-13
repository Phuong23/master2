/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityLinguiTroc;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author 11316834
 */
@Embeddable
public class NPersonnesNLanguesPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "PERSONNE_ID")
    private int personneId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "LANGUE_ID")
    private int langueId;

    public NPersonnesNLanguesPK() {
    }

    public NPersonnesNLanguesPK(int personneId, int langueId) {
        this.personneId = personneId;
        this.langueId = langueId;
    }

    public int getPersonneId() {
        return personneId;
    }

    public void setPersonneId(int personneId) {
        this.personneId = personneId;
    }

    public int getLangueId() {
        return langueId;
    }

    public void setLangueId(int langueId) {
        this.langueId = langueId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) personneId;
        hash += (int) langueId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NPersonnesNLanguesPK)) {
            return false;
        }
        NPersonnesNLanguesPK other = (NPersonnesNLanguesPK) object;
        if (this.personneId != other.personneId) {
            return false;
        }
        if (this.langueId != other.langueId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "EntityLinguiTroc.NPersonnesNLanguesPK[ personneId=" + personneId + ", langueId=" + langueId + " ]";
    }
    
}

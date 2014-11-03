/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityLinguiTrocBis;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author 11316834
 */
@Stateless
public class NPersonnesNLanguesFacade extends AbstractFacade<NPersonnesNLangues> implements NPersonnesNLanguesFacadeLocal {
    @PersistenceContext(unitName = "LinguiTrocBis-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public NPersonnesNLanguesFacade() {
        super(NPersonnesNLangues.class);
    }
    
}

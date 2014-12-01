/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package languepackage;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author 11316834
 */
@Stateless
public class LangueFacade extends AbstractFacade<Langue> implements LangueFacadeLocal {
    @PersistenceContext(unitName = "Langue-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public LangueFacade() {
        super(Langue.class);
    }
    
}

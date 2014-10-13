/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityPierogi;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author 11316834
 */
@Stateless
public class StocksFacade extends AbstractFacade<Stocks> implements StocksFacadeLocal {
    @PersistenceContext(unitName = "Pierogis2-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public StocksFacade() {
        super(Stocks.class);
    }
    
    // Antoine et parisa
    
    public void create (String pierogiId, int quantite) {
        String s = "INSERT INTO STOCKS (PIE_ID, STO_QUANTITE) "
                 + "VALUES ('" + pierogiId + "', " + quantite + ")";
        em.createNativeQuery(s).executeUpdate();
    }
    
}

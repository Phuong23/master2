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
public class CommandesFacade extends AbstractFacade<Commandes> implements CommandesFacadeLocal {
    @PersistenceContext(unitName = "Pierogis2-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CommandesFacade() {
        super(Commandes.class);
    }
    
    // Antoine & Parisa
    
    public void create (String pierogiId, int quantite, int total, String email) {
        String s = "insert into commande(pizza_id,quantite,total,email) "
                 + "values ('" + pierogiId + "'," + quantite + ","
                 + total + ",'" + email + "')";
        em.createNativeQuery(s).executeUpdate();
    }
    
}

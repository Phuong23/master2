/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityPierogi;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author 11316834
 */
@Local
public interface CommandesFacadeLocal {

    void create(Commandes commandes);

    void edit(Commandes commandes);

    void remove(Commandes commandes);

    Commandes find(Object id);

    List<Commandes> findAll();

    List<Commandes> findRange(int[] range);

    int count();
    
    // Antoine Et Parisa
    void create (String pizzaId, int quantite, int total, String email);
    
}

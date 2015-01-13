/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityLinguiTroc;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author 11316834
 */
@Local
public interface PaysFacadeLocal {

    void create(Pays pays);

    void edit(Pays pays);

    void remove(Pays pays);

    Pays find(Object id);

    List<Pays> findAll();

    List<Pays> findRange(int[] range);

    int count();
    
}

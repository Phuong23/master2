/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package EntityLinguiTrocBis;

import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author 11316834
 */
@Local
public interface CoucouFacadeLocal {

    void create(Coucou coucou);

    void edit(Coucou coucou);

    void remove(Coucou coucou);

    Coucou find(Object id);

    List<Coucou> findAll();

    List<Coucou> findRange(int[] range);

    int count();
    
}

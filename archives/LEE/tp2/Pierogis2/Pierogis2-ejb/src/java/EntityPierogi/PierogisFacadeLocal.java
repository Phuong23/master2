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
public interface PierogisFacadeLocal {

    void create(Pierogis pierogis);

    void edit(Pierogis pierogis);

    void remove(Pierogis pierogis);

    Pierogis find(Object id);

    List<Pierogis> findAll();

    List<Pierogis> findRange(int[] range);

    int count();
    
}

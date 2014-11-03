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
public interface NPersonnesNLanguesFacadeLocal {

    void create(NPersonnesNLangues nPersonnesNLangues);

    void edit(NPersonnesNLangues nPersonnesNLangues);

    void remove(NPersonnesNLangues nPersonnesNLangues);

    NPersonnesNLangues find(Object id);

    List<NPersonnesNLangues> findAll();

    List<NPersonnesNLangues> findRange(int[] range);

    int count();
    
}

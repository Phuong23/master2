/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GestionClient;

import EntityPierogi.CommandesFacadeLocal;
import EntityPierogi.StocksFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Iterator;
import javax.ejb.EJB;
import EntityPierogi.Pierogis;
import EntityPierogi.PierogisFacadeLocal;
import EntityPierogi.Stocks;
import java.util.Collection;
import javax.ws.rs.NotFoundException;

/**
 *
 * @author 11316834
 */
@WebServlet(name = "Commande_Pierogi", urlPatterns = {"/Commande_Pierogi"})
public class Commande_Pierogi extends HttpServlet {
    @EJB
    private CommandesFacadeLocal commandesFacade;
    @EJB
    private PierogisFacadeLocal pierogisFacade;
    @EJB
    private StocksFacadeLocal stocksFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Commande Pierogi</title>");  
            out.println("</head>");
            out.println("<body>");
                    

            out.println("<h1>Choisissez votre pierogi : </h1>");
            String type=request.getParameter("type");
            if (type!=null && type != "") {
                
                try {
                   
                    int quantite = new Integer(request.getParameter("quantite"));             
                    String email = new String(request.getParameter("email"));
                    Pierogis pierogi = pierogisFacade.find(type);
                    
                    if (pierogi == null) {
                        out.println("Mauvais type<br />");
                        throw new NotFoundException(); 
                    }
                    
                    int total = quantite * pierogi.getPiePrix();
                    
                    // Récupérer la liste des stocks de ce type de pierogi
                    Collection<Stocks> stocks = pierogi.getStocksCollection();
                    
                    // Calculer la somme des quantités de ces stocks
                    int sommeQuantite = 0;
                    for (Stocks stock : stocks) {
                        sommeQuantite += stock.getStoQuantite();
                    }
                    
                    // Vérifier par rapport à la quantité demandée par l'user
                    if (quantite > sommeQuantite) { 
                        out.println("stocks insuffisants. Il manque : " + (quantite - sommeQuantite) + "<br />");
                    }
                    else {
                       // Effectuer la commande
                       out.println("On ajoute une commande dont le prix total est :"+total+"<br/>");
                       commandesFacade.create(type, quantite, total, email);
                       
                       // Quantité restante à enlever des stocks
                       int commandeRestant = quantite;
                       for (Stocks stock : stocks) {
                           int stoQua = stock.getStoQuantite();
                           // Si le stock actuel est suffisant
                           if (stoQua > commandeRestant) {
                                // On retire la quantité restante et on a fini
                                stock.setStoQuantite((stoQua - commandeRestant));
                                stocksFacade.edit(stock);
                                break;
                           }
                           // Sinon on vide ce stock
                           // et on passe au stock suivant
                           else {
                                commandeRestant = commandeRestant - stoQua;
                                stock.setStoQuantite(0);
                                stocksFacade.edit(stock);
                           }
                       }
                       
                       out.println("Commande effectuée !!!<br />");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            } else {
                out.println("<form method='POST'>");
                out.println("Type: <input type='text' name='type'><br/>");
                out.println("Quantité: <input type='text' name='quantite'><br/>");
                out.println("Email: <input type='text' name='email'><br/>");
                out.println("<input type='submit'><br/>");
                out.println("</form>");
            }
            List lStock = stocksFacade.findAll();
            for (Iterator it = lStock.iterator(); it.hasNext();) {
                Stocks sto = (Stocks) it.next();
                Pierogis elem = (sto.getPieId());
                out.println("Type : <b>" + elem.getPieId() + " </b> ");
                out.println("Prix : " + elem.getPiePrix() + "<br/>");
                out.println("Quantité : " + sto.getStoQuantite() + "<br/>");
            }    
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

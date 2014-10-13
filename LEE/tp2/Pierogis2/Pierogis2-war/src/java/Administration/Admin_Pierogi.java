/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Administration;

import EntityPierogi.PierogisFacadeLocal;
import EntityPierogi.Pierogis;
import EntityPierogi.StocksFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Iterator;

/**
 *
 * @author Antoine
 */
@WebServlet(name = "Admin_Pierogi", urlPatterns = {"/Admin_Pierogi"})
public class Admin_Pierogi extends HttpServlet {
    @EJB
    private StocksFacadeLocal stocksFacade;
    @EJB
    private PierogisFacadeLocal pierogisFacade;

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
            out.println("<title>Administration Pierogi</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Ajouter un nouveau type de pierogi : </h1>");
            List lPierogi = pierogisFacade.findAll();
            for (Iterator it = lPierogi.iterator(); it.hasNext();) {
                Pierogis elem = (Pierogis) it.next();
                out.println("Type : <b>" + elem.getPieId() + " </b> ");
                out.println("Prix : " + elem.getPiePrix() + "<br/>");
            }            
            String type=null;
            type=request.getParameter("type");
            if (type!=null) {
                try {
                    int prix=0;
                    prix=new Integer(request.getParameter("prix"));
                    int quantite=new Integer(request.getParameter("quantite"));             
                    out.println("On ajoute un type de pierogi<br/>");

                    Pierogis e = new Pierogis();
                    e.setPieId(type);
                    e.setPiePrix(prix);
                    pierogisFacade.create(e);
                    stocksFacade.create(type,quantite);
                    response.sendRedirect("Admin_Pierogi");

                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            out.println("Pierogi sauvegardé");
            } else {
                out.println("<form method='POST'>");
                out.println("Type: <input type='text' name='type'><br/>");
                out.println("Prix: <input type='text' name='prix'><br/>");
                out.println("Quantité: <input type='text' name='quantite'><br/>");
                out.println("<input type='submit'><br/>");
                out.println("</form>");
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

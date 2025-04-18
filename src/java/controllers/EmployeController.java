package controllers;

import entites.Departement;
import entites.Employe;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import services.EmployeService;

@WebServlet(name = "EmployeController", urlPatterns = {"/EmployeController"})
public class EmployeController extends HttpServlet {

    private EmployeService es;

    @Override
    public void init() throws ServletException {
        super.init();
        es = new EmployeService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op    = request.getParameter("op");
        String idStr = request.getParameter("id");

        if (op == null) {
            String poste    = request.getParameter("poste");
            String nom      = request.getParameter("nom");
            String prenom   = request.getParameter("prenom");
            String email    = request.getParameter("email");
            String mdp      = request.getParameter("mdp");
            String role     = "employe";  
            String depIdStr = request.getParameter("departementId");
            Departement d = null;
            if (depIdStr != null && !depIdStr.isEmpty()) {
                d = new Departement();
                d.setId(Integer.parseInt(depIdStr));
            }

            if (idStr == null || idStr.isEmpty()) {
                Employe e = new Employe(poste, nom, prenom, email, mdp, role);
                e.setDepartement(d);
                es.create(e);

            } else {
                int id = Integer.parseInt(idStr);
                Employe e = new Employe(poste, nom, prenom, email, mdp, role);
                e.setId(id);
                e.setDepartement(d);
                es.update(e);
            }

            response.sendRedirect("listeEmployes.jsp");

        } else if ("delete".equals(op)) {
            int id = Integer.parseInt(idStr);
            Employe e = es.findById(id);
            if (e != null) {
                es.delete(e);
            }
            response.sendRedirect("listeEmployes.jsp");

        } else if ("update".equals(op)) {
         
            int id = Integer.parseInt(idStr);
            Employe e = es.findById(id);
            if (e != null) {
                StringBuilder url = new StringBuilder("employeForm.jsp?");
                url.append("id=").append(e.getId())
                   .append("&poste=").append(e.getPoste())
                   .append("&nom=").append(e.getNom())
                   .append("&prenom=").append(e.getPrenom())
                   .append("&email=").append(e.getEmail())
                   .append("&mdp=").append(e.getPassword());
                if (e.getDepartement() != null) {
                    url.append("&departementId=").append(e.getDepartement().getId());
                }
                response.sendRedirect(url.toString());
                return;
            }
            response.sendRedirect("listeEmployes.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    public String getServletInfo() {
        return "Servlet de gestion des employés (CRUD)";
    }
}

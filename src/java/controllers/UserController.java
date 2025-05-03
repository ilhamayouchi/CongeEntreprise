package controllers;

import entites.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.UserService;

@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    private UserService us;

    @Override
    public void init() throws ServletException {
        super.init();
        us = new UserService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");

        if (op == null) {
            String id = request.getParameter("id");

            if (id == null || id.isEmpty()) {
                // Création d'un nouvel utilisateur
                String nom = request.getParameter("nom");
                String prenom = request.getParameter("prenom");
                String email = request.getParameter("email");
                String mdp = request.getParameter("mdp");
                String role = request.getParameter("role");

                // Mot de passe non haché (conforme à ta demande)
                us.create(new User(nom, prenom, email, mdp, role));
                response.sendRedirect("users.jsp");

            } else {
                // Mise à jour d'un utilisateur existant
                String nom = request.getParameter("nom");
                String prenom = request.getParameter("prenom");
                String email = request.getParameter("email");
                String mdp = request.getParameter("mdp");
                String role = request.getParameter("role");

                User u = new User(nom, prenom, email, mdp, role);
                u.setId(Integer.parseInt(id));
                us.update(u);
                response.sendRedirect("users.jsp");
            }

        } else if (op.equals("delete")) {
            String id = request.getParameter("id");
            us.delete(us.findById(Integer.parseInt(id)));
            response.sendRedirect("users.jsp");

        } else if (op.equals("update")) {
            String id = request.getParameter("id");
            User u = us.findById(Integer.parseInt(id));
            response.sendRedirect("user.jsp?id=" + u.getId()
                    + "&nom=" + u.getNom()
                    + "&prenom=" + u.getPrenom()
                    + "&email=" + u.getEmail()
                    + "&mdp=" + u.getPassword()
                    + "&role=" + u.getRole());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "UserController handles CRUD operations for User entity.";
    }
}

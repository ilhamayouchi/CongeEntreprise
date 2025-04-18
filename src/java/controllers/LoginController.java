package controllers;

import entites.User;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.UserService;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private UserService us;

    @Override
    public void init() throws ServletException {
        super.init();
        us = new UserService();  // Initialisation du service des utilisateurs
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("mdp");

        // Vérification de l'email dans la base de données
        List<User> utilisateurs = us.findByEmail(email);

        if (utilisateurs != null && !utilisateurs.isEmpty()) {
            User u = utilisateurs.get(0);  // Récupère le premier utilisateur trouvé

            // Vérification du mot de passe
            if (u.getPassword().equals(password)) {
                // Crée une session et redirige vers la page en fonction du rôle
                request.getSession().setAttribute("user", u);

                // Vérification du rôle de l'utilisateur
                if ("admin".equals(u.getRole())) {
                    response.sendRedirect("adminDashbord.jsp");  // Redirige vers l'admin
                } else if ("employe".equals(u.getRole())) {
                    response.sendRedirect("employe/dashboard.jsp");  // Redirige vers l'employé
                } else {
                    response.sendRedirect("users/users.jsp");  // Redirection par défaut
                }
                return;
            } else {
                // Mot de passe incorrect
                request.setAttribute("error", "Mot de passe incorrect.");
                response.sendRedirect("users/login.jsp");
            }
        } else {
            // Email non trouvé
            request.setAttribute("error", "Email non trouvé.");
            response.sendRedirect("users/login.jsp");
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
        return "Servlet de gestion de la connexion des utilisateurs.";
    }
}

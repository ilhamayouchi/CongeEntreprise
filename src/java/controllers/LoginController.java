package controllers;

import entites.User;
import entites.Employe;
import services.UserService;
import services.EmployeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private UserService userService;
    private EmployeService employeService;

    @Override
    public void init() throws ServletException {
        userService = new UserService();
        employeService = new EmployeService();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    String email = request.getParameter("email").trim();
    String password = request.getParameter("mdp").trim();
    String ctx = request.getContextPath();

    System.out.println("Tentative de connexion - Email: " + email);

    if (email.isEmpty() || password.isEmpty()) {
        response.sendRedirect(ctx + "/users/login.jsp?msg=Veuillez remplir tous les champs");
        return;
    }

    try {
        // 1. Recherche dans User (inclut Admin et Employe via héritage)
        User user = userService.findByEmail(email);
        if (user == null) {
            System.out.println("Aucun utilisateur trouvé avec cet email");
            response.sendRedirect(ctx + "/users/login.jsp?msg=Email introuvable");
            return;
        }

        // 2. Vérification du mot de passe
        if (!user.getPassword().equals(password)) {
            System.out.println("Mot de passe incorrect pour l'email: " + email);
            response.sendRedirect(ctx + "/users/login.jsp?msg=Mot de passe incorrect");
            return;
        }

        // 3. Création de la session
        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);
        session.setAttribute("type", user.getRole().toLowerCase());

        // 4. Gestion des rôles
        String role = user.getRole().toLowerCase();
        System.out.println("Connexion réussie - Rôle: " + role);

        switch (role) {
            case "admin":
                // Pas besoin de vérifier instanceof car l'héritage est géré par JPA
                session.setAttribute("admin", user);
                response.sendRedirect(ctx + "/users/adminDashbord.jsp");
                break;
                
            case "employe":
                if (user instanceof Employe) {
                    session.setAttribute("employe", (Employe) user);
                } else {
                    Employe employe = employeService.findById(user.getId());
                    if (employe == null) {
                        response.sendRedirect(ctx + "/users/login.jsp?msg=Profil employé introuvable");
                        return;
                    }
                    session.setAttribute("employe", employe);
                }
                response.sendRedirect(ctx + "/users/nemployeDashboard.jsp");
                break;

            default:
                System.out.println("Rôle non reconnu: " + role);
                response.sendRedirect(ctx + "/users/login.jsp?msg=Rôle non autorisé");
        }

    } catch (Exception e) {
        System.err.println("Erreur lors de la connexion: " + e.getMessage());
        e.printStackTrace();
        response.sendRedirect(ctx + "/users/login.jsp?msg=Erreur système");
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
}
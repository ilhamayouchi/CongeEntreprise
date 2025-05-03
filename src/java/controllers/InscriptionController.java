package controllers;

import entites.Employe;
import entites.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import services.EmployeService;
import util.HibernateUtil;

@WebServlet("/InscriptionController")
public class InscriptionController extends HttpServlet {
    private EmployeService employeService;

    @Override
    public void init() throws ServletException {
        super.init();
        employeService = new EmployeService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the inscription page
        request.getRequestDispatcher("/users/inscription.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Set character encoding to handle French characters properly
        request.setCharacterEncoding("UTF-8");
        
        // Get form parameters
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String password = request.getParameter("password"); // Consider hashing this
        String role = request.getParameter("role");
        
        // Validate input
        if (email == null || email.trim().isEmpty() || 
            password == null || password.trim().isEmpty() ||
            role == null || role.trim().isEmpty()) {
            
            request.setAttribute("error", "Tous les champs sont obligatoires");
            request.getRequestDispatcher("/users/inscription.jsp").forward(request, response);
            return;
        }

        Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;

        try {
            tx = sessionHibernate.beginTransaction();

            // Create and save the User
            User user = new User();
            user.setEmail(email);
            user.setPassword(password); // Consider hashing the password
            user.setRole(role);
            
            sessionHibernate.save(user);
            
            // Create and save the Employee if role is "employe"
            if ("employe".equalsIgnoreCase(role)) {
                Employe employe = new Employe();
                employe.setNom(nom);
                employe.setPrenom(prenom);
                employe.setEmail(email);
                // Set other employee properties as needed
                
                sessionHibernate.save(employe);
            }

            tx.commit();

            // Set success message
            request.setAttribute("success", "Inscription réussie !");
            
            // Redirect based on role
            String ctx = request.getContextPath();
            if ("admin".equalsIgnoreCase(role)) {
                // For admin, redirect to admin dashboard
                HttpSession sessionHttp = request.getSession();
                sessionHttp.setAttribute("user", user);
                response.sendRedirect(ctx + "/users/adminDashbord.jsp");
            } else if ("employe".equalsIgnoreCase(role)) {
                // For employee, redirect to employee dashboard
                HttpSession sessionHttp = request.getSession();
                sessionHttp.setAttribute("user", user);
                sessionHttp.setAttribute("employe", employeService. findClientByEmail(email));
                response.sendRedirect(ctx + "/users/nemployeDashboard.jsp");
            } else {
                // Unknown role
                response.sendRedirect(ctx + "/users/login.jsp?error=roleInconnu");
            }

        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
            request.setAttribute("error", "Erreur lors de l'inscription: " + e.getMessage());
            request.getRequestDispatcher("/users/inscription.jsp").forward(request, response);
        } finally {
            sessionHibernate.close();
        }
    }
}

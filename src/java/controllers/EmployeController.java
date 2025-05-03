package controllers;

import entites.Departement;
import entites.Employe;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import services.DepartementService;
import services.EmployeService;

@WebServlet(name = "EmployeController", urlPatterns = {"/EmployeController"})
public class EmployeController extends HttpServlet {

    private EmployeService employeService;
    private DepartementService departementService;

    @Override
    public void init() throws ServletException {
        employeService = new EmployeService();
        departementService = new DepartementService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Vérifier la session et l'utilisateur
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/users/login.jsp");
            return;
        }

        // Rediriger vers la page des employés
        resp.sendRedirect(req.getContextPath() + "/users/employes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Set character encoding
        req.setCharacterEncoding("UTF-8");
        
        // Vérifier la session et l'utilisateur
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/users/login.jsp");
            return;
        }

        String op = req.getParameter("op");
        System.out.println("Operation: " + op); // Debug log
        
        try {
            if ("delete".equals(op)) {
                // Suppression d'un employé
                int id = Integer.parseInt(req.getParameter("id"));
                System.out.println("Deleting employee with ID: " + id); // Debug log
                
                Employe toDelete = employeService.findById(id);
                if (toDelete != null) {
                    employeService.delete(toDelete);
                }
            } else if ("update".equals(op)) {
                // Mise à jour d'un employé existant
                updateEmployee(req);
            } else if ("create".equals(op)) {
                // Création d'un nouvel employé
                createEmployee(req);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error in EmployeController: " + e.getMessage()); // Debug log
        }

        // Rediriger vers la page des employés
        resp.sendRedirect(req.getContextPath() + "/users/employes.jsp");
    }
    
    private void createEmployee(HttpServletRequest req) {
        try {
            String nom = req.getParameter("nom");
            String prenom = req.getParameter("prenom");
            String email = req.getParameter("email");
            String role = req.getParameter("role");
            String poste = req.getParameter("poste");
            String password = req.getParameter("password");
            String departementIdStr = req.getParameter("departementId");
            
            System.out.println("Creating employee: " + nom + " " + prenom); // Debug log
            
            // Validation des champs obligatoires
            if (nom == null || prenom == null || email == null || role == null || 
                poste == null || password == null || departementIdStr == null) {
                System.out.println("Missing required fields"); // Debug log
                return;
            }
            
            // Récupérer le département
            int departementId = Integer.parseInt(departementIdStr);
            Departement departement = departementService.findById(departementId);
            
            // Créer l'employé
            Employe employe = new Employe();
            employe.setNom(nom);
            employe.setPrenom(prenom);
            employe.setEmail(email);
            employe.setRole(role);
            employe.setPoste(poste);
            employe.setPassword(password);
            employe.setDepartement(departement);
            
            // Sauvegarder l'employé
            employeService.create(employe);
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error creating employee: " + e.getMessage()); // Debug log
        }
    }
    
    private void updateEmployee(HttpServletRequest req) {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String nom = req.getParameter("nom");
            String prenom = req.getParameter("prenom");
            String email = req.getParameter("email");
            String role = req.getParameter("role");
            String poste = req.getParameter("poste");
            String password = req.getParameter("password");
            String departementIdStr = req.getParameter("departementId");
            
            System.out.println("Updating employee ID: " + id); // Debug log
            
            // Récupérer l'employé existant
            Employe employe = employeService.findById(id);
            if (employe == null) {
                System.out.println("Employee not found with ID: " + id); // Debug log
                return;
            }
            
            // Mettre à jour les champs
            employe.setNom(nom);
            employe.setPrenom(prenom);
            employe.setEmail(email);
            employe.setRole(role);
            employe.setPoste(poste);
            
            // Ne mettre à jour le mot de passe que s'il est fourni
            if (password != null && !password.trim().isEmpty()) {
                employe.setPassword(password);
            }
            
            // Mettre à jour le département
            if (departementIdStr != null && !departementIdStr.isEmpty()) {
                int departementId = Integer.parseInt(departementIdStr);
                Departement departement = departementService.findById(departementId);
                employe.setDepartement(departement);
            }
            
            // Sauvegarder les modifications
            employeService.update(employe);
            
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error updating employee: " + e.getMessage()); // Debug log
        }
    }
}

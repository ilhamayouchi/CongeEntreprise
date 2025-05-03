package controllers;

import dao.DemandeCongeDao;
import dao.EmployeDao;
import entites.DemandeConge;
import entites.Employe;
import entites.DemandeCongeId;
import services.DemandeCongeService;
import services.EmployeService;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DemandeCongeController", urlPatterns = {"/DemandeCongeController"})
public class DemandeCongeController extends HttpServlet {

    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        
        // Initialize services if they don't exist
        if (session.getAttribute("demandeCongeService") == null) {
            session.setAttribute("demandeCongeService", new DemandeCongeService());
        }
        
        if (session.getAttribute("employeService") == null) {
            session.setAttribute("employeService", new EmployeService());
        }
        
        // Get the services from session
        DemandeCongeService demandeService = (DemandeCongeService) session.getAttribute("demandeCongeService");
        EmployeService employeService = (EmployeService) session.getAttribute("employeService");

        String op = req.getParameter("op");
        
        if (op != null && op.equals("delete")) {
            doPost(req, resp);
            return;
        }

        // Forward to the JSP page
        req.getRequestDispatcher("/gestion-conges.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        
        // Initialize services if they don't exist
        if (session.getAttribute("demandeCongeService") == null) {
            session.setAttribute("demandeCongeService", new DemandeCongeService());
        }
        
        DemandeCongeService demandeService = (DemandeCongeService) session.getAttribute("demandeCongeService");

        String op = req.getParameter("op");
        if (op == null) {
            resp.sendRedirect(req.getContextPath() + "/DemandeCongeController");
            return;
        }
        
        try {
            switch (op) {
                case "create":
                    createDemande(req, resp, session, demandeService);
                    break;
                case "update":
                    updateDemande(req, resp, session, demandeService);
                    break;
                case "delete":
                    deleteDemande(req, resp, session, demandeService);
                    break;
                default:
                    resp.sendRedirect(req.getContextPath() + "/DemandeCongeController");
            }
        } catch (Exception e) {
            // Log the exception for debugging
            e.printStackTrace();
            
            session.setAttribute("errorMessage", "Erreur: " + (e.getMessage() != null ? e.getMessage() : "Une erreur s'est produite"));
            resp.sendRedirect(req.getContextPath() + "/DemandeCongeController");
        }
    }

    private void createDemande(HttpServletRequest req, HttpServletResponse resp, HttpSession session, DemandeCongeService demandeService) 
            throws Exception {
        try {
            // Get parameters
            int employeId = Integer.parseInt(req.getParameter("employeId"));
            Date dateDebut = dateFormat.parse(req.getParameter("dateDebut"));
            Date dateFin = dateFormat.parse(req.getParameter("dateFin"));
            String statut = req.getParameter("statut");
            
            // Validation des dates
            if (dateDebut.after(dateFin)) {
                throw new Exception("La date de début doit être avant la date de fin");
            }
            
            // Get the employee service
            EmployeService employeService = (EmployeService) session.getAttribute("employeService");
            if (employeService == null) {
                throw new Exception("Service employé non disponible");
            }
            
            // Get the employee
            Employe employe = employeService.findById(employeId);
            if (employe == null) {
                throw new Exception("Employé non trouvé");
            }
            
            // Create the demand
            DemandeConge demande = new DemandeConge(employeId, dateDebut, dateFin, statut, employe);
            boolean success = demandeService.creerDemande(demande);
            
            if (!success) {
                throw new Exception("Échec de la création de la demande");
            }
            
            session.setAttribute("successMessage", "Demande créée avec succès");
        } catch (NumberFormatException e) {
            throw new Exception("ID d'employé invalide");
        } catch (ParseException e) {
            throw new Exception("Format de date invalide");
        }
        
        resp.sendRedirect(req.getContextPath() + "/DemandeCongeController");
    }

    private void updateDemande(HttpServletRequest req, HttpServletResponse resp, HttpSession session, DemandeCongeService demandeService) 
            throws Exception {
        try {
            // Get parameters
            int employeId = Integer.parseInt(req.getParameter("employeId"));
            Date dateDebut = dateFormat.parse(req.getParameter("dateDebut"));
            Date dateFin = dateFormat.parse(req.getParameter("dateFin"));
            String statut = req.getParameter("statut");
            
            // Create the ID
            DemandeCongeId id = new DemandeCongeId(employeId, dateDebut, dateFin);
            
            // Get the demand
            DemandeConge demande = demandeService.trouverDemandeParId(id);
            if (demande == null) {
                throw new Exception("Demande non trouvée");
            }
            
            // Update the status
            demande.setStatut(statut);
            
            // Save the changes
            boolean success = demandeService.modifierDemande(demande);
            
            if (!success) {
                throw new Exception("Échec de la mise à jour de la demande");
            }
            
            session.setAttribute("successMessage", "Demande mise à jour avec succès");
        } catch (NumberFormatException e) {
            throw new Exception("ID d'employé invalide");
        } catch (ParseException e) {
            throw new Exception("Format de date invalide");
        }
        
        resp.sendRedirect(req.getContextPath() + "/DemandeCongeController");
    }

    private void deleteDemande(HttpServletRequest req, HttpServletResponse resp, HttpSession session, DemandeCongeService demandeService) 
            throws Exception {
        try {
            // Get parameters
            int employeId = Integer.parseInt(req.getParameter("employeId"));
            Date dateDebut = dateFormat.parse(req.getParameter("dateDebut"));
            Date dateFin = dateFormat.parse(req.getParameter("dateFin"));
            
            // Log parameters for debugging
            System.out.println("Delete parameters: employeId=" + employeId + 
                               ", dateDebut=" + dateFormat.format(dateDebut) + 
                               ", dateFin=" + dateFormat.format(dateFin));
            
            // Create the ID
            DemandeCongeId id = new DemandeCongeId(employeId, dateDebut, dateFin);
            
            // Get the demand
            DemandeConge demande = demandeService.trouverDemandeParId(id);
            if (demande == null) {
                throw new Exception("Demande non trouvée");
            }
            
            // Delete the demand
            System.out.println("Attempting to delete demand: " + demande);
            boolean success = demandeService.supprimerDemande(demande);
            System.out.println("Delete result: " + success);
            
            if (!success) {
                throw new Exception("Échec de la suppression de la demande");
            }
            
            session.setAttribute("successMessage", "Demande supprimée avec succès");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            throw new Exception("ID d'employé invalide");
        } catch (ParseException e) {
            e.printStackTrace();
            throw new Exception("Format de date invalide");
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Erreur lors de la suppression: " + e.getMessage());
        }
        
        // Redirect back to the same page
        resp.sendRedirect(req.getContextPath() + "/DemandeCongeController");
    }
}

package controllers;

import dao.DemandeCongeDao;
import dao.EmployeDao;
import entites.DemandeConge;
import entites.Employe;
import entites.DemandeCongeId;
import services.DemandeCongeService;
import services.EmployeService;

import java.io.IOException;
import java.io.PrintWriter;
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
        req.getRequestDispatcher("/users/listeDemande.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        
        // Initialize services if they don't exist
        if (session.getAttribute("demandeCongeService") == null) {
            session.setAttribute("demandeCongeService", new DemandeCongeService());
        }
        
        if (session.getAttribute("employeService") == null) {
            session.setAttribute("employeService", new EmployeService());
        }
        
        DemandeCongeService demandeService = (DemandeCongeService) session.getAttribute("demandeCongeService");
        EmployeService employeService = (EmployeService) session.getAttribute("employeService");

        String op = req.getParameter("op");
        if (op == null) {
            resp.sendRedirect(req.getContextPath() + "/DemandeCongeController");
            return;
        }
        
        // Check if it's an AJAX request
        boolean isAjax = "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
        
        try {
            boolean success = false;
            String message = "";
            
            switch (op) {
                case "create":
                    success = createDemande(req, session, demandeService, employeService);
                    message = success ? "Demande créée avec succès" : "Échec de la création de la demande";
                    break;
                case "update":
                    success = updateDemande(req, session, demandeService, employeService);
                    message = success ? "Demande mise à jour avec succès" : "Échec de la mise à jour de la demande";
                    break;
                case "delete":
                    success = deleteDemande(req, session, demandeService);
                    message = success ? "Demande supprimée avec succès" : "Échec de la suppression de la demande";
                    break;
                default:
                    message = "Opération non reconnue";
            }
            
            if (isAjax) {
                // Send JSON response for AJAX requests
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                PrintWriter out = resp.getWriter();
                out.print("{\"success\":" + success + ",\"message\":\"" + message + "\"}");
                out.flush();
            } else {
                // Set message in session and redirect for non-AJAX requests
                if (success) {
                    session.setAttribute("successMessage", message);
                } else {
                    session.setAttribute("errorMessage", message);
                }
                resp.sendRedirect(req.getContextPath() + "/DemandeCongeController");
            }
            
        } catch (Exception e) {
            // Log the exception for debugging
            e.printStackTrace();
            
            if (isAjax) {
                // Send JSON error response for AJAX requests
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                PrintWriter out = resp.getWriter();
                out.print("{\"success\":false,\"message\":\"Erreur: " + 
                         (e.getMessage() != null ? e.getMessage().replace("\"", "\\\"") : "Une erreur s'est produite") + "\"}");
                out.flush();
            } else {
                // Set error message in session and redirect for non-AJAX requests
                session.setAttribute("errorMessage", "Erreur: " + (e.getMessage() != null ? e.getMessage() : "Une erreur s'est produite"));
                resp.sendRedirect(req.getContextPath() + "/DemandeCongeController");
            }
        }
    }

    private boolean createDemande(HttpServletRequest req, HttpSession session, DemandeCongeService demandeService, EmployeService employeService) 
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
            
            // Get the employee
            Employe employe = employeService.findById(employeId);
            if (employe == null) {
                throw new Exception("Employé non trouvé");
            }
            
            // Create the demand
            DemandeConge demande = new DemandeConge(employeId, dateDebut, dateFin, statut, employe);
            return demandeService.creerDemande(demande);
            
        } catch (NumberFormatException e) {
            throw new Exception("ID d'employé invalide");
        } catch (ParseException e) {
            throw new Exception("Format de date invalide");
        }
    }

    private boolean updateDemande(HttpServletRequest req, HttpSession session, DemandeCongeService demandeService, EmployeService employeService) 
            throws Exception {
        try {
            // Get parameters
            int employeId = Integer.parseInt(req.getParameter("employeId"));
            Date dateDebut = dateFormat.parse(req.getParameter("dateDebut"));
            Date dateFin = dateFormat.parse(req.getParameter("dateFin"));
            String statut = req.getParameter("statut");
            
            // Get old dates for finding the original record
            Date oldDateDebut = null;
            Date oldDateFin = null;
            
            if (req.getParameter("oldDateDebut") != null && !req.getParameter("oldDateDebut").isEmpty()) {
                oldDateDebut = dateFormat.parse(req.getParameter("oldDateDebut"));
            } else {
                oldDateDebut = dateDebut;
            }
            
            if (req.getParameter("oldDateFin") != null && !req.getParameter("oldDateFin").isEmpty()) {
                oldDateFin = dateFormat.parse(req.getParameter("oldDateFin"));
            } else {
                oldDateFin = dateFin;
            }
            
            // Validation des dates
            if (dateDebut.after(dateFin)) {
                throw new Exception("La date de début doit être avant la date de fin");
            }
            
            // Get the employee
            Employe employe = employeService.findById(employeId);
            if (employe == null) {
                throw new Exception("Employé non trouvé");
            }
            
            // Create the ID for finding the original record
            DemandeCongeId oldId = new DemandeCongeId(employeId, oldDateDebut, oldDateFin);
            
            // Get the original demand
            DemandeConge oldDemande = demandeService.trouverDemandeParId(oldId);
            if (oldDemande == null) {
                throw new Exception("Demande originale non trouvée");
            }
            
            // If dates have changed, delete the old record and create a new one
            if (!oldDateDebut.equals(dateDebut) || !oldDateFin.equals(dateFin)) {
                // Delete the old record
                boolean deleteSuccess = demandeService.supprimerDemande(oldDemande);
                if (!deleteSuccess) {
                    throw new Exception("Échec de la suppression de l'ancienne demande");
                }
                
                // Create a new record
                DemandeConge newDemande = new DemandeConge(employeId, dateDebut, dateFin, statut, employe);
                return demandeService.creerDemande(newDemande);
            } else {
                // Just update the status
                oldDemande.setStatut(statut);
                return demandeService.modifierDemande(oldDemande);
            }
            
        } catch (NumberFormatException e) {
            throw new Exception("ID d'employé invalide");
        } catch (ParseException e) {
            throw new Exception("Format de date invalide");
        }
    }

    private boolean deleteDemande(HttpServletRequest req, HttpSession session, DemandeCongeService demandeService) 
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
            
            return success;
            
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
    }
}

package controllers;

import entites.Employe;
import entites.DemandeConge;
import entites.DemandeCongeId;
import services.EmployeService;
import services.DemandeCongeService;
import services.DepartementService;
import entites.Departement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AdminController", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {

    private final EmployeService employeService = new EmployeService();
    private final DemandeCongeService demandeCongeService = new DemandeCongeService();
    private final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private final DepartementService departementService = new DepartementService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Vérifier la session et le rôle
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/users/login.jsp");
            return;
        }

        try {
            // Charger la liste des employés et des demandes de congé
            List<Employe> employes = employeService.findAll();
            List<DemandeConge> demandes = demandeCongeService.listerToutesDemandes();
            List<Departement> departements = departementService.findAll();

            // Vérifier que les données ne sont pas nulles
            if (employes == null) {
                employes = java.util.Collections.emptyList();
            }
            if (demandes == null) {
                demandes = java.util.Collections.emptyList();
            }
            if (departements == null) {
                departements = java.util.Collections.emptyList();
            }

            // Définir les attributs de la requête
            request.setAttribute("employes", employes);
            request.setAttribute("demandes", demandes);
            request.setAttribute("departements", departements);
            
            // Forward vers la JSP du dashboard admin
            request.getRequestDispatcher("/users/adminDashbord.jsp").forward(request, response);
        } catch (Exception e) {
            // Log l'erreur
            e.printStackTrace();
            // Afficher un message d'erreur à l'utilisateur
            request.setAttribute("errorMessage", "Une erreur est survenue lors du chargement des données: " + e.getMessage());
            request.getRequestDispatcher("/users/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "ajouterEmploye": {
                    String nom = request.getParameter("nom");
                    String poste = request.getParameter("poste");
                    String prenom = request.getParameter("prenom");
                    String email = request.getParameter("email");
                    String mdp = request.getParameter("motDePasse");
                    String role = request.getParameter("role");

                    // Récupérer le département sélectionné
                    int departementId = Integer.parseInt(request.getParameter("departementId"));
                    Departement departement = departementService.findById(departementId);

                    // CORRECTION ICI : L'ordre des paramètres était inversé
                    Employe e = new Employe(poste, nom, prenom, email, mdp, role);
                    e.setDepartement(departement);

                    employeService.create(e);
                    break;
                }

                case "modifierEmploye": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Employe e = employeService.findById(id);
                    if (e != null) {
                        e.setNom(request.getParameter("nom"));
                        e.setPrenom(request.getParameter("prenom"));
                        e.setEmail(request.getParameter("email"));
                        e.setPassword(request.getParameter("motDePasse"));
                        employeService.update(e);
                    }
                    break;
                }
                case "supprimerEmploye": {
                    int id = Integer.parseInt(request.getParameter("id"));
                    Employe e = employeService.findById(id);
                    if (e != null) {
                        employeService.delete(e);
                    }
                    break;
                }
                case "approuverDemande":
                case "refuserDemande": {
                    int empId = Integer.parseInt(request.getParameter("employeId"));
                    Date dDebut = dateFormat.parse(request.getParameter("dateDebut"));
                    Date dFin = dateFormat.parse(request.getParameter("dateFin"));
                    String statut = action.equals("approuverDemande") ? "Approuvé" : "Refusé";

                    DemandeCongeId dcId = new DemandeCongeId(empId, dDebut, dFin);
                    DemandeConge dc = demandeCongeService.findById(dcId);
                    if (dc != null) {
                        dc.setStatut(statut);
                        demandeCongeService.update(dc);
                    }
                    break;
                }
                default:
                    // Action non gérée
                    break;
            }
        } catch (ParseException e) {
            throw new ServletException("Erreur de parsing de date", e);
        }

        // Après traitement, rediriger vers /admin pour rafraîchir la vue
        response.sendRedirect(request.getContextPath() + "/admin");
    }
}
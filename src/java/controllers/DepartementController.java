package controllers;

import entites.Departement;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.DepartementService;

@WebServlet("/gestionDepartements")
public class DepartementController extends HttpServlet {

    private final DepartementService departementService = new DepartementService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "liste"; // Action par défaut
        }

        try {
            switch (action) {
                case "liste":
                    handleListeDepartements(request, response);
                    break;
                case "afficher":
                    handleAfficherDepartement(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/admin/departements.jsp");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Erreur: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/gestionDepartements?action=liste");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "liste"; // Action par défaut
        }

        try {
            switch (action) {
                case "ajouter":
                    handleAjoutDepartement(request, response);
                    break;
                case "modifier":
                    handleModificationDepartement(request, response);
                    break;
                case "supprimer":
                    handleSuppressionDepartement(request, response);
                    break;
                default:
                    request.getSession().setAttribute("error", "Action non reconnue");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Erreur de format des données: " + e.getMessage());
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Erreur inattendue: " + e.getMessage());
        }

        response.sendRedirect(request.getContextPath() + "/gestionDepartements?action=liste");
    }

    private void handleListeDepartements(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Departement> departements = departementService.findAll();
            request.setAttribute("departements", departements);
            request.getRequestDispatcher("/admin/departements.jsp").forward(request, response);
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Erreur lors de la récupération des départements: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/gestionDepartements?action=liste");
        }
    }

    private void handleAfficherDepartement(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Departement departement = departementService.findById(id);
            if (departement == null) {
                request.getSession().setAttribute("error", "Département introuvable");
                response.sendRedirect(request.getContextPath() + "/gestionDepartements?action=liste");
                return;
            }
            request.setAttribute("departement", departement);
            request.getRequestDispatcher("/admin/detailsDepartement.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "ID de département invalide: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/gestionDepartements?action=liste");
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Erreur lors de l'affichage du département: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/gestionDepartements?action=liste");
        }
    }

    private void handleAjoutDepartement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nom = request.getParameter("nom");

        if (nom == null || nom.trim().isEmpty()) {
            request.getSession().setAttribute("error", "Le nom du département ne peut pas être vide.");
        } else {
            Departement nouveauDepartement = new Departement();
            nouveauDepartement.setNom(nom);
            try {
                departementService.create(nouveauDepartement);
                request.getSession().setAttribute("success", "Département ajouté avec succès.");
            } catch (Exception e) {
                request.getSession().setAttribute("error", "Erreur lors de l'ajout du département: " + e.getMessage());
            }
        }
        response.sendRedirect(request.getContextPath() + "/gestionDepartements?action=liste");
    }

    private void handleModificationDepartement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String nom = request.getParameter("nom");

            if (nom == null || nom.trim().isEmpty()) {
                request.getSession().setAttribute("error", "Le nom du département ne peut pas être vide.");
            } else {
                Departement departement = departementService.findById(id);
                if (departement != null) {
                    departement.setNom(nom);
                    departementService.update(departement);
                    request.getSession().setAttribute("success", "Département mis à jour avec succès.");
                } else {
                    request.getSession().setAttribute("error", "Département introuvable.");
                }
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "ID de département invalide: " + e.getMessage());
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Erreur lors de la modification du département: " + e.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/gestionDepartements?action=liste");
    }

    private void handleSuppressionDepartement(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Departement departement = departementService.findById(id);
            if (departement != null) {
                departementService.delete(departement);
                request.getSession().setAttribute("success", "Département supprimé avec succès.");
            } else {
                request.getSession().setAttribute("error", "Département introuvable.");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "ID de département invalide: " + e.getMessage());
        } catch (Exception e) {
            request.getSession().setAttribute("error", "Erreur lors de la suppression du département: " + e.getMessage());
        }
        response.sendRedirect(request.getContextPath() + "/gestionDepartements?action=liste");
    }
}
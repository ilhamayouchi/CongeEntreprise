package controllers;

import com.google.gson.Gson;
import services.DemandeCongeService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mapper.CongeParDeprtCount;

@WebServlet(name = "CongeDeptStatController", urlPatterns = {"/StatistiquesCongesParDepartement"})
public class CongeDeptStatController extends HttpServlet {

    private final DemandeCongeService congeService = new DemandeCongeService();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        System.out.println("Servlet StatistiquesCongesParDepartementController a été atteint !");

        List<Object[]> resultats = congeService.getNombreCongesParDepartement();
        System.out.println("Résultats de la base de données récupérés : " + resultats);

        List<CongeParDeprtCount> stats = new ArrayList<>();

        for (Object[] ligne : resultats) {
            String nomDepartement = (String) ligne[0];
            Long count = ((Number) ligne[1]).longValue();
            stats.add(new CongeParDeprtCount(nomDepartement, count));
        }

        String json = new Gson().toJson(stats);
        System.out.println("JSON généré : " + json);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
        System.out.println("Réponse JSON envoyée.");
        
    } catch (Exception e) {
        e.printStackTrace(); // ➜ Ceci affichera l’erreur exacte dans la console
        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        response.getWriter().write("{\"error\": \"Erreur interne côté serveur.\"}");
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
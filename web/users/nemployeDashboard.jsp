<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="entites.Employe"%>
<%@page import="entites.DemandeConge"%>
<%@page import="dao.DemandeCongeDao"%>
<%@page import="services.DemandeCongeService"%>
<%
    HttpSession sessionHttp = request.getSession(false);
    if (sessionHttp == null || sessionHttp.getAttribute("employe") == null) {
        response.sendRedirect(request.getContextPath() + "/users/login.jsp");
        return;
    }
    
    Employe employe = (Employe) sessionHttp.getAttribute("employe");
    DemandeCongeService demandeService = new DemandeCongeService();
    List<DemandeConge> demandes = demandeService.getDemandesParEmployeSansClasse(employe.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Employé</title>
    <style>
        body { font-family: Arial; margin: 20px; }
        h2 { color: #333; }
        .section { margin-bottom: 40px; }
        table { width: 100%; border-collapse: collapse; }
        table, th, td { border: 1px solid #ccc; }
        th, td { padding: 10px; text-align: center; }
        input[type="submit"] { padding: 10px 20px; margin-top: 10px; }
        .error { color: red; }
    </style>
</head>
<body>
    <h1>Bienvenue, <%= employe.getNom() %></h1>
    
    <!-- Section formulaire -->
    <div class="section">
        <h2>Faire une demande de congé</h2>
       <form action="${pageContext.request.contextPath}/DemandeCongeController" method="POST" id="congeForm">
    <input type="hidden" name="op" value="create">
    <input type="hidden" name="employeId" value="${employe.id}">
    
    <div>
        <label for="dateDebut">Date de début :</label>
        <input type="date" id="dateDebut" name="dateDebut" required>
    </div>
    
    <div>
        <label for="dateFin">Date de fin :</label>
        <input type="date" id="dateFin" name="dateFin" required>
    </div>
    
    <button type="submit">Envoyer la demande</button>
</form>
    </div>
    
    <!-- Section historique -->
    <div class="section">
        <h2>Historique de mes demandes</h2>
        <% if (demandes == null || demandes.isEmpty()) { %>
            <p>Aucune demande de congé trouvée.</p>
        <% } else { %>
            <table>
                <tr>
                    <th>Date début</th>
                    <th>Date fin</th>
                    <th>Statut</th>
                </tr>
                <% for (DemandeConge dc : demandes) { %>
                <tr>
                    <td><%= dc.getDateDebut() %></td>
                    <td><%= dc.getDateFin() %></td>
                    <td><%= dc.getStatut() %></td>
                </tr>
                <% } %>
            </table>
        <% } %>
    </div>
</body>
<script>
document.getElementById('congeForm').addEventListener('submit', function() {
    console.log('Form submitted with data:', {
        employeId: this.employeId.value,
        dateDebut: this.dateDebut.value,
        dateFin: this.dateFin.value
    });
});
</script>
</html>
<%-- 
    Document   : adminDashbord
    Created on : 18 avr. 2025, 00:32:17
    Author     : hp
--%>

<%@page import="entites.Employe"%>
<%@page import="services.EmployeService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">    
<head>
    <title>Admin Dashboard</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            background-color: #f5f9ff;
            color: #333;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #1a73e8;
            color: white;
            padding: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }

        .sidebar-logo {
            width: 80%;
            margin: 0 auto 30px;
            display: block;
        }

        .sidebar h2 {
            margin-bottom: 30px;
            font-size: 18px;
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 12px 15px;
            margin: 5px 0;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: rgba(255,255,255,0.1);
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 30px;
        }

        .main-content h1 {
            color: #1a73e8;
            margin-bottom: 30px;
            font-size: 28px;
        }

        fieldset {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }

        legend {
            color: #1a73e8;
            font-weight: bold;
            padding: 0 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: white;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #1a73e8;
            color: white;
            padding: 15px;
            text-align: left;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover {
            background-color: #e8f0fe;
        }

        .actions-container {
            display: flex;
            gap: 10px;
        }

        .action {
            padding: 6px 12px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.2s;
        }

        .action:first-child {
            background-color: #1a73e8;
            color: white;
        }

        .action:first-child:hover {
            background-color: #0d62c9;
        }

        .action:last-child {
            background-color: #e53935;
            color: white;
        }

        .action:last-child:hover {
            background-color: #c62828;
        }

        .empty-message {
            text-align: center;
            color: #666;
            padding: 20px;
        }

        .add-button {
            background-color: #1a73e8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.2s;
            text-decoration: none;
            display: inline-block;
        }

        .add-button:hover {
            background-color: #0d62c9;
        }

        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                padding: 15px;
            }
            
            .main-content {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <!-- SIDEBAR -->
    <div class="sidebar">
        <img src="images/logo.png" alt="Logo Entreprise" class="sidebar-logo">
        <h2>Admin - Gestion des Congés</h2>
        <a href="listeEmployes.jsp">Employés</a>
        <a href="listeConges.jsp">Demandes de Congés</a>
        <a href="statistiques.jsp">Statistiques</a>
    </div>

    <!-- MAIN CONTENT -->
    <div class="main-content">
        <h1>Dashboard - Liste des Employés</h1>
        
        <fieldset>
            <legend>Employés de l'entreprise</legend>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Email</th>
                        <th>Service</th>
                        <th>Poste</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        EmployeService es = new EmployeService();
                        java.util.List<Employe> employes = es.findAll();
                        if (employes != null && !employes.isEmpty()) {
                            for (Employe emp : employes) {
                    %>
                    <tr>
                        <td><%= emp.getId()%></td>
                        <td><%= emp.getNom()%></td>
                        <td><%= emp.getPrenom()%></td>
                        <td><%= emp.getEmail()%></td>
                        <td><%= emp.getDepartement() != null ? emp.getDepartement().getNom() : "N/A"%></td>
                        <td><%= emp.getPoste()%></td>
                        <td class="actions-container">
                            <a href="EmployeController?id=<%= emp.getId()%>&op=update" class="action">Modifier</a>
                            <a href="EmployeController?id=<%= emp.getId()%>&op=delete" class="action">Supprimer</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7" class="empty-message">Aucun employé trouvé.</td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </fieldset>

        <a href="ajouterEmploye.jsp" class="add-button">Ajouter un employé</a>
    </div>
</body>
</html>
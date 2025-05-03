<%-- 
    Document   : adminDashbord
    Created on : 18 avr. 2025, 00:32:17
    Author     : hp
--%>

<%@page import="services.DemandeCongeService"%>
<%@page import="entites.DemandeConge"%>
<%@page import="services.EmployeService"%>
<%@page import="services.DepartementService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entites.Departement"%>
<%@page import="java.util.List"%>
<%@page import="entites.Employe"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
  // Initialize services

    DemandeCongeService demandeCongeService = new DemandeCongeService();

    
    // Get data counts
    
    List<DemandeConge> demandes = demandeCongeService.listerToutesDemandes();

    
    // Set counts as attributes for JSTL

    request.setAttribute("demandeCount", demandes != null ? demandes.size() : 0);
   
    
    
    // Récupération 
    EmployeService employeService = (EmployeService) session.getAttribute("employeService");
    if (employeService == null) {
        employeService = new EmployeService();
        session.setAttribute("employeService", employeService);
    }
    DepartementService departementService = (DepartementService) session.getAttribute("departementService");
    if (departementService == null) {
        departementService = new DepartementService();
        session.setAttribute("departementService", departementService);
    }

    // Chargement des listes avec instanciation explicite (Java 5)
    List rawEmployes = employeService.findAll();
    List<Employe> employes;
    if (rawEmployes != null) {
        employes = rawEmployes;
    } else {
        employes = new ArrayList<Employe>();
    }

    List rawDepartements = departementService.findAll();
    List<Departement> departements;
    if (rawDepartements != null) {
        departements = rawDepartements;
    } else {
        departements = new ArrayList<Departement>();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard Admin</title>
    </head>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            background-color: #f4f4f4;
        }

        .container {
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: #fff;
            padding: 20px;
            height: 100vh;
            position: sticky;
            top: 0;
        }

        .sidebar h2 {
            text-align: center;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin: 20px 0;
        }

        .sidebar ul li a {
            color: #ecf0f1;
            text-decoration: none;
            font-size: 16px;
        }

        .logo {
            width: 100%;
            margin-bottom: 20px;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        section {
            margin-bottom: 40px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        .btn {
            background-color: #2ecc71;
            padding: 10px 15px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            display: inline-block;
            margin-bottom: 10px;
        }

        .btn:hover {
            background-color: #27ae60;
        }

        .action {
            margin: 0 5px;
            text-decoration: none;
            color: #2980b9;
            font-weight: bold;
        }

        .stats {
            list-style: none;
            padding: 0;
            font-size: 18px;
        }

        .stats li {
            margin-bottom: 10px;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fff;
            margin: auto;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            position: relative;
        }

        .modal-content input, .modal-content select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .modal-content .close {
            position: absolute;
            top: 10px;
            right: 15px;
            color: #aaa;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }

        .modal-content .close:hover {
            color: #000;
        }
        .stats-buttons {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }

        .stat-button {
            background-color: #1d3557;
            color: white;
            border: none;
            padding: 20px;
            width: 180px;
            height: 120px;
            border-radius: 15px;
            font-size: 18px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: 0.3s ease;
            cursor: pointer;
        }

        .stat-button:hover {
            background-color: #457b9d;
        }


    </style>
    <body>
        <div class="container">
            <nav class="sidebar">
                <img src="<%=request.getContextPath()%>/images/logo.png" alt="Logo" class="logo">
                <h2>Admin Panel</h2>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/users/employes.jsp">👤 Gestion des Employés</a></li>
                    <li><a href="<%= request.getContextPath() %>/users/listeDemande.jsp">📄 Gestion des Demandes de Congés</a></li>
                    <li><a href="<%= request.getContextPath() %>/users/graphe.jsp">📊 Statistiques</a></li>
                   <li><a href="${pageContext.request.contextPath}/DeconnexionController">🚪 Déconnexion</a></li>
                </ul>
            </nav>

            <main class="content">
                <!-- Section Employés -->
                <section id="employes">
                    <h2>Tableau de bord </h2>

                    <h2>Liste des Employés</h2>
                    <table>
        <thead>
          <tr>
            <th>Nom</th><th>Prénom</th><th>Email</th><th>Poste</th><th>Role</th><th>Mot de passe</th><th>Département</th>
          </tr>
        </thead>
        <tbody>
        <% for (int i = 0; i < employes.size(); i++) {
             Employe e = (Employe) employes.get(i);
        %>
          <tr>
            <td><%= e.getNom() %></td>
            <td><%= e.getPrenom() %></td>
            <td><%= e.getEmail() %></td>
            <td><%= e.getPoste() %></td>
            <td><%= e.getRole() %></td>
            <td><%= e.getPassword() %></td>
            <td><%= (e.getDepartement() != null) ? e.getDepartement().getNom() : "Non affecté" %></td>
            
          </tr>
        <% } %>
        </tbody>
      </table>
                </section>

                

               <!-- Statistiques -->
        <section id="stats">
            <h2>📊 Statistiques</h2>
            <div class="stats-buttons">
                <div class="stat-button">
                    👤 Employés<br>
                    <strong>
                        <% if (request.getAttribute("employeCount") != null) { %>
                            <%= request.getAttribute("employeCount") %>
                        <% } else { %>
                            <%= employes != null ? employes.size() : 0 %>
                        <% } %>
                    </strong>
                </div>
                <div class="stat-button">
                    📝 Congés<br>
                    <strong>
                        <% if (request.getAttribute("demandeCount") != null) { %>
                            <%= request.getAttribute("demandeCount") %>
                        <% } else { %>
                            <%= demandes != null ? demandes.size() : 0 %>
                        <% } %>
                    </strong>
                </div>
                <div class="stat-button">
                    🏢 Départements<br>
                    <strong>
                        <% if (request.getAttribute("departementCount") != null) { %>
                            <%= request.getAttribute("departementCount") %>
                        <% } else { %>
                            <%= departements != null ? departements.size() : 0 %>
                        <% } %>
                    </strong>
                </div>
            </div>
        </section>
            </main>
        </div>
    </body>
</html>
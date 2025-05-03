<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List, java.util.ArrayList, entites.DemandeConge, entites.Employe, services.DemandeCongeService, services.EmployeService" %>

<%
    // Il est généralement préférable de gérer les services dans le contrôleur
    // plutôt que directement dans le JSP pour une meilleure séparation des responsabilités.
    // Cependant, pour cette correction, nous conservons votre approche initiale.
    DemandeCongeService demandeService = (DemandeCongeService) session.getAttribute("demandeCongeService");
    if (demandeService == null) {
        demandeService = new DemandeCongeService();
        session.setAttribute("demandeCongeService", demandeService);
    }

    EmployeService employeService = (EmployeService) session.getAttribute("employeService");
    if (employeService == null) {
        employeService = new EmployeService();
        session.setAttribute("employeService", employeService);
    }

    List<DemandeConge> rawDemandes = demandeService.listerToutesDemandes();
    List<DemandeConge> demandes = (rawDemandes != null) ? rawDemandes : new ArrayList<DemandeConge>();

    List<Employe> rawEmployes = employeService.findAll();
    List<Employe> employes = (rawEmployes != null) ? rawEmployes : new ArrayList<Employe>();

    // Récupération des messages d'erreur ou de succès
    String errorMessage = (String) session.getAttribute("errorMessage");
    String successMessage = (String) session.getAttribute("successMessage");

    // Réinitialisation des messages après affichage
    if (errorMessage != null) {
        session.removeAttribute("errorMessage");
    }
    if (successMessage != null) {
        session.removeAttribute("successMessage");
    }

    // Important : Affiche le contexte de l'application pour le débogage
    String contextPath = request.getContextPath();
    System.out.println("Context Path: " + contextPath);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des Demandes de Congé</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
        table { width:100%; border-collapse:collapse; margin-top:10px; }
        th,td { border:1px solid #ccc; padding:8px; }
        form input, form select { width:100%; margin-bottom:10px; padding: 8px; box-sizing: border-box; }
        button { margin:5px; padding:8px 12px; border:none; background:#4a90e2; color:#fff; border-radius:4px; cursor:pointer; }
        button:hover { background:#357ab7; }
        .error { background-color: #ffdddd; border: 1px solid #ff0000; color: #ff0000; padding: 10px; margin: 10px 0; border-radius: 4px; }
        .success { background-color: #ddffdd; border: 1px solid #00aa00; color: #00aa00; padding: 10px; margin: 10px 0; border-radius: 4px; }
        .container { max-width: 1200px; margin: 0 auto; }
        nav { background-color: #f8f8f8; padding: 10px; margin-bottom: 20px; }
        nav a { text-decoration: none; color: #333; font-weight: bold; }
        h2 { color: #333; }
    </style>
</head>
<body>
    <div class="container">
        <nav>
            <a href="<%= contextPath %>/users/adminDashbord.jsp">🏠 Retour au Dashboard</a>
        </nav>

        <main>
            <h2>📅 Gestion des Demandes de Congé</h2>

            <% if (errorMessage != null) { %>
                <div class="error"><%= errorMessage %></div>
            <% } %>

            <% if (successMessage != null) { %>
                <div class="success"><%= successMessage %></div>
            <% } %>

            <button onclick="toggleTable()">📋 Voir/Cacher la liste des demandes</button>
            <div id="demandeTable" style="display:block; margin-top:15px;">
                <table>
                    <thead>
                        <tr>
                            <th>Nom de l'Employé</th>
                            <th>Date de Début</th>
                            <th>Date de Fin</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <% if (demandes.isEmpty()) { %>
                        <tr>
                            <td colspan="5" style="text-align: center;">Aucune demande de congé trouvée</td>
                        </tr>
                    <% } else { %>
                        <% for (DemandeConge d : demandes) { %>
                            <tr>
                                <td><%= d.getEmploye().getNom() + " " + d.getEmploye().getPrenom() %></td>
                                <td><fmt:formatDate value="<%= d.getDateDebut() %>" pattern="dd/MM/yyyy" /></td>
                                <td><fmt:formatDate value="<%= d.getDateFin() %>" pattern="dd/MM/yyyy" /></td>
                                <td><%= d.getStatut() %></td>
                                <td>
                                    <button type="button" onclick="fillEditForm({
                                        id: '<%= d.getEmployeId() %>',
                                        employeId: <%= d.getEmployeId() %>,
                                        dateDebut: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(d.getDateDebut()) %>',
                                        dateFin: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(d.getDateFin()) %>',
                                        statut: '<%= d.getStatut() %>' // Ajout du statut pour l'édition
                                    })">🖊️ Modifier</button>
                                    <form action="<%= contextPath %>/DemandeCongeController" method="post" style="display:inline;">
                                        <input type="hidden" name="op" value="delete"/>
                                        <input type="hidden" name="employeId" value="<%= d.getEmployeId() %>"/>
                                        <input type="hidden" name="dateDebut" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(d.getDateDebut()) %>"/>
                                        <input type="hidden" name="dateFin" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(d.getDateFin()) %>"/>
                                        <button type="submit" onclick="return confirm('Supprimer cette demande ?')">❌ Supprimer</button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    <% } %>
                    </tbody>
                </table>
            </div>

            <button onclick="toggleAddForm()">➕ Ajouter une Demande de Congé</button>
            <div id="demandeForm" style="display:none; margin-top:15px; border: 1px solid #ccc; padding: 15px; border-radius: 4px;">
                <h3>Nouvelle demande de congé</h3>
                <form id="addForm" action="<%= contextPath %>/DemandeCongeController" method="post">
                    <input type="hidden" name="op" value="create"/>
                    <label for="employeId">Employé:</label>
                    <select id="employeId" name="employeId" required>
                        <option value="">-- Sélectionnez un employé --</option>
                        <% for (Employe e : employes) { %>
                            <option value="<%= e.getId() %>"><%= e.getNom() + " " + e.getPrenom() %></option>
                        <% } %>
                    </select>
                    <label for="dateDebut">Date de Début:</label>
                    <input type="date" id="dateDebut" name="dateDebut" required/>
                    <label for="dateFin">Date de Fin:</label>
                    <input type="date" id="dateFin" name="dateFin" required/>
                    <label for="statut">Statut:</label>
                    <select id="statut" name="statut" required>
                        <option value="EN_ATTENTE">En Attente</option>
                        <option value="ACCEPTEE">Acceptée</option>
                        <option value="REFUSEE">Refusée</option>
                    </select>
                    <div style="margin-top: 10px;">
                        <button type="submit">✅ Enregistrer</button>
                        <button type="button" onclick="document.getElementById('demandeForm').style.display='none'">❌ Annuler</button>
                    </div>
                </form>
            </div>

            <div id="editForm" style="display:none; margin-top:15px; border: 1px solid #ccc; padding: 15px; border-radius: 4px;">
                <h3>Modifier la demande de congé</h3>
                <form id="editFormElem" action="<%= contextPath %>/DemandeCongeController" method="post">
                    <input type="hidden" name="op" value="update"/>
                    <input type="hidden" name="id" id="editId"/>
                    <label for="editEmployeId">Employé:</label>
                    <select id="editEmployeId" name="employeId" required>
                        <option value="">-- Sélectionnez un employé --</option>
                        <% for (Employe e : employes) { %>
                            <option value="<%= e.getId() %>"><%= e.getNom() + " " + e.getPrenom() %></option>
                        <% } %>
                    </select>
                    <label for="editDateDebut">Date de Début:</label>
                    <input type="date" id="editDateDebut" name="dateDebut" required/>
                    <label for="editDateFin">Date de Fin:</label>
                    <input type="date" id="editDateFin" name="dateFin" required/>
                     <label for="editStatut">Statut:</label>
                    <select id="editStatut" name="statut" required>
                        <option value="EN_ATTENTE">En Attente</option>
                        <option value="ACCEPTEE">Acceptée</option>
                        <option value="REFUSEE">Refusée</option>
                    </select>
                    <div style="margin-top: 10px;">
                        <button type="submit">✅ Mettre à jour</button>
                        <button type="button" onclick="document.getElementById('editForm').style.display='none'">❌ Annuler</button>
                    </div>
                </form>
            </div>
        </main>
    </div>

    <script>
        function toggleTable() {
            var t = document.getElementById('demandeTable');
            t.style.display = (t.style.display==='none')?'block':'none';
        }

        function toggleAddForm() {
            var f = document.getElementById('demandeForm');
            var e = document.getElementById('editForm');
            f.style.display = (f.style.display==='none')?'block':'none';
            if (f.style.display === 'block') {
                e.style.display = 'none';
            }
        }

        function fillEditForm(demande) {
            document.getElementById('demandeForm').style.display = 'none';
            document.getElementById('editForm').style.display = 'block';

            document.getElementById('editId').value = demande.id;
            document.getElementById('editEmployeId').value = demande.employeId;
            document.getElementById('editDateDebut').value = demande.dateDebut;
            document.getElementById('editDateFin').value = demande.dateFin;
            document.getElementById('editStatut').value = demande.statut; // Pré-remplir le statut
        }

        // Vérifie que les dates sont cohérentes
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('addForm').addEventListener('submit', validateDates);
            document.getElementById('editFormElem').addEventListener('submit', validateDates);

            function validateDates(event) {
                var form = event.target;
                var dateDebut, dateFin;

                if (form.id === 'addForm') {
                    dateDebut = new Date(document.getElementById('dateDebut').value);
                    dateFin = new Date(document.getElementById('dateFin').value);
                } else {
                    dateDebut = new Date(document.getElementById('editDateDebut').value);
                    dateFin = new Date(document.getElementById('editDateFin').value);
                }

                if (dateDebut > dateFin) {
                    alert('La date de début doit être antérieure ou égale à la date de fin');
                    event.preventDefault();
                    return false;
                }

                return true;
            }
        });
    </script>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList, entites.Employe, entites.Departement, services.EmployeService, services.DepartementService" %>

<%
    // Récupération (ou création) des services en session
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
    <title>Gestion des Employés</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">
    <style>
      body { font-family: Arial, sans-serif; margin: 0; padding: 20px; }
      table { width:100%; border-collapse:collapse; margin-top:10px; }
      th,td  { border:1px solid #ccc; padding:8px; }
      form input, form select { width:100%; margin-bottom:10px; padding:6px; box-sizing: border-box; }
      button { margin:5px; padding:8px 12px; border:none; background:#4a90e2; color:#fff; border-radius:4px; cursor:pointer; }
      button:hover { background:#357ab7; }
      .form-container { border: 1px solid #ccc; padding: 15px; border-radius: 4px; margin-top: 15px; }
      .form-row { display: flex; gap: 10px; margin-bottom: 10px; }
      .form-row > div { flex: 1; }
      .form-row label { display: block; margin-bottom: 5px; }
      .form-buttons { margin-top: 15px; }
    </style>
</head>
<body>
  <nav>
    <a href="<%= request.getContextPath() %>/users/dashboard.jsp">🏠 Retour au Dashboard</a>
  </nav>

  <main>
    <h2>👤 Gestion des Employés</h2>

    <button onclick="toggleTable()">📋 Voir/Cacher la liste</button>
    <div id="empTable" style="display:block; margin-top:15px;">
      <table>
        <thead>
          <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Poste</th>
            <th>Role</th>
            <th>Mot de passe</th>
            <th>Département</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
        <% for (int i = 0; i < employes.size(); i++) {
             Employe e = (Employe) employes.get(i);
        %>
          <tr>
            <td><%= e.getNom() != null ? e.getNom() : "N/A" %></td>
            <td><%= e.getPrenom() != null ? e.getPrenom() : "N/A" %></td>
            <td><%= e.getEmail() != null ? e.getEmail() : "N/A" %></td>
            <td><%= e.getPoste() != null ? e.getPoste() : "N/A" %></td>
            <td><%= e.getRole() != null ? e.getRole() : "N/A" %></td>
            <td><%= e.getPassword() != null ? "********" : "N/A" %></td>
            <td><%= (e.getDepartement() != null) ? e.getDepartement().getNom() : "Non affecté" %></td>
            <td>
              <button type="button" onclick="fillEditForm(<%= e.getId() %>, 
                '<%= e.getNom() != null ? e.getNom().replace("'", "\\'") : "" %>', 
                '<%= e.getPrenom() != null ? e.getPrenom().replace("'", "\\'") : "" %>', 
                '<%= e.getEmail() != null ? e.getEmail().replace("'", "\\'") : "" %>', 
                '<%= e.getPoste() != null ? e.getPoste().replace("'", "\\'") : "" %>', 
                '<%= e.getRole() != null ? e.getRole() : "" %>', 
                '<%= e.getPassword() != null ? e.getPassword().replace("'", "\\'") : "" %>', 
                <%= (e.getDepartement() != null) ? e.getDepartement().getId() : 0 %>)">🖊️</button>
              <form action="<%= request.getContextPath() %>/EmployeController" method="post" style="display:inline;">
                <input type="hidden" name="op" value="delete"/>
                <input type="hidden" name="id" value="<%= e.getId() %>"/>
                <button type="submit" onclick="return confirm('Supprimer cet employé ?')">❌</button>
              </form>
            </td>
          </tr>
        <% } %>
        </tbody>
      </table>
    </div>

    <button onclick="toggleForm()" style="margin-top: 20px;">➕ Ajouter un Employé</button>
    <div id="empForm" style="display:none;" class="form-container">
      <h3>Nouvel employé</h3>
      <form id="addForm" action="<%= request.getContextPath() %>/EmployeController" method="post">
        <input type="hidden" name="op" value="create"/>
        
        <div class="form-row">
          <div>
            <label for="nom">Nom:</label>
            <input type="text" id="nom" name="nom" required/>
          </div>
          <div>
            <label for="prenom">Prénom:</label>
            <input type="text" id="prenom" name="prenom" required/>
          </div>
        </div>
        
        <div class="form-row">
          <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required/>
          </div>
          <div>
            <label for="poste">Poste:</label>
            <input type="text" id="poste" name="poste" required/>
          </div>
        </div>
        
        <div class="form-row">
          <div>
            <label for="role">Rôle:</label>
            <select id="role" name="role" required>
              <option value="admin">Admin</option>
              <option value="employe">Employé</option>
            </select>
          </div>
          <div>
            <label for="password">Mot de passe:</label>
            <input type="password" id="password" name="password" required/>
          </div>
        </div>
        
        <div class="form-row">
          <div>
            <label for="departementId">Département:</label>
            <select id="departementId" name="departementId" required>
              <option value="">-- Sélectionnez un département --</option>
              <% for (int j = 0; j < departements.size(); j++) {
                   Departement d = (Departement) departements.get(j);
              %>
                <option value="<%= d.getId() %>"><%= d.getNom() %></option>
              <% } %>
            </select>
          </div>
        </div>
        
        <div class="form-buttons">
          <button type="submit">✅ Enregistrer</button>
          <button type="button" onclick="document.getElementById('empForm').style.display='none'">❌ Annuler</button>
        </div>
      </form>
    </div>

    <div id="editForm" style="display:none;" class="form-container">
      <h3>Modifier l'employé</h3>
      <form id="editFormElem" action="<%= request.getContextPath() %>/EmployeController" method="post">
        <input type="hidden" name="op" value="update"/>
        <input type="hidden" name="id" id="editId"/>
        
        <div class="form-row">
          <div>
            <label for="editNom">Nom:</label>
            <input type="text" id="editNom" name="nom" required/>
          </div>
          <div>
            <label for="editPrenom">Prénom:</label>
            <input type="text" id="editPrenom" name="prenom" required/>
          </div>
        </div>
        
        <div class="form-row">
          <div>
            <label for="editEmail">Email:</label>
            <input type="email" id="editEmail" name="email" required/>
          </div>
          <div>
            <label for="editPoste">Poste:</label>
            <input type="text" id="editPoste" name="poste" required/>
          </div>
        </div>
        
        <div class="form-row">
          <div>
            <label for="editRole">Rôle:</label>
            <select id="editRole" name="role" required>
              <option value="admin">Admin</option>
              <option value="employe">Employé</option>
            </select>
          </div>
          <div>
            <label for="editPassword">Mot de passe:</label>
            <input type="password" id="editPassword" name="password" placeholder="Laisser vide pour conserver l'ancien"/>
          </div>
        </div>
        
        <div class="form-row">
          <div>
            <label for="editDepartement">Département:</label>
            <select id="editDepartement" name="departementId" required>
              <option value="">-- Sélectionnez un département --</option>
              <% for (int j = 0; j < departements.size(); j++) {
                   Departement d = (Departement) departements.get(j);
              %>
                <option value="<%= d.getId() %>"><%= d.getNom() %></option>
              <% } %>
            </select>
          </div>
        </div>
        
        <div class="form-buttons">
          <button type="submit">✅ Mettre à jour</button>
          <button type="button" onclick="document.getElementById('editForm').style.display='none'">❌ Annuler</button>
        </div>
      </form>
    </div>
  </main>

  <script>
    function toggleTable() {
      var t = document.getElementById('empTable');
      t.style.display = (t.style.display==='none')?'block':'none';
    }
    
    function toggleForm() {
      var f = document.getElementById('empForm');
      var e = document.getElementById('editForm');
      f.style.display = (f.style.display==='none')?'block':'none';
      if (f.style.display === 'block') {
        e.style.display = 'none';
      }
    }
    
    function fillEditForm(id, nom, prenom, email, poste, role, password, departementId) {
      document.getElementById('empForm').style.display = 'none';
      document.getElementById('editForm').style.display = 'block';
      
      document.getElementById('editId').value = id;
      document.getElementById('editNom').value = nom;
      document.getElementById('editPrenom').value = prenom;
      document.getElementById('editEmail').value = email;
      document.getElementById('editPoste').value = poste;
      document.getElementById('editRole').value = role;
      document.getElementById('editPassword').value = ''; // Clear password field
      document.getElementById('editDepartement').value = departementId;
    }
  </script>
</body>
</html>

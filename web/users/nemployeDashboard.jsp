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
<html lang="fr" data-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Employé - Système Congé Entreprise</title>
    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        /* === Theme Variables === */
        :root {
            /* Professional Dark Theme */
            --bg-color-dark: #1a1d2b;
            --card-bg-dark: #242736;
            --text-color-dark: #e6e8f0;
            --text-muted-dark: #a0a3b1;
            --primary-color-dark: #4f6df5;
            --primary-hover-dark: #3a56d4;
            --secondary-color-dark: #6c757d;
            --input-bg-dark: #2e3241;
            --input-border-dark: #3d4153;
            --input-focus-dark: #4f6df5;
            --particle-color-dark: rgba(79, 109, 245, 0.2);
            --shadow-dark: 0 8px 30px rgba(0, 0, 0, 0.3);
            --footer-bg-dark: #242736;
            --footer-text-dark: #a0a3b1;
            --table-header-dark: #2e3241;
            --table-border-dark: #3d4153;
            --table-row-hover-dark: #2a2e3d;
            --status-pending-dark: #ffc107;
            --status-approved-dark: #28a745;
            --status-rejected-dark: #dc3545;
            --dropdown-bg-dark: #2e3241;
            --dropdown-hover-dark: #3a3f55;
            --dropdown-border-dark: #3d4153;
            
            /* Professional Light Theme */
            --bg-color-light: #f5f7fa;
            --card-bg-light: #ffffff;
            --text-color-light: #333b4d;
            --text-muted-light: #6c757d;
            --primary-color-light: #4361ee;
            --primary-hover-light: #3a56d4;
            --secondary-color-light: #6c757d;
            --input-bg-light: #ffffff;
            --input-border-light: #d1d9e6;
            --input-focus-light: #4361ee;
            --particle-color-light: rgba(67, 97, 238, 0.1);
            --shadow-light: 0 8px 30px rgba(0, 0, 0, 0.1);
            --footer-bg-light: #f8f9fa;
            --footer-text-light: #6c757d;
            --table-header-light: #f8f9fa;
            --table-border-light: #dee2e6;
            --table-row-hover-light: #f1f3f9;
            --status-pending-light: #ffc107;
            --status-approved-light: #28a745;
            --status-rejected-light: #dc3545;
            --dropdown-bg-light: #ffffff;
            --dropdown-hover-light: #f8f9fa;
            --dropdown-border-light: #dee2e6;
        }

        /* === Apply Theme Variables === */
        html[data-theme="dark"] {
            --bg-color: var(--bg-color-dark);
            --card-bg: var(--card-bg-dark);
            --text-color: var(--text-color-dark);
            --text-muted: var(--text-muted-dark);
            --primary-color: var(--primary-color-dark);
            --primary-hover: var(--primary-hover-dark);
            --secondary-color: var(--secondary-color-dark);
            --input-bg: var(--input-bg-dark);
            --input-border: var(--input-border-dark);
            --input-focus: var(--input-focus-dark);
            --particle-color: var(--particle-color-dark);
            --shadow: var(--shadow-dark);
            --footer-bg: var(--footer-bg-dark);
            --footer-text: var(--footer-text-dark);
            --table-header: var(--table-header-dark);
            --table-border: var(--table-border-dark);
            --table-row-hover: var(--table-row-hover-dark);
            --status-pending: var(--status-pending-dark);
            --status-approved: var(--status-approved-dark);
            --status-rejected: var(--status-rejected-dark);
            --dropdown-bg: var(--dropdown-bg-dark);
            --dropdown-hover: var(--dropdown-hover-dark);
            --dropdown-border: var(--dropdown-border-dark);
        }
        
        html[data-theme="light"] {
            --bg-color: var(--bg-color-light);
            --card-bg: var(--card-bg-light);
            --text-color: var(--text-color-light);
            --text-muted: var(--text-muted-light);
            --primary-color: var(--primary-color-light);
            --primary-hover: var(--primary-hover-light);
            --secondary-color: var(--secondary-color-light);
            --input-bg: var(--input-bg-light);
            --input-border: var(--input-border-light);
            --input-focus: var(--input-focus-light);
            --particle-color: var(--particle-color-light);
            --shadow: var(--shadow-light);
            --footer-bg: var(--footer-bg-light);
            --footer-text: var(--footer-text-light);
            --table-header: var(--table-header-light);
            --table-border: var(--table-border-light);
            --table-row-hover: var(--table-row-hover-light);
            --status-pending: var(--status-pending-light);
            --status-approved: var(--status-approved-light);
            --status-rejected: var(--status-rejected-light);
            --dropdown-bg: var(--dropdown-bg-light);
            --dropdown-hover: var(--dropdown-hover-light);
            --dropdown-border: var(--dropdown-border-light);
        }

        /* === Reset & global === */
        * { margin:0; padding:0; box-sizing:border-box; }
        
        body {
            font-family: 'Segoe UI', sans-serif;
            background: var(--bg-color);
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            transition: background 0.3s ease, color 0.3s ease;
        }
        
        a { 
            text-decoration: none;
            color: var(--primary-color);
            transition: color 0.2s ease;
        }
        
        a:hover {
            color: var(--primary-hover);
        }

        /* === Layout === */
        .main-container {
            flex: 1;
            padding: 2rem 1rem;
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }

        /* === Particules === */
        #particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }
        
        .particle {
            position: absolute;
            background: var(--particle-color);
            border-radius: 50%;
            animation-name: float;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
        }
        
        @keyframes float {
            from { transform: translateY(0); }
            to   { transform: translateY(-120vh); }
        }

        /* === Header === */
        .app-header {
            background: var(--card-bg);
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: relative;
            z-index: 10;
        }
        
        .app-brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .app-logo {
            width: 36px;
            height: 36px;
        }
        
        .app-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-color);
            margin: 0;
        }
        
        .app-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        /* User dropdown menu */
        .user-dropdown {
            position: relative;
        }
        
        .user-menu {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            background: var(--input-bg);
            cursor: pointer;
            transition: all 0.2s ease;
        }
        
        .user-menu:hover {
            background: var(--table-row-hover);
        }
        
        .user-avatar {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
        }
        
        .user-name {
            font-weight: 500;
        }
        
        .dropdown-menu {
            position: absolute;
            top: 100%;
            right: 0;
            margin-top: 0.5rem;
            background: var(--dropdown-bg);
            border-radius: 8px;
            box-shadow: var(--shadow);
            min-width: 200px;
            z-index: 100;
            border: 1px solid var(--dropdown-border);
            display: none;
        }
        
        .dropdown-menu.show {
            display: block;
            animation: fadeIn 0.2s ease-out forwards;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        
        .dropdown-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 1rem;
            color: var(--text-color);
            transition: all 0.2s ease;
        }
        
        .dropdown-item:hover {
            background: var(--dropdown-hover);
            color: var(--primary-color);
        }
        
        .dropdown-divider {
            height: 1px;
            background: var(--dropdown-border);
            margin: 0.5rem 0;
        }
        
        .theme-toggle {
            background: transparent;
            border: none;
            color: var(--text-muted);
            cursor: pointer;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background 0.2s ease, color 0.2s ease;
        }
        
        .theme-toggle:hover {
            background: rgba(0,0,0,0.05);
            color: var(--primary-color);
        }

        /* === Dashboard === */
        .welcome-header {
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .welcome-title {
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--text-color);
        }
        
        .dashboard-card {
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .dashboard-card:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow), 0 10px 25px rgba(0,0,0,0.1);
        }
        
        .card-header {
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid var(--table-border);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-color);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .card-body {
            padding: 1.5rem;
        }

        /* === Form === */
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            flex: 1;
            min-width: 250px;
            position: relative;
        }
        
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text-color);
        }
        
        .form-control {
            width: 100%;
            padding: 0.85rem 1rem;
            background: var(--input-bg);
            border: 1px solid var(--input-border);
            border-radius: 6px;
            color: var(--text-color);
            transition: all 0.2s ease;
            font-size: 1rem;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--input-focus);
            box-shadow: 0 0 0 3px rgba(79, 109, 245, 0.15);
        }
        
        .btn {
            padding: 0.85rem 1.5rem;
            border-radius: 6px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            border: none;
        }
        
        .btn-primary {
            background: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background: var(--primary-hover);
        }
        
        .btn-primary:active {
            transform: scale(0.98);
        }
        
        .btn-secondary {
            background: var(--secondary-color);
            color: white;
        }
        
        .btn-secondary:hover {
            background: var(--secondary-color);
            opacity: 0.9;
        }
        
        .btn-sm {
            padding: 0.5rem 0.75rem;
            font-size: 0.875rem;
        }

        /* === Table === */
        .table-responsive {
            overflow-x: auto;
            margin: 0 -1.5rem;
        }
        
        .data-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            min-width: 600px;
        }
        
        .data-table th {
            background: var(--table-header);
            color: var(--text-color);
            font-weight: 600;
            text-align: left;
            padding: 1rem 1.5rem;
            border-bottom: 2px solid var(--table-border);
        }
        
        .data-table td {
            padding: 1rem 1.5rem;
            border-bottom: 1px solid var(--table-border);
            color: var(--text-color);
        }
        
        .data-table tr:hover td {
            background: var(--table-row-hover);
        }
        
        .data-table tr:last-child td {
            border-bottom: none;
        }
        
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.35rem 0.75rem;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 500;
        }
        
        .status-pending {
            background: rgba(255, 193, 7, 0.15);
            color: var(--status-pending);
        }
        
        .status-approved {
            background: rgba(40, 167, 69, 0.15);
            color: var(--status-approved);
        }
        
        .status-rejected {
            background: rgba(220, 53, 69, 0.15);
            color: var(--status-rejected);
        }
        
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
        
        .action-btn {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--input-bg);
            color: var(--text-muted);
            transition: all 0.2s ease;
            cursor: pointer;
        }
        
        .action-btn:hover {
            background: var(--primary-color);
            color: white;
        }
        
        .empty-state {
            text-align: center;
            padding: 2rem;
            color: var(--text-muted);
        }
        
        .empty-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }
        
        /* Form container */
        .form-container {
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
            overflow: hidden;
            padding: 1.5rem;
            border: 1px solid var(--table-border);
        }
        
        .form-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--table-border);
        }
        
        .form-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text-color);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        /* Footer */
        .app-footer {
            background: var(--footer-bg);
            color: var(--footer-text);
            padding: 1.5rem 2rem;
            text-align: center;
            position: relative;
            z-index: 10;
            margin-top: 2rem;
        }
        
        .footer-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }
        
        .footer-links {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap;
            justify-content: center;
        }
        
        .footer-link {
            color: var(--footer-text);
            font-size: 0.9rem;
            transition: color 0.2s ease;
        }
        
        .footer-link:hover {
            color: var(--primary-color);
        }
        
        .footer-social {
            display: flex;
            gap: 1rem;
            margin: 0.5rem 0;
        }
        
        .social-icon {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(0,0,0,0.05);
            color: var(--text-muted);
            transition: all 0.2s ease;
        }
        
        .social-icon:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-3px);
        }
        
        .footer-copyright {
            font-size: 0.85rem;
            opacity: 0.8;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .app-header {
                padding: 1rem;
                flex-direction: column;
                gap: 1rem;
            }
            
            .app-actions {
                width: 100%;
                justify-content: space-between;
            }
            
            .welcome-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .form-row {
                flex-direction: column;
            }
            
            .card-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }
            
            .dropdown-menu {
                width: 100%;
                right: 0;
            }
        }
        
        /* Fix for status badges */
        .status-badge i {
            font-size: 0.9rem;
        }
        
        /* Disabled action buttons */
        .action-btn.disabled {
            opacity: 0.5;
            cursor: not-allowed;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <!-- Particules Background -->
    <div id="particles"></div>
    
    <!-- Header -->
    <header class="app-header">
        <div class="app-brand">
            <!-- SVG Logo -->
            <svg class="app-logo" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <rect x="3" y="4" width="18" height="17" rx="2" fill="var(--primary-color)" opacity="0.2"/>
                <rect x="3" y="4" width="18" height="17" rx="2" stroke="var(--primary-color)" stroke-width="2"/>
                <path d="M8 2V6" stroke="var(--primary-color)" stroke-width="2" stroke-linecap="round"/>
                <path d="M16 2V6" stroke="var(--primary-color)" stroke-width="2" stroke-linecap="round"/>
                <path d="M3 10H21" stroke="var(--primary-color)" stroke-width="2"/>
                <circle cx="12" cy="15" r="2" fill="var(--primary-color)"/>
            </svg>
            <h1 class="app-title">Système Congé Entreprise</h1>
        </div>
        <% 
String successMessage = (String) session.getAttribute("successMessage");
String errorMessage = (String) session.getAttribute("errorMessage");

if (successMessage != null) {
    session.removeAttribute("successMessage");
%>
    <div class="alert alert-success" style="background-color: rgba(40, 167, 69, 0.15); color: var(--status-approved); padding: 1rem; border-radius: 8px; margin-bottom: 1rem; display: flex; align-items: center; gap: 0.75rem;">
        <i class="fas fa-check-circle" style="font-size: 1.25rem;"></i>
        <div><%= successMessage %></div>
    </div>
<% } %>

<% if (errorMessage != null) {
    session.removeAttribute("errorMessage");
%>
    <div class="alert alert-danger" style="background-color: rgba(220, 53, 69, 0.15); color: var(--status-rejected); padding: 1rem; border-radius: 8px; margin-bottom: 1rem; display: flex; align-items: center; gap: 0.75rem;">
        <i class="fas fa-exclamation-circle" style="font-size: 1.25rem;"></i>
        <div><%= errorMessage %></div>
    </div>
<% } %>
        <div class="app-actions">
            <div class="user-dropdown">
                <div class="user-menu" id="userMenuToggle">
                    <div class="user-avatar">
                        <%= employe.getNom().substring(0, 1).toUpperCase() %>
                    </div>
                    <span class="user-name"><%= employe.getNom() %></span>
                    <i class="fas fa-chevron-down"></i>
                </div>
                <div class="dropdown-menu" id="userDropdown">
                    <a href="${pageContext.request.contextPath}/users/profile.jsp" class="dropdown-item">
                        <i class="fas fa-user"></i>
                        <span>Mon profil</span>
                    </a>
                    <a href="#" class="dropdown-item" id="historyLink">
                        <i class="fas fa-history"></i>
                        <span>Historique des demandes</span>
                    </a>
                    <a href="#" class="dropdown-item">
                        <i class="fas fa-cog"></i>
                        <span>Paramètres</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="${pageContext.request.contextPath}/users/login.jsp" class="dropdown-item" id="logoutLink">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Déconnexion</span>
                    </a>
                </div>
            </div>
            <button id="themeToggle" class="theme-toggle" aria-label="Toggle theme">
                <i class="fas fa-moon"></i>
            </button>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-container">
        <div class="welcome-header">
            <h1 class="welcome-title">Bienvenue, <%= employe.getNom() %></h1>
            <div class="welcome-actions">
                <button class="btn btn-primary">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Calendrier des congés</span>
                </button>
            </div>
        </div>
        
        <!-- Section formulaire -->
        <div class="dashboard-card" id="demandeForm">
            <div class="card-header">
                <h2 class="card-title">
                    <i class="fas fa-paper-plane"></i>
                    <span>Faire une demande de congé</span>
                </h2>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/DemandeCongeController" method="POST" id="congeForm">
                    <input type="hidden" name="op" value="create">
                    <input type="hidden" name="employeId" value="<%= employe.getId() %>">
                    <input type="hidden" name="statut" value="En attente">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="dateDebut" class="form-label">Date de début</label>
                            <input type="date" id="dateDebut" name="dateDebut" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="dateFin" class="form-label">Date de fin</label>
                            <input type="date" id="dateFin" name="dateFin" class="form-control" required>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-paper-plane"></i>
                        <span>Envoyer la demande</span>
                    </button>
                </form>
            </div>
        </div>
        
        <!-- Edit Form (Initially Hidden) -->
        <div id="editForm" style="display:none;" class="form-container">
            <div class="form-header">
                <h3 class="form-title">
                    <i class="fas fa-edit"></i>
                    <span>Modifier la demande de congé</span>
                </h3>
            </div>
            
            <form id="editFormElem" action="${pageContext.request.contextPath}/DemandeCongeController" method="POST">
                <input type="hidden" name="op" value="update">
                <input type="hidden" name="employeId" value="<%= employe.getId() %>">
                <input type="hidden" name="oldDateDebut" id="oldDateDebut">
                <input type="hidden" name="oldDateFin" id="oldDateFin">
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="editDateDebut" class="form-label">Date de début</label>
                        <input type="date" id="editDateDebut" name="dateDebut" class="form-control" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="editDateFin" class="form-label">Date de fin</label>
                        <input type="date" id="editDateFin" name="dateFin" class="form-control" required>
                    </div>
                </div>
                
                <input type="hidden" name="statut" value="En attente">
                
                <div class="form-actions">
                    <button type="button" class="btn btn-secondary" id="cancelEditBtn">
                        <i class="fas fa-times"></i>
                        <span>Annuler</span>
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i>
                        <span>Mettre à jour</span>
                    </button>
                </div>
            </form>
        </div>
        
        <!-- Section historique -->
        <div class="dashboard-card" id="historiqueSection">
            <div class="card-header">
                <h2 class="card-title">
                    <i class="fas fa-history"></i>
                    <span>Historique de mes demandes</span>
                </h2>
            </div>
            <div class="card-body">
                <% if (demandes == null || demandes.isEmpty()) { %>
                    <div class="empty-state">
                        <i class="fas fa-calendar-times empty-icon"></i>
                        <p>Aucune demande de congé trouvée.</p>
                    </div>
                <% } else { %>
                    <div class="table-responsive">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Date début</th>
                                    <th>Date fin</th>
                                    <th>Statut</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                 for (DemandeConge dc : demandes) { %>
                                <tr>
                                    <td><%= dc.getDateDebut() %></td>
                                    <td><%= dc.getDateFin() %></td>
                                    <td>
                                        <% 
                                        String statut = dc.getStatut().toLowerCase();
                                        if (statut.equals("en attente")) { 
                                        %>
                                            <span class="status-badge status-pending">
                                                <i class="fas fa-clock"></i> <%= dc.getStatut() %>
                                            </span>
                                        <% } else if (statut.contains("accept") || statut.contains("approuv")) { %>
                                            <span class="status-badge status-approved">
                                                <i class="fas fa-check"></i> <%= dc.getStatut() %>
                                            </span>
                                        <% } else { %>
                                            <span class="status-badge status-rejected">
                                                <i class="fas fa-times"></i> <%= dc.getStatut() %>
                                            </span>
                                        <% } %>
                                    </td>
                                    <td>
                                        <div class="action-buttons">
                                            <a href="#" class="action-btn view-btn" title="Voir détails" data-id="<%= dc.getId() %>">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <% if (statut.equals("en attente")) { %>
                                                <a href="#" class="action-btn edit-btn" title="Modifier" 
                                                   data-id="<%= dc.getId() %>"
                                                   data-debut="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(dc.getDateDebut()) %>"
                                                   data-fin="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(dc.getDateFin()) %>">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="#" class="action-btn delete-btn" title="Annuler"
                                                   onclick="deleteRequest(event, <%= dc.getEmployeId() %>, '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(dc.getDateDebut()) %>', '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(dc.getDateFin()) %>')">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            <% } else { %>
                                                <a href="#" class="action-btn edit-btn disabled" title="Modification impossible">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <a href="#" class="action-btn delete-btn disabled" title="Annulation impossible">
                                                    <i class="fas fa-trash"></i>
                                                </a>
                                            <% } %>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <% } %>
            </div>
        </div>
    </main>
    
    <!-- Footer -->
    <footer class="app-footer">
        <div class="footer-content">
            <div class="footer-links">
                <a href="#" class="footer-link">À propos</a>
                <a href="#" class="footer-link">Confidentialité</a>
                <a href="#" class="footer-link">Conditions d'utilisation</a>
                <a href="#" class="footer-link">Aide & Support</a>
                <a href="#" class="footer-link">Contact</a>
            </div>
            <div class="footer-social">
                <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
            </div>
            <div class="footer-copyright">
                &copy; <%= java.time.Year.now().getValue() %> Entreprise Congé. Tous droits réservés.
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
    // Theme toggle functionality (unchanged)
    const themeToggle = document.getElementById('themeToggle');
    const htmlElement = document.documentElement;
    const toggleIcon = themeToggle.querySelector('i');
    
    // Check for saved theme preference or use default
    const savedTheme = localStorage.getItem('theme') || 'dark';
    htmlElement.setAttribute('data-theme', savedTheme);
    updateThemeIcon(savedTheme);
    
    // Toggle theme
    themeToggle.addEventListener('click', () => {
        const currentTheme = htmlElement.getAttribute('data-theme');
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        
        htmlElement.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);
        updateThemeIcon(newTheme);
    });
    
    function updateThemeIcon(theme) {
        if (theme === 'dark') {
            toggleIcon.className = 'fas fa-sun';
        } else {
            toggleIcon.className = 'fas fa-moon';
        }
    }
    
    // Particules background (unchanged)
    const container = document.getElementById('particles');
    container.innerHTML = ''; // Clear existing particles
    
    for (let i = 0; i < 30; i++) {
        const p = document.createElement('div');
        p.classList.add('particle');
        const size = Math.random() * 10 + 3;
        p.style.width = p.style.height = size + 'px';
        p.style.left = Math.random() * 100 + '%';
        p.style.bottom = '-' + size + 'px';
        p.style.animationDuration = Math.random() * 15 + 10 + 's';
        p.style.animationDelay = Math.random() * 5 + 's';
        container.appendChild(p);
    }
    
    // Create hidden iframe for form submissions
    let hiddenIframe = document.getElementById('hidden-iframe');
    if (!hiddenIframe) {
        hiddenIframe = document.createElement('iframe');
        hiddenIframe.id = 'hidden-iframe';
        hiddenIframe.name = 'hidden-iframe';
        hiddenIframe.style.display = 'none';
        document.body.appendChild(hiddenIframe);
        
        // Add load event listener to the iframe
        hiddenIframe.addEventListener('load', function() {
            // Check if this is not the initial load
            if (hiddenIframe.dataset.submitted) {
                // Hide loading overlay
                hideLoadingOverlay();
                
                // Show success message
                showNotification('Opération effectuée avec succès', 'success');
                
                // Reset the form if it was a create operation
                if (hiddenIframe.dataset.operation === 'create') {
                    document.getElementById('congeForm').reset();
                }
                
                // Hide edit form if it was an update operation
                if (hiddenIframe.dataset.operation === 'update') {
                    document.getElementById('editForm').style.display = 'none';
                    document.getElementById('demandeForm').style.display = 'block';
                }
                
                // Refresh the table data
                setTimeout(function() {
                    window.location.reload();
                }, 1000);
                
                // Reset the submitted flag
                hiddenIframe.dataset.submitted = '';
                hiddenIframe.dataset.operation = '';
            }
        });
    }
    
    // Form validation
    const congeForm = document.getElementById('congeForm');
    const dateDebut = document.getElementById('dateDebut');
    const dateFin = document.getElementById('dateFin');
    
    congeForm.addEventListener('submit', function(e) {
        const start = new Date(dateDebut.value);
        const end = new Date(dateFin.value);
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        
        if (start < today) {
            alert('La date de début ne peut pas être dans le passé.');
            e.preventDefault();
            return;
        }
        
        if (end < start) {
            alert('La date de fin doit être après la date de début.');
            e.preventDefault();
            return;
        }
        
        // Set the target to the hidden iframe
        congeForm.target = 'hidden-iframe';
        
        // Set data attributes to track the submission
        hiddenIframe.dataset.submitted = 'true';
        hiddenIframe.dataset.operation = 'create';
        
        // Show loading indicator
        showLoadingOverlay();
        
        // The form will submit to the iframe
    });
    
    // User dropdown menu (unchanged)
    const userMenuToggle = document.getElementById('userMenuToggle');
    const userDropdown = document.getElementById('userDropdown');
    
    userMenuToggle.addEventListener('click', function() {
        userDropdown.classList.toggle('show');
    });
    
    // Close dropdown when clicking outside (unchanged)
    document.addEventListener('click', function(e) {
        if (!userMenuToggle.contains(e.target) && !userDropdown.contains(e.target)) {
            userDropdown.classList.remove('show');
        }
    });
    
    // History link scroll (unchanged)
    document.getElementById('historyLink').addEventListener('click', function(e) {
        e.preventDefault();
        userDropdown.classList.remove('show');
        document.getElementById('historiqueSection').scrollIntoView({ behavior: 'smooth' });
    });
    
    // Edit functionality
    const editForm = document.getElementById('editForm');
    const editFormElem = document.getElementById('editFormElem');
    const editDateDebut = document.getElementById('editDateDebut');
    const editDateFin = document.getElementById('editDateFin');
    const oldDateDebut = document.getElementById('oldDateDebut');
    const oldDateFin = document.getElementById('oldDateFin');
    const cancelEditBtn = document.getElementById('cancelEditBtn');
    
    // Open edit form (unchanged)
    document.querySelectorAll('.edit-btn:not(.disabled)').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Get the date values from data attributes
            const debut = this.getAttribute('data-debut');
            const fin = this.getAttribute('data-fin');
            
            // Set the form values
            editDateDebut.value = debut;
            editDateFin.value = fin;
            oldDateDebut.value = debut;
            oldDateFin.value = fin;
            
            // Hide the regular form and show the edit form
            document.getElementById('demandeForm').style.display = 'none';
            editForm.style.display = 'block';
            
            // Scroll to the edit form
            editForm.scrollIntoView({ behavior: 'smooth' });
        });
    });
    
    // Cancel edit (unchanged)
    cancelEditBtn.addEventListener('click', function() {
        editForm.style.display = 'none';
        document.getElementById('demandeForm').style.display = 'block';
    });
    
    // Edit form validation
    editFormElem.addEventListener('submit', function(e) {
        const start = new Date(editDateDebut.value);
        const end = new Date(editDateFin.value);
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        
        if (start < today) {
            alert('La date de début ne peut pas être dans le passé.');
            e.preventDefault();
            return;
        }
        
        if (end < start) {
            alert('La date de fin doit être après la date de début.');
            e.preventDefault();
            return;
        }
        
        // Set the target to the hidden iframe
        editFormElem.target = 'hidden-iframe';
        
        // Set data attributes to track the submission
        hiddenIframe.dataset.submitted = 'true';
        hiddenIframe.dataset.operation = 'update';
        
        // Show loading indicator
        showLoadingOverlay();
        
        // The form will submit to the iframe
    });
    
    // Prevent back navigation after logout (unchanged)
    document.getElementById('logoutLink').addEventListener('click', function(e) {
        e.preventDefault();
        
        // Clear browser history
        window.history.pushState(null, "", window.location.href);
        window.onpopstate = function() {
            window.history.pushState(null, "", window.location.href);
        };
        
        // Redirect to logout controller
        window.location.href = "${pageContext.request.contextPath}/DeconnexionController";
    });
    
    // Modify delete buttons
    document.querySelectorAll('.delete-btn:not(.disabled)').forEach(btn => {
        const originalOnclick = btn.getAttribute('onclick');
        btn.removeAttribute('onclick');
        
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Extract parameters from the original onclick
            const match = originalOnclick.match(/deleteRequest$$event,\s*(\d+),\s*'([^']+)',\s*'([^']+)'$$/);
            
            if (match) {
                const employeId = match[1];
                const dateDebut = match[2];
                const dateFin = match[3];
                
                if (confirm('Êtes-vous sûr de vouloir annuler cette demande?')) {
                    // Create a form dynamically
                    const form = document.createElement('form');
                    form.method = 'POST';
                    form.action = '${pageContext.request.contextPath}/DemandeCongeController';
                    form.target = 'hidden-iframe';
                    form.style.display = 'none';
                    
                    // Add operation parameter
                    const opInput = document.createElement('input');
                    opInput.type = 'hidden';
                    opInput.name = 'op';
                    opInput.value = 'delete';
                    form.appendChild(opInput);
                    
                    // Add employeId parameter
                    const employeIdInput = document.createElement('input');
                    employeIdInput.type = 'hidden';
                    employeIdInput.name = 'employeId';
                    employeIdInput.value = employeId;
                    form.appendChild(employeIdInput);
                    
                    // Add dateDebut parameter
                    const dateDebutInput = document.createElement('input');
                    dateDebutInput.type = 'hidden';
                    dateDebutInput.name = 'dateDebut';
                    dateDebutInput.value = dateDebut;
                    form.appendChild(dateDebutInput);
                    
                    // Add dateFin parameter
                    const dateFinInput = document.createElement('input');
                    dateFinInput.type = 'hidden';
                    dateFinInput.name = 'dateFin';
                    dateFinInput.value = dateFin;
                    form.appendChild(dateFinInput);
                    
                    // Set data attributes to track the submission
                    hiddenIframe.dataset.submitted = 'true';
                    hiddenIframe.dataset.operation = 'delete';
                    
                    // Show loading indicator
                    showLoadingOverlay();
                    
                    // Append form to body, submit it, and remove it
                    document.body.appendChild(form);
                    form.submit();
                    document.body.removeChild(form);
                }
            }
        });
    });
});

// Function to show loading overlay
function showLoadingOverlay() {
    // Create loading overlay if it doesn't exist
    let loadingOverlay = document.getElementById('loading-overlay');
    if (!loadingOverlay) {
        loadingOverlay = document.createElement('div');
        loadingOverlay.id = 'loading-overlay';
        loadingOverlay.style.cssText = 
            'position: fixed;' +
            'top: 0;' +
            'left: 0;' +
            'width: 100%;' +
            'height: 100%;' +
            'background-color: rgba(0, 0, 0, 0.5);' +
            'display: flex;' +
            'justify-content: center;' +
            'align-items: center;' +
            'z-index: 9999;';
        
        const spinner = document.createElement('div');
        spinner.style.cssText = 
            'width: 50px;' +
            'height: 50px;' +
            'border: 5px solid rgba(255, 255, 255, 0.3);' +
            'border-radius: 50%;' +
            'border-top-color: var(--primary-color);' +
            'animation: spin 1s ease-in-out infinite;';
        
        // Add spin animation if it doesn't exist
        if (!document.getElementById('spin-animation')) {
            const style = document.createElement('style');
            style.id = 'spin-animation';
            style.textContent = 
                '@keyframes spin {' +
                '    to { transform: rotate(360deg); }' +
                '}';
            document.head.appendChild(style);
        }
        
        loadingOverlay.appendChild(spinner);
        document.body.appendChild(loadingOverlay);
    } else {
        loadingOverlay.style.display = 'flex';
    }
    
    // Hide loading overlay after 3 seconds (in case the iframe load event doesn't fire)
    setTimeout(function() {
        hideLoadingOverlay();
    }, 3000);
}

// Function to hide loading overlay
function hideLoadingOverlay() {
    const loadingOverlay = document.getElementById('loading-overlay');
    if (loadingOverlay) {
        loadingOverlay.style.display = 'none';
    }
}

// Function to show notifications
function showNotification(message, type) {
    // Create notification element
    const notification = document.createElement('div');
    notification.className = 'alert alert-' + (type === 'success' ? 'success' : 'danger');
    notification.style.cssText = 
        'background-color: ' + (type === 'success' ? 'rgba(40, 167, 69, 0.15)' : 'rgba(220, 53, 69, 0.15)') + ';' +
        'color: ' + (type === 'success' ? 'var(--status-approved)' : 'var(--status-rejected)') + ';' +
        'padding: 1rem;' +
        'border-radius: 8px;' +
        'margin-bottom: 1rem;' +
        'display: flex;' +
        'align-items: center;' +
        'gap: 0.75rem;' +
        'position: fixed;' +
        'top: 20px;' +
        'right: 20px;' +
        'z-index: 1000;' +
        'box-shadow: 0 4px 12px rgba(0,0,0,0.15);';
    
    // Add animation styles if they don't exist
    if (!document.getElementById('notification-styles')) {
        const style = document.createElement('style');
        style.id = 'notification-styles';
        style.textContent = 
            '@keyframes fadeIn {' +
            '    from { opacity: 0; transform: translateY(-20px); }' +
            '    to { opacity: 1; transform: translateY(0); }' +
            '}' +
            '@keyframes fadeOut {' +
            '    from { opacity: 1; transform: translateY(0); }' +
            '    to { opacity: 0; transform: translateY(-20px); }' +
            '}';
        document.head.appendChild(style);
    }
    
    notification.style.animation = 'fadeIn 0.3s ease-out forwards';
    
    // Add content
    notification.innerHTML = 
        '<i class="fas fa-' + (type === 'success' ? 'check' : 'exclamation') + '-circle" style="font-size: 1.25rem;"></i>' +
        '<div>' + message + '</div>';
    
    // Add to document
    document.body.appendChild(notification);
    
    // Remove after 3 seconds
    setTimeout(function() {
        notification.style.animation = 'fadeOut 0.3s ease-in forwards';
        setTimeout(function() {
            if (notification.parentNode) {
                document.body.removeChild(notification);
            }
        }, 300);
    }, 3000);
}
    </script>
</body>
</html>

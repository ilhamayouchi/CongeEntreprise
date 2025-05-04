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
<html lang="fr" data-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Demandes de Congé - Système Congé Entreprise</title>
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
            --sidebar-bg-dark: #242736;
            --sidebar-hover-dark: #2a2e3d;
            --sidebar-active-dark: #3a56d4;
            
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
            --sidebar-bg-light: #ffffff;
            --sidebar-hover-light: #f1f3f9;
            --sidebar-active-light: #4361ee;
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
            --sidebar-bg: var(--sidebar-bg-dark);
            --sidebar-hover: var(--sidebar-hover-dark);
            --sidebar-active: var(--sidebar-active-dark);
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
            --sidebar-bg: var(--sidebar-bg-light);
            --sidebar-hover: var(--sidebar-hover-light);
            --sidebar-active: var(--sidebar-active-light);
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
        .app-container {
            display: flex;
            flex: 1;
            position: relative;
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
            pointer-events: none;
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

        /* === Sidebar === */
        .sidebar {
            width: 280px;
            background: var(--sidebar-bg);
            color: var(--text-color);
            height: 100vh;
            position: sticky;
            top: 0;
            left: 0;
            overflow-y: auto;
            transition: all 0.3s ease;
            z-index: 100;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        
        .sidebar-header {
            padding: 1.5rem;
            text-align: center;
            border-bottom: 1px solid var(--table-border);
        }
        
        .sidebar-brand {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.5rem;
        }
        
        .sidebar-logo {
            width: 80px;
            height: 80px;
            object-fit: contain;
        }
        
        .sidebar-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin: 0;
        }
        
        .sidebar-subtitle {
            font-size: 0.9rem;
            color: var(--text-muted);
        }
        
        .sidebar-nav {
            padding: 1.5rem 0;
        }
        
        .nav-section {
            margin-bottom: 1rem;
            padding: 0 1.5rem;
        }
        
        .nav-section-title {
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: var(--text-muted);
            margin-bottom: 0.75rem;
        }
        
        .nav-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .nav-item {
            margin-bottom: 0.25rem;
        }
        
        .nav-link {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.85rem 1.5rem;
            color: var(--text-color);
            border-radius: 6px;
            transition: all 0.2s ease;
        }
        
        .nav-link:hover {
            background: var(--sidebar-hover);
            color: var(--primary-color);
        }
        
        .nav-link.active {
            background: var(--primary-color);
            color: white;
        }
        
        .nav-icon {
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .nav-text {
            font-weight: 500;
        }
        
        .sidebar-footer {
            padding: 1.5rem;
            border-top: 1px solid var(--table-border);
            text-align: center;
        }
        
        .sidebar-footer-text {
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        /* === Main Content === */
        .main-content {
            flex: 1;
            padding: 2rem;
            position: relative;
            z-index: 1;
            overflow-x: hidden;
        }
        
        .page-header {
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .page-title {
            font-size: 1.75rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .page-actions {
            display: flex;
            gap: 1rem;
        }

        /* === Table === */
        .table-container {
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: var(--shadow);
            overflow: hidden;
            margin-bottom: 2rem;
        }
        
        .table-header {
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid var(--table-border);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .table-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .table-actions {
            display: flex;
            gap: 0.75rem;
        }
        
        .table-responsive {
            overflow-x: auto;
        }
        
        .data-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .data-table th {
            background: var(--table-header);
            color: var(--text-color);
            font-weight: 600;
            text-align: left;
            padding: 1rem 1.5rem;
            border-bottom: 2px solid var(--table-border);
            white-space: nowrap;
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
        
        .table-footer {
            padding: 1rem 1.5rem;
            border-top: 1px solid var(--table-border);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .table-info {
            font-size: 0.9rem;
            color: var(--text-muted);
        }
        
        .table-pagination {
            display: flex;
            gap: 0.5rem;
        }
        
        .page-btn {
            width: 36px;
            height: 36px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--input-bg);
            color: var(--text-color);
            border: 1px solid var(--table-border);
            cursor: pointer;
            transition: all 0.2s ease;
        }
        
        .page-btn:hover {
            background: var(--table-row-hover);
            border-color: var(--primary-color);
        }
        
        .page-btn.active {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }

        /* === Status Badges === */
        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
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

        /* === Buttons === */
        .btn {
            padding: 0.75rem 1.25rem;
            border-radius: 6px;
            font-weight: 500;
            font-size: 0.95rem;
            cursor: pointer;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            border: none;
        }
        
        .btn-sm {
            padding: 0.5rem 0.85rem;
            font-size: 0.85rem;
        }
        
        .btn-icon {
            width: 36px;
            height: 36px;
            padding: 0;
            border-radius: 6px;
        }
        
        .btn-primary {
            background: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background: var(--primary-hover);
        }
        
        .btn-secondary {
            background: var(--input-bg);
            color: var(--text-color);
            border: 1px solid var(--table-border);
        }
        
        .btn-secondary:hover {
            background: var(--table-row-hover);
            border-color: var(--primary-color);
        }
        
        .btn-success {
            background: var(--status-approved);
            color: white;
        }
        
        .btn-success:hover {
            background: #218838;
        }
        
        .btn-danger {
            background: var(--status-rejected);
            color: white;
        }
        
        .btn-danger:hover {
            background: #c82333;
        }
        
        .btn-warning {
            background: var(--status-pending);
            color: #212529;
        }
        
        .btn-warning:hover {
            background: #e0a800;
        }
        
        .btn-outline {
            background: transparent;
            border: 1px solid var(--table-border);
            color: var(--text-color);
        }
        
        .btn-outline:hover {
            background: var(--table-row-hover);
            border-color: var(--primary-color);
            color: var(--primary-color);
        }

        /* === Forms === */
        .form-container {
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: var(--shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
            position: relative;
            z-index: 1;
        }
        
        .form-header {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .form-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .form-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            flex: 1;
            min-width: 250px;
        }
        
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text-color);
        }
        
        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border-radius: 6px;
            border: 1px solid var(--input-border);
            background: var(--input-bg);
            color: var(--text-color);
            transition: all 0.2s ease;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(79, 109, 245, 0.2);
        }
        
        .form-select {
            width: 100%;
            padding: 0.75rem 1rem;
            border-radius: 6px;
            border: 1px solid var(--input-border);
            background: var(--input-bg);
            color: var(--text-color);
            transition: all 0.2s ease;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%236c757d' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 1rem center;
            background-size: 16px;
        }
        
        .form-select:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(79, 109, 245, 0.2);
        }
        
        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
            margin-top: 2rem;
        }

        /* === Footer === */
        .app-footer {
            background: var(--footer-bg);
            color: var(--footer-text);
            padding: 1.5rem 2rem;
            text-align: center;
            position: relative;
            z-index: 10;
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

        /* === Action Buttons === */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
        
        .action-btn {
            padding: 0.5rem;
            border-radius: 6px;
            background: transparent;
            border: none;
            color: var(--text-color);
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .action-btn:hover {
            background: var(--table-row-hover);
        }
        
        .action-btn.edit {
            color: var(--primary-color);
        }
        
        .action-btn.edit:hover {
            background: rgba(79, 109, 245, 0.1);
        }
        
        .action-btn.delete {
            color: var(--status-rejected);
        }
        
        .action-btn.delete:hover {
            background: rgba(220, 53, 69, 0.1);
        }

        /* === Alerts === */
        .alert {
            padding: 1rem 1.25rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .alert-success {
            background: rgba(40, 167, 69, 0.15);
            color: var(--status-approved);
            border-left: 4px solid var(--status-approved);
        }
        
        .alert-danger {
            background: rgba(220, 53, 69, 0.15);
            color: var(--status-rejected);
            border-left: 4px solid var(--status-rejected);
        }
        
        .alert-icon {
            font-size: 1.25rem;
        }
        
        .alert-message {
            flex: 1;
        }

        /* === Responsive === */
        @media (max-width: 992px) {
            .sidebar {
                width: 80px;
                overflow: visible;
            }
            
            .sidebar-header {
                padding: 1rem 0.5rem;
            }
            
            .sidebar-title, .sidebar-subtitle, .nav-text, .nav-section-title {
                display: none;
            }
            
            .nav-link {
                padding: 0.85rem;
                justify-content: center;
            }
            
            .sidebar-footer {
                display: none;
            }
            
            .main-content {
                padding: 1.5rem;
            }
        }
        
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
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .form-row {
                flex-direction: column;
                gap: 1rem;
            }
            
            .table-header, .table-footer {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .table-actions, .table-pagination {
                width: 100%;
                justify-content: space-between;
            }
        }
        
        @media (max-width: 576px) {
            .main-content {
                padding: 1rem;
            }
            
            .page-title {
                font-size: 1.5rem;
            }
            
            .section-title {
                font-size: 1.1rem;
            }
        }

        /* Overlay for loading */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            visibility: hidden;
            opacity: 0;
            transition: visibility 0s, opacity 0.3s;
        }
        
        .overlay.active {
            visibility: visible;
            opacity: 1;
        }
        
        .spinner {
            width: 50px;
            height: 50px;
            border: 5px solid var(--card-bg);
            border-top: 5px solid var(--primary-color);
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Success message */
        .success-message {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--status-approved);
            color: white;
            padding: 15px 20px;
            border-radius: 5px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            z-index: 9999;
            display: flex;
            align-items: center;
            gap: 10px;
            transform: translateX(120%);
            transition: transform 0.3s ease-out;
        }
        
        .success-message.show {
            transform: translateX(0);
        }
        
        .error-message {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--status-rejected);
            color: white;
            padding: 15px 20px;
            border-radius: 5px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            z-index: 9999;
            display: flex;
            align-items: center;
            gap: 10px;
            transform: translateX(120%);
            transition: transform 0.3s ease-out;
        }
        
        .error-message.show {
            transform: translateX(0);
        }
    </style>
</head>
<body>
    <!-- Loading Overlay -->
    <div class="overlay" id="loadingOverlay">
        <div class="spinner"></div>
    </div>
    
    <!-- Success Message -->
    <div class="success-message" id="successMessage">
        <i class="fas fa-check-circle"></i>
        <span id="successText">Opération réussie!</span>
    </div>
    
    <!-- Error Message -->
    <div class="error-message" id="errorMessage">
        <i class="fas fa-exclamation-circle"></i>
        <span id="errorText">Une erreur s'est produite!</span>
    </div>
    
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
        <div class="app-actions">
            <div class="user-menu">
                <div class="user-avatar">A</div>
                <span class="user-name">Admin</span>
                <i class="fas fa-chevron-down"></i>
            </div>
            <button id="themeToggle" class="theme-toggle" aria-label="Toggle theme">
                <i class="fas fa-moon"></i>
            </button>
        </div>
    </header>

    <div class="app-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <div class="sidebar-brand">
                    <svg class="sidebar-logo" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="3" y="4" width="18" height="17" rx="2" fill="var(--primary-color)" opacity="0.2"/>
                        <rect x="3" y="4" width="18" height="17" rx="2" stroke="var(--primary-color)" stroke-width="2"/>
                        <path d="M8 2V6" stroke="var(--primary-color)" stroke-width="2" stroke-linecap="round"/>
                        <path d="M16 2V6" stroke="var(--primary-color)" stroke-width="2" stroke-linecap="round"/>
                        <path d="M3 10H21" stroke="var(--primary-color)" stroke-width="2"/>
                        <circle cx="12" cy="15" r="2" fill="var(--primary-color)"/>
                    </svg>
                    <h2 class="sidebar-title">Admin Panel</h2>
                    <p class="sidebar-subtitle">Gestion des congés</p>
                </div>
            </div>
            
            <nav class="sidebar-nav">
                <div class="nav-section">
                    <h3 class="nav-section-title">Gestion</h3>
                    <ul class="nav-list">
                        <li class="nav-item">
                            <a href="<%= request.getContextPath() %>/users/adminDashbord.jsp" class="nav-link">
                                <span class="nav-icon"><i class="fas fa-tachometer-alt"></i></span>
                                <span class="nav-text">Tableau de bord</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<%= request.getContextPath() %>/users/employes.jsp" class="nav-link">
                                <span class="nav-icon"><i class="fas fa-users"></i></span>
                                <span class="nav-text">Employés</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<%= request.getContextPath() %>/users/listeDemande.jsp" class="nav-link active">
                                <span class="nav-icon"><i class="fas fa-calendar-alt"></i></span>
                                <span class="nav-text">Demandes de congés</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<%= request.getContextPath() %>/users/graphe.jsp" class="nav-link">
                                <span class="nav-icon"><i class="fas fa-chart-bar"></i></span>
                                <span class="nav-text">Statistiques</span>
                            </a>
                        </li>
                    </ul>
                </div>
                
                <div class="nav-section">
                    <h3 class="nav-section-title">Paramètres</h3>
                    <ul class="nav-list">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <span class="nav-icon"><i class="fas fa-cog"></i></span>
                                <span class="nav-text">Configuration</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/DeconnexionController" class="nav-link">
                                <span class="nav-icon"><i class="fas fa-sign-out-alt"></i></span>
                                <span class="nav-text">Déconnexion</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            
            <div class="sidebar-footer">
                <p class="sidebar-footer-text">&copy; <%= java.time.Year.now().getValue() %> Entreprise Congé</p>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <div class="page-header">
                <h1 class="page-title">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Gestion des Demandes de Congé</span>
                </h1>
                <div class="page-actions">
                    <button id="toggleTableBtn" class="btn btn-secondary">
                        <i class="fas fa-table"></i>
                        <span>Voir/Cacher la liste</span>
                    </button>
                    <button id="toggleFormBtn" class="btn btn-primary">
                        <i class="fas fa-plus"></i>
                        <span>Ajouter une demande</span>
                    </button>
                </div>
            </div>

            <!-- Alerts -->
            <% if (errorMessage != null) { %>
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle alert-icon"></i>
                    <div class="alert-message"><%= errorMessage %></div>
                </div>
            <% } %>

            <% if (successMessage != null) { %>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle alert-icon"></i>
                    <div class="alert-message"><%= successMessage %></div>
                </div>
            <% } %>

            <!-- Demandes Table -->
            <div id="demandeTable" class="table-container">
                <div class="table-header">
                    <h3 class="table-title">
                        <i class="fas fa-list"></i>
                        <span>Liste des demandes de congé</span>
                    </h3>
                    <div class="table-actions">
                        <div class="btn btn-outline btn-sm">
                            <i class="fas fa-search"></i>
                            <span>Rechercher</span>
                        </div>
                        <div class="btn btn-outline btn-sm">
                            <i class="fas fa-download"></i>
                            <span>Exporter</span>
                        </div>
                    </div>
                </div>
                
                <div class="table-responsive">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>Nom de l'Employé</th>
                                <th>Date de Début</th>
                                <th>Date de Fin</th>
                                <th>Statut</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (demandes.isEmpty()) { %>
                                <tr>
                                    <td colspan="5" style="text-align: center; padding: 2rem;">
                                        <i class="fas fa-calendar-times" style="font-size: 2rem; opacity: 0.3; margin-bottom: 1rem; display: block;"></i>
                                        <p>Aucune demande de congé trouvée</p>
                                    </td>
                                </tr>
                            <% } else { %>
                                <% for (DemandeConge d : demandes) { %>
                                    <tr>
                                        <td><%= d.getEmploye().getNom() + " " + d.getEmploye().getPrenom() %></td>
                                        <td><fmt:formatDate value="<%= d.getDateDebut() %>" pattern="dd/MM/yyyy" /></td>
                                        <td><fmt:formatDate value="<%= d.getDateFin() %>" pattern="dd/MM/yyyy" /></td>
                                       <td>
    <% 
    String statut = d.getStatut().toLowerCase();
    if (statut.contains("attente")) { 
    %>
        <span class="status-badge status-pending">
            <i class="fas fa-clock"></i> En attente
        </span>
    <% } else if (statut.contains("accept") || statut.contains("approuv")) { %>
        <span class="status-badge status-approved">
            <i class="fas fa-check"></i> Acceptée
        </span>
    <% } else if (statut.contains("refus")) { %>
        <span class="status-badge status-rejected">
            <i class="fas fa-times"></i> Refusée
        </span>
    <% } else { %>
        <span><%= d.getStatut() %></span>
    <% } %>
</td>
                                        <td>
                                            <div class="action-buttons">
                                                <button type="button" class="action-btn edit" title="Modifier" onclick="fillEditForm({
                                                    id: '<%= d.getEmployeId() %>',
                                                    employeId: <%= d.getEmployeId() %>,
                                                    dateDebut: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(d.getDateDebut()) %>',
                                                    dateFin: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(d.getDateFin()) %>',
                                                    statut: '<%= d.getStatut() %>'
                                                })">
                                                    <i class="fas fa-edit"></i> Modifier
                                                </button>
                                                <button type="button" class="action-btn delete" title="Supprimer" onclick="deleteRequest(<%= d.getEmployeId() %>, '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(d.getDateDebut()) %>', '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(d.getDateFin()) %>')">
                                                    <i class="fas fa-trash"></i> Supprimer
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                
                <div class="table-footer">
                    <div class="table-info">
                        Affichage de <strong>1-<%= Math.min(10, demandes != null ? demandes.size() : 0) %></strong> sur <strong><%= demandes != null ? demandes.size() : 0 %></strong> demandes
                    </div>
                    <div class="table-pagination">
                        <button class="page-btn" disabled>
                            <i class="fas fa-chevron-left"></i>
                        </button>
                        <button class="page-btn active">1</button>
                        <button class="page-btn">2</button>
                        <button class="page-btn">3</button>
                        <button class="page-btn">
                            <i class="fas fa-chevron-right"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Add Demande Form -->
            <div id="demandeForm" style="display:none;" class="form-container">
                <div class="form-header">
                    <h3 class="form-title">
                        <i class="fas fa-plus-circle"></i>
                        <span>Nouvelle demande de congé</span>
                    </h3>
                </div>
                
                <form id="addForm">
                    <input type="hidden" name="op" value="create"/>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="employeId" class="form-label">Employé</label>
                            <select id="employeId" name="employeId" class="form-select" required>
                                <option value="">-- Sélectionnez un employé --</option>
                                <% for (Employe e : employes) { %>
                                    <option value="<%= e.getId() %>"><%= e.getNom() + " " + e.getPrenom() %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="dateDebut" class="form-label">Date de début</label>
                            <input type="date" id="dateDebut" name="dateDebut" class="form-control" required/>
                        </div>
                        <div class="form-group">
                            <label for="dateFin" class="form-label">Date de fin</label>
                            <input type="date" id="dateFin" name="dateFin" class="form-control" required/>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="statut" class="form-label">Statut</label>
                            <select id="statut" name="statut" class="form-select" required>
                                <option value="En Attente">En Attente</option>
                                <option value="Acceptee">Acceptee</option>
                                <option value="Refusee">Refusee</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="document.getElementById('demandeForm').style.display='none'">
                            <i class="fas fa-times"></i>
                            <span>Annuler</span>
                        </button>
                        <button type="button" class="btn btn-primary" onclick="submitAddForm()">
                            <i class="fas fa-save"></i>
                            <span>Enregistrer</span>
                        </button>
                    </div>
                </form>
            </div>

            <!-- Edit Demande Form -->
            <div id="editForm" style="display:none;" class="form-container">
                <div class="form-header">
                    <h3 class="form-title">
                        <i class="fas fa-edit"></i>
                        <span>Modifier la demande de congé</span>
                    </h3>
                </div>
                
                <form id="editFormElem">
                    <input type="hidden" name="op" value="update"/>
                    <input type="hidden" id="oldDateDebut" name="oldDateDebut">
                    <input type="hidden" id="oldDateFin" name="oldDateFin">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="editEmployeId" class="form-label">Employé</label>
                            <select id="editEmployeId" name="employeId" class="form-select" required>
                                <option value="">-- Sélectionnez un employé --</option>
                                <% for (Employe e : employes) { %>
                                    <option value="<%= e.getId() %>"><%= e.getNom() + " " + e.getPrenom() %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="editDateDebut" class="form-label">Date de début</label>
                            <input type="date" id="editDateDebut" name="dateDebut" class="form-control" required/>
                        </div>
                        <div class="form-group">
                            <label for="editDateFin" class="form-label">Date de fin</label>
                            <input type="date" id="editDateFin" name="dateFin" class="form-control" required/>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label for="editStatut" class="form-label">Statut</label>
                            <select id="editStatut" name="statut" class="form-select" required>
                                <option value="En Attente">En Attente</option>
                                <option value="Acceptee">Acceptee</option>
                                <option value="Refusee">Refusee</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-actions">
                        <button type="button" class="btn btn-secondary" onclick="document.getElementById('editForm').style.display='none'">
                            <i class="fas fa-times"></i>
                            <span>Annuler</span>
                        </button>
                        <button type="button" class="btn btn-primary" onclick="submitEditForm()">
                            <i class="fas fa-save"></i>
                            <span>Mettre à jour</span>
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>
    
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
       // Theme toggle functionality
document.addEventListener('DOMContentLoaded', () => {
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
    
    // Particules background
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
    
    // Toggle table visibility
    document.getElementById('toggleTableBtn').addEventListener('click', function() {
        const table = document.getElementById('demandeTable');
        if (table.style.display === 'none') {
            table.style.display = 'block';
            this.innerHTML = '<i class="fas fa-table"></i><span>Cacher la liste</span>';
        } else {
            table.style.display = 'none';
            this.innerHTML = '<i class="fas fa-table"></i><span>Voir la liste</span>';
        }
    });
    
    // Toggle add form visibility
    document.getElementById('toggleFormBtn').addEventListener('click', function() {
        const addForm = document.getElementById('demandeForm');
        const editForm = document.getElementById('editForm');
        
        editForm.style.display = 'none';
        
        if (addForm.style.display === 'none') {
            addForm.style.display = 'block';
            this.innerHTML = '<i class="fas fa-times"></i><span>Annuler</span>';
        } else {
            addForm.style.display = 'none';
            this.innerHTML = '<i class="fas fa-plus"></i><span>Ajouter une demande</span>';
        }
    });
    
    // User menu (placeholder functionality)
    document.querySelector('.user-menu').addEventListener('click', function() {
        alert('Menu utilisateur à venir');
    });
});

// Show loading overlay
function showLoading() {
    document.getElementById('loadingOverlay').classList.add('active');
}

// Hide loading overlay
function hideLoading() {
    document.getElementById('loadingOverlay').classList.remove('active');
}

// Show success message
function showSuccess(message) {
    const successMsg = document.getElementById('successMessage');
    document.getElementById('successText').textContent = message;
    successMsg.classList.add('show');
    
    setTimeout(() => {
        successMsg.classList.remove('show');
    }, 3000);
}

// Show error message
function showError(message) {
    const errorMsg = document.getElementById('errorMessage');
    document.getElementById('errorText').textContent = message;
    errorMsg.classList.add('show');
    
    setTimeout(() => {
        errorMsg.classList.remove('show');
    }, 3000);
}

// Submit add form via traditional form submission
function submitAddForm() {
    const form = document.getElementById('addForm');
    
    // Validate form
    const employeId = document.getElementById('employeId').value;
    const dateDebut = document.getElementById('dateDebut').value;
    const dateFin = document.getElementById('dateFin').value;
    const statut = document.getElementById('statut').value;
    
    if (!employeId || !dateDebut || !dateFin || !statut) {
        showError('Veuillez remplir tous les champs obligatoires');
        return;
    }
    
    // Validate dates
    if (new Date(dateDebut) > new Date(dateFin)) {
        showError('La date de début doit être antérieure à la date de fin');
        return;
    }
    
    // Show loading
    showLoading();
    
    // Create a traditional form and submit it
    const tempForm = document.createElement('form');
    tempForm.method = 'POST';
    tempForm.action = '<%= contextPath %>/DemandeCongeController';
    tempForm.style.display = 'none';
    
    // Add the form fields
    const opField = document.createElement('input');
    opField.type = 'hidden';
    opField.name = 'op';
    opField.value = 'create';
    tempForm.appendChild(opField);
    
    const employeIdField = document.createElement('input');
    employeIdField.type = 'hidden';
    employeIdField.name = 'employeId';
    employeIdField.value = employeId;
    tempForm.appendChild(employeIdField);
    
    const dateDebutField = document.createElement('input');
    dateDebutField.type = 'hidden';
    dateDebutField.name = 'dateDebut';
    dateDebutField.value = dateDebut;
    tempForm.appendChild(dateDebutField);
    
    const dateFinField = document.createElement('input');
    dateFinField.type = 'hidden';
    dateFinField.name = 'dateFin';
    dateFinField.value = dateFin;
    tempForm.appendChild(dateFinField);
    
    const statutField = document.createElement('input');
    statutField.type = 'hidden';
    statutField.name = 'statut';
    statutField.value = statut;
    tempForm.appendChild(statutField);
    
    // Add the form to the document and submit it
    document.body.appendChild(tempForm);
    tempForm.submit();
}

// Fill edit form with data
function fillEditForm(demande) {
    document.getElementById('demandeForm').style.display = 'none';
    document.getElementById('editForm').style.display = 'block';
    document.getElementById('toggleFormBtn').innerHTML = '<i class="fas fa-plus"></i><span>Ajouter une demande</span>';
    
    document.getElementById('editEmployeId').value = demande.employeId;
    document.getElementById('editDateDebut').value = demande.dateDebut;
    document.getElementById('editDateFin').value = demande.dateFin;
    document.getElementById('oldDateDebut').value = demande.dateDebut;
    document.getElementById('oldDateFin').value = demande.dateFin;
    
    // Fix the status value to match one of the options in the select
    let statusValue = demande.statut.toLowerCase();
    if (statusValue.includes('accept') || statusValue.includes('approuv')) {
        document.getElementById('editStatut').value = 'Acceptee';
    } else if (statusValue.includes('refus')) {
        document.getElementById('editStatut').value = 'Refusee';
    } else {
        document.getElementById('editStatut').value = 'En Attente';
    }
}

// Submit edit form via traditional form submission
function submitEditForm() {
    // Validate form
    const employeId = document.getElementById('editEmployeId').value;
    const dateDebut = document.getElementById('editDateDebut').value;
    const dateFin = document.getElementById('editDateFin').value;
    const statut = document.getElementById('editStatut').value;
    const oldDateDebut = document.getElementById('oldDateDebut').value;
    const oldDateFin = document.getElementById('oldDateFin').value;
    
    if (!employeId || !dateDebut || !dateFin || !statut) {
        showError('Veuillez remplir tous les champs obligatoires');
        return;
    }
    
    // Validate dates
    if (new Date(dateDebut) > new Date(dateFin)) {
        showError('La date de début doit être antérieure à la date de fin');
        return;
    }
    
    // Show loading
    showLoading();
    
    // Create a traditional form and submit it
    const tempForm = document.createElement('form');
    tempForm.method = 'POST';
    tempForm.action = '<%= contextPath %>/DemandeCongeController';
    tempForm.style.display = 'none';
    
    // Add the form fields
    const opField = document.createElement('input');
    opField.type = 'hidden';
    opField.name = 'op';
    opField.value = 'update';
    tempForm.appendChild(opField);
    
    const employeIdField = document.createElement('input');
    employeIdField.type = 'hidden';
    employeIdField.name = 'employeId';
    employeIdField.value = employeId;
    tempForm.appendChild(employeIdField);
    
    const dateDebutField = document.createElement('input');
    dateDebutField.type = 'hidden';
    dateDebutField.name = 'dateDebut';
    dateDebutField.value = dateDebut;
    tempForm.appendChild(dateDebutField);
    
    const dateFinField = document.createElement('input');
    dateFinField.type = 'hidden';
    dateFinField.name = 'dateFin';
    dateFinField.value = dateFin;
    tempForm.appendChild(dateFinField);
    
    const statutField = document.createElement('input');
    statutField.type = 'hidden';
    statutField.name = 'statut';
    statutField.value = statut;
    tempForm.appendChild(statutField);
    
    const oldDateDebutField = document.createElement('input');
    oldDateDebutField.type = 'hidden';
    oldDateDebutField.name = 'oldDateDebut';
    oldDateDebutField.value = oldDateDebut;
    tempForm.appendChild(oldDateDebutField);
    
    const oldDateFinField = document.createElement('input');
    oldDateFinField.type = 'hidden';
    oldDateFinField.name = 'oldDateFin';
    oldDateFinField.value = oldDateFin;
    tempForm.appendChild(oldDateFinField);
    
    // Add the form to the document and submit it
    document.body.appendChild(tempForm);
    tempForm.submit();
}

// Delete request via traditional form submission
function deleteRequest(employeId, dateDebut, dateFin) {
    if (!confirm('Êtes-vous sûr de vouloir supprimer cette demande ?')) {
        return;
    }
    
    // Show loading
    showLoading();
    
    // Create a traditional form and submit it
    const tempForm = document.createElement('form');
    tempForm.method = 'POST';
    tempForm.action = '<%= contextPath %>/DemandeCongeController';
    tempForm.style.display = 'none';
    
    // Add the form fields
    const opField = document.createElement('input');
    opField.type = 'hidden';
    opField.name = 'op';
    opField.value = 'delete';
    tempForm.appendChild(opField);
    
    const employeIdField = document.createElement('input');
    employeIdField.type = 'hidden';
    employeIdField.name = 'employeId';
    employeIdField.value = employeId;
    tempForm.appendChild(employeIdField);
    
    const dateDebutField = document.createElement('input');
    dateDebutField.type = 'hidden';
    dateDebutField.name = 'dateDebut';
    dateDebutField.value = dateDebut;
    tempForm.appendChild(dateDebutField);
    
    const dateFinField = document.createElement('input');
    dateFinField.type = 'hidden';
    dateFinField.name = 'dateFin';
    dateFinField.value = dateFin;
    tempForm.appendChild(dateFinField);
    
    // Add the form to the document and submit it
    document.body.appendChild(tempForm);
    tempForm.submit();
}
    </script>
</body>
</html>

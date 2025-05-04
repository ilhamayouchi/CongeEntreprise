<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr" data-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statistiques des congés - Système Congé Entreprise</title>
    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            --chart-bg-dark: #242736;
            
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
            --chart-bg-light: #ffffff;
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
            --chart-bg: var(--chart-bg-dark);
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
            --chart-bg: var(--chart-bg-light);
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

        /* === Chart Styles === */
        .chart-container {
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: var(--shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
            position: relative;
            z-index: 1;
        }
        
        .chart-header {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .chart-title {
            font-size: 1.25rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .chart-actions {
            display: flex;
            gap: 0.75rem;
        }
        
        .chart-wrapper {
            position: relative;
            height: 400px;
            width: 100%;
        }
        
        .chart-footer {
            margin-top: 1.5rem;
            padding-top: 1rem;
            border-top: 1px solid var(--table-border);
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .chart-info {
            font-size: 0.9rem;
            color: var(--text-muted);
        }
        
        .chart-legend {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .legend-item {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
        }
        
        .legend-color {
            width: 16px;
            height: 16px;
            border-radius: 4px;
        }

        /* === Stats Cards === */
        .stats-row {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            flex: 1;
            min-width: 240px;
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: var(--shadow);
            padding: 1.5rem;
            display: flex;
            align-items: center;
            gap: 1.25rem;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow), 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .stat-icon {
            width: 48px;
            height: 48px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }
        
        .stat-icon.primary {
            background: rgba(79, 109, 245, 0.15);
            color: var(--primary-color);
        }
        
        .stat-icon.success {
            background: rgba(40, 167, 69, 0.15);
            color: var(--status-approved);
        }
        
        .stat-icon.warning {
            background: rgba(255, 193, 7, 0.15);
            color: var(--status-pending);
        }
        
        .stat-icon.danger {
            background: rgba(220, 53, 69, 0.15);
            color: var(--status-rejected);
        }
        
        .stat-content {
            flex: 1;
        }
        
        .stat-value {
            font-size: 1.75rem;
            font-weight: 700;
            margin: 0;
            line-height: 1.2;
        }
        
        .stat-label {
            font-size: 0.9rem;
            color: var(--text-muted);
            margin: 0;
        }
        
        .stat-change {
            display: flex;
            align-items: center;
            gap: 0.35rem;
            font-size: 0.85rem;
            margin-top: 0.5rem;
        }
        
        .stat-change.positive {
            color: var(--status-approved);
        }
        
        .stat-change.negative {
            color: var(--status-rejected);
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
            
            .chart-wrapper {
                height: 350px;
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
            
            .stats-row {
                flex-direction: column;
            }
            
            .chart-header, .chart-footer {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            .chart-actions, .chart-legend {
                width: 100%;
                justify-content: space-between;
            }
            
            .chart-wrapper {
                height: 300px;
            }
        }
        
        @media (max-width: 576px) {
            .main-content {
                padding: 1rem;
            }
            
            .page-title {
                font-size: 1.5rem;
            }
            
            .chart-title {
                font-size: 1.1rem;
            }
            
            .chart-wrapper {
                height: 250px;
            }
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
                            <a href="<%= request.getContextPath() %>/users/listeDemande.jsp" class="nav-link">
                                <span class="nav-icon"><i class="fas fa-calendar-alt"></i></span>
                                <span class="nav-text">Demandes de congés</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="<%= request.getContextPath() %>/users/graphe.jsp" class="nav-link active">
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
                    <i class="fas fa-chart-bar"></i>
                    <span>Statistiques des congés</span>
                </h1>
                <div class="page-actions">
                    <button class="btn btn-outline btn-sm">
                        <i class="fas fa-download"></i>
                        <span>Exporter</span>
                    </button>
                    <button class="btn btn-primary btn-sm">
                        <i class="fas fa-sync-alt"></i>
                        <span>Actualiser</span>
                    </button>
                </div>
            </div>

            <!-- Stats Cards -->
            <div class="stats-row">
                <div class="stat-card">
                    <div class="stat-icon primary">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="stat-content">
                        <h3 class="stat-value" id="totalConges">--</h3>
                        <p class="stat-label">Total des congés</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon success">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div class="stat-content">
                        <h3 class="stat-value" id="congesApprouves">--</h3>
                        <p class="stat-label">Congés approuvés</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon warning">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="stat-content">
                        <h3 class="stat-value" id="congesEnAttente">--</h3>
                        <p class="stat-label">Congés en attente</p>
                    </div>
                </div>
                
                <div class="stat-card">
                    <div class="stat-icon danger">
                        <i class="fas fa-times-circle"></i>
                    </div>
                    <div class="stat-content">
                        <h3 class="stat-value" id="congesRefuses">--</h3>
                        <p class="stat-label">Congés refusés</p>
                    </div>
                </div>
            </div>

            <!-- Main Chart -->
            <div class="chart-container">
                <div class="chart-header">
                    <h3 class="chart-title">
                        <i class="fas fa-chart-bar"></i>
                        <span>Nombre de congés par département</span>
                    </h3>
                    <div class="chart-actions">
                        <button class="btn btn-outline btn-sm" id="viewBarChart">
                            <i class="fas fa-chart-bar"></i>
                            <span>Barres</span>
                        </button>
                        <button class="btn btn-outline btn-sm" id="viewPieChart">
                            <i class="fas fa-chart-pie"></i>
                            <span>Camembert</span>
                        </button>
                        <button class="btn btn-outline btn-sm" id="viewLineChart">
                            <i class="fas fa-chart-line"></i>
                            <span>Ligne</span>
                        </button>
                    </div>
                </div>
                
                <div class="chart-wrapper">
                    <canvas id="departementCongeChart"></canvas>
                </div>
                
                <div class="chart-footer">
                    <div class="chart-info">
                        Données mises à jour le <span id="lastUpdate"><%=new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm").format(new java.util.Date())%></span>
                    </div>
                    <div class="chart-legend" id="chartLegend">
                        <!-- Legend items will be added dynamically -->
                    </div>
                </div>
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
                
                // Update chart colors if chart exists
                if (window.mainChart) {
                    updateChartColors();
                }
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
            
            // Chart functionality
            let chartData = null;
            let chartLabels = [];
            let chartValues = [];
            let chartColors = [];
            let chartType = 'bar';
            let mainChart = null;
            
            // Generate random colors for chart
            function generateColors(count) {
                const colors = [];
                const baseColors = [
                    'rgba(255, 99, 132, 0.7)',
                    'rgba(54, 162, 235, 0.7)',
                    'rgba(255, 206, 86, 0.7)',
                    'rgba(75, 192, 192, 0.7)',
                    'rgba(153, 102, 255, 0.7)',
                    'rgba(255, 159, 64, 0.7)',
                    'rgba(76, 175, 80, 0.7)',
                    'rgba(233, 30, 99, 0.7)',
                    'rgba(3, 169, 244, 0.7)',
                    'rgba(255, 152, 0, 0.7)'
                ];
                
                for (let i = 0; i < count; i++) {
                    colors.push(baseColors[i % baseColors.length]);
                }
                
                return colors;
            }
            
            // Update chart colors based on theme
            function updateChartColors() {
                const theme = document.documentElement.getAttribute('data-theme');
                const gridColor = theme === 'dark' ? 'rgba(255, 255, 255, 0.1)' : 'rgba(0, 0, 0, 0.1)';
                const textColor = theme === 'dark' ? '#e6e8f0' : '#333b4d';
                
                mainChart.options.scales.x.grid.color = gridColor;
                mainChart.options.scales.x.ticks.color = textColor;
                mainChart.options.scales.y.grid.color = gridColor;
                mainChart.options.scales.y.ticks.color = textColor;
                mainChart.options.plugins.legend.labels.color = textColor;
                mainChart.update();
            }
            
            // Create chart
            function createChart(type) {
                const ctx = document.getElementById('departementCongeChart').getContext('2d');
                const theme = document.documentElement.getAttribute('data-theme');
                const gridColor = theme === 'dark' ? 'rgba(255, 255, 255, 0.1)' : 'rgba(0, 0, 0, 0.1)';
                const textColor = theme === 'dark' ? '#e6e8f0' : '#333b4d';
                
                // Destroy existing chart if it exists
                if (mainChart) {
                    mainChart.destroy();
                }
                
                // Chart configuration
                const config = {
                    type: type,
                    data: {
                        labels: chartLabels,
                        datasets: [{
                            label: 'Nombre de congés',
                            data: chartValues,
                            backgroundColor: chartColors,
                            borderColor: chartColors.map(color => color.replace('0.7', '1')),
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                display: type === 'pie',
                                position: 'bottom',
                                labels: {
                                    color: textColor,
                                    font: {
                                        size: 12
                                    },
                                    padding: 20
                                }
                            },
                            tooltip: {
                                callbacks: {
                                    label: function(context) {
                                        return `${context.parsed.y || context.parsed} congé(s)`;
                                    }
                                }
                            }
                        },
                        scales: {
                            y: {
                                display: type !== 'pie',
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Nombre de congés',
                                    color: textColor
                                },
                                ticks: {
                                    stepSize: 1,
                                    precision: 0,
                                    color: textColor
                                },
                                grid: {
                                    color: gridColor
                                }
                            },
                            x: {
                                display: type !== 'pie',
                                title: {
                                    display: true,
                                    text: 'Départements',
                                    color: textColor
                                },
                                ticks: {
                                    color: textColor
                                },
                                grid: {
                                    color: gridColor
                                }
                            }
                        },
                        animation: {
                            duration: 1000,
                            easing: 'easeInOutQuart'
                        }
                    }
                };
                
                // Create chart
                mainChart = new Chart(ctx, config);
                
                // Update legend
                updateLegend();
            }
            
            // Update chart legend
            function updateLegend() {
                const legendContainer = document.getElementById('chartLegend');
                legendContainer.innerHTML = '';
                
                if (chartType === 'pie') {
                    return; // Pie chart has built-in legend
                }
                
                for (let i = 0; i < chartLabels.length; i++) {
                    const legendItem = document.createElement('div');
                    legendItem.className = 'legend-item';
                    
                    const colorBox = document.createElement('span');
                    colorBox.className = 'legend-color';
                    colorBox.style.backgroundColor = chartColors[i];
                    
                    const label = document.createElement('span');
                    label.textContent = chartLabels[i];
                    
                    legendItem.appendChild(colorBox);
                    legendItem.appendChild(label);
                    legendContainer.appendChild(legendItem);
                }
            }
            
            // Fetch chart data
            fetch('/EntrepriseConge/StatistiquesCongesParDepartement')
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(data => {
                    chartData = data;
                    chartLabels = data.map(item => item.nomDepartement);
                    chartValues = data.map(item => item.congeCount);
                    chartColors = generateColors(chartLabels.length);
                    
                    // Create initial chart
                    createChart(chartType);
                    
                    // Update stats cards
                    const totalConges = chartValues.reduce((a, b) => a + b, 0);
                    document.getElementById('totalConges').textContent = totalConges;
                    
                    // Simulate other stats for demo
                    const approuves = Math.floor(totalConges * 0.6);
                    const enAttente = Math.floor(totalConges * 0.3);
                    const refuses = totalConges - approuves - enAttente;
                    
                    document.getElementById('congesApprouves').textContent = approuves;
                    document.getElementById('congesEnAttente').textContent = enAttente;
                    document.getElementById('congesRefuses').textContent = refuses;
                })
                .catch(err => {
                    console.error('Erreur de chargement des données:', err);
                    document.getElementById('departementCongeChart').innerHTML = `
                        <div style="height: 100%; display: flex; align-items: center; justify-content: center; flex-direction: column; gap: 1rem;">
                            <i class="fas fa-exclamation-triangle" style="font-size: 3rem; color: var(--status-pending);"></i>
                            <p>Erreur de chargement des données</p>
                        </div>
                    `;
                });
            
            // Chart type toggle buttons
            document.getElementById('viewBarChart').addEventListener('click', function() {
                chartType = 'bar';
                createChart(chartType);
                highlightActiveButton(this);
            });
            
            document.getElementById('viewPieChart').addEventListener('click', function() {
                chartType = 'pie';
                createChart(chartType);
                highlightActiveButton(this);
            });
            
            document.getElementById('viewLineChart').addEventListener('click', function() {
                chartType = 'line';
                createChart(chartType);
                highlightActiveButton(this);
            });
            
            function highlightActiveButton(activeBtn) {
                const buttons = document.querySelectorAll('.chart-actions .btn');
                buttons.forEach(btn => {
                    btn.classList.remove('btn-primary');
                    btn.classList.add('btn-outline');
                });
                activeBtn.classList.remove('btn-outline');
                activeBtn.classList.add('btn-primary');
            }
            
            // Highlight default button
            document.getElementById('viewBarChart').classList.remove('btn-outline');
            document.getElementById('viewBarChart').classList.add('btn-primary');
        });
    </script>
</body>
</html>

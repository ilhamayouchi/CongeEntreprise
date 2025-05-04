<%@page import="java.util.List"%>
<%@page import="services.DemandeCongeService"%>
<%@page import="entites.Employe"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="fr" data-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion – Système Congé Entreprise</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
            position: relative;
            z-index: 1;
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
        
        .language-selector {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-muted);
            cursor: pointer;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            transition: background 0.2s ease;
        }
        
        .language-selector:hover {
            background: rgba(0,0,0,0.05);
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

        /* === Login Container === */
        .login-container {
            width: 400px;
            background: var(--card-bg);
            border-radius: 10px;
            box-shadow: var(--shadow);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            animation: fadeIn 0.5s ease-out forwards;
        }
        
        .login-container:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow), 0 10px 25px rgba(0,0,0,0.1);
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }
        
        .brand-section {
            background: var(--primary-color);
            text-align: center;
            padding: 2rem 1.5rem;
            position: relative;
        }
        
        .brand-logo {
            width: 70px;
            height: 70px;
            margin: 0 auto 1rem;
            display: block;
            filter: drop-shadow(0 2px 5px rgba(0,0,0,0.2));
        }
        
        .brand-title {
            color: white;
            font-size: 1.8rem;
            margin: 0.5rem 0 0;
            font-weight: 600;
            letter-spacing: -0.5px;
        }
        
        .brand-subtitle {
            color: rgba(255,255,255,0.9);
            font-size: 1rem;
            margin-top: 0.25rem;
        }

        /* === Card === */
        .login-card {
            padding: 2rem;
        }
        
        .login-header {
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .login-header h3 {
            color: var(--text-color);
            font-size: 1.5rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .login-body {
            margin-top: 1.5rem;
        }

        .form-group {
            position: relative;
            margin-bottom: 1.5rem;
        }
        
        .form-control, .form-select {
            width: 100%;
            padding: 0.85rem 1rem;
            background: var(--input-bg);
            border: 1px solid var(--input-border);
            border-radius: 6px;
            color: var(--text-color);
            transition: all 0.2s ease;
            font-size: 1rem;
        }
        
        .form-control:focus, .form-select:focus {
            outline: none;
            border-color: var(--input-focus);
            box-shadow: 0 0 0 3px rgba(79, 109, 245, 0.15);
        }
        
        .form-label {
            position: absolute;
            top: 50%;
            left: 1rem;
            transform: translateY(-50%);
            pointer-events: none;
            transition: all 0.2s ease;
            color: var(--text-muted);
            background: transparent;
            padding: 0 0.25rem;
        }
        
        .focused .form-label,
        .form-control:focus + .form-label,
        .form-select:focus + .form-label {
            top: 0;
            left: 0.75rem;
            transform: translateY(-50%);
            background: var(--card-bg);
            font-size: 0.85rem;
            color: var(--primary-color);
        }
        
        .password-toggle {
            position: absolute;
            top: 50%;
            right: 1rem;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--text-muted);
            transition: color 0.2s ease;
        }
        
        .password-toggle:hover {
            color: var(--primary-color);
        }
        
        .form-check {
            display: flex;
            align-items: center;
            margin-bottom: 1.25rem;
            user-select: none;
        }
        
        .form-check-input {
            margin-right: 0.5rem;
            cursor: pointer;
        }
        
        .form-check-label {
            color: var(--text-muted);
            font-size: 0.9rem;
            cursor: pointer;
        }

        .btn-login {
            width: 100%;
            padding: 0.85rem;
            background: var(--primary-color);
            border: none;
            border-radius: 6px;
            color: white;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.2s ease, transform 0.1s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-login:hover {
            background: var(--primary-hover);
        }
        
        .btn-login:active {
            transform: scale(0.98);
        }
        
        .login-links {
            margin-top: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .login-link {
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            color: var(--primary-color);
            font-size: 0.9rem;
            transition: color 0.2s ease;
        }
        
        .login-link:hover {
            color: var(--primary-hover);
            text-decoration: underline;
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
            color: var(--text-muted);
            font-size: 0.9rem;
        }
        
        .divider::before,
        .divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: var(--input-border);
        }
        
        .divider::before {
            margin-right: 1rem;
        }
        
        .divider::after {
            margin-left: 1rem;
        }
        
        /* Social login buttons */
        .social-login {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .btn-social {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.75rem;
            border-radius: 6px;
            background: var(--input-bg);
            border: 1px solid var(--input-border);
            color: var(--text-color);
            font-weight: 500;
            transition: all 0.2s ease;
            cursor: pointer;
        }
        
        .btn-social:hover {
            background: rgba(0,0,0,0.03);
            border-color: var(--primary-color);
        }
        
        /* Alert styling */
        .alert {
            border-radius: 6px;
            margin-bottom: 1.5rem;
            padding: 1rem;
            border-left: 4px solid transparent;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }
        
        .alert-danger {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
            border-left-color: #dc3545;
        }
        
        /* Footer */
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
        
        /* Responsive */
        @media (max-width: 576px) {
            .login-container {
                width: 100%;
                max-width: 400px;
            }
            
            .app-header {
                padding: 1rem;
            }
            
            .app-title {
                font-size: 1.1rem;
            }
            
            .login-card {
                padding: 1.5rem;
            }
            
            .social-login {
                flex-direction: column;
            }
            
            .footer-links {
                flex-direction: column;
                gap: 0.75rem;
                align-items: center;
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
            <div class="language-selector">
                <i class="fas fa-globe"></i>
                <span>FR</span>
                <i class="fas fa-chevron-down"></i>
            </div>
            <button id="themeToggle" class="theme-toggle" aria-label="Toggle theme">
                <i class="fas fa-moon"></i>
            </button>
        </div>
    </header>

    <!-- Main Content -->
    <main class="main-container">
        <div class="login-container">
            <!-- Brand -->
            <div class="brand-section">
                <!-- SVG Logo -->
                <svg class="brand-logo" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="12" cy="12" r="10" fill="white" opacity="0.2"/>
                    <rect x="6" y="6" width="12" height="12" rx="2" fill="white"/>
                    <path d="M8 4V8" stroke="white" stroke-width="2" stroke-linecap="round"/>
                    <path d="M16 4V8" stroke="white" stroke-width="2" stroke-linecap="round"/>
                    <path d="M6 11H18" stroke="var(--primary-color)" stroke-width="2"/>
                    <circle cx="12" cy="15" r="1.5" fill="var(--primary-color)"/>
                </svg>
                <h1 class="brand-title">Entreprise Congé</h1>
                <p class="brand-subtitle">Gestion des congés professionnels</p>
            </div>
            
            <!-- Card -->
            <div class="login-card">
                <div class="login-header">
                    <h3><i class="fas fa-lock"></i> Connexion</h3>
                </div>
                <div class="login-body">
                    <!-- Messages d'alerte -->
                    <c:if test="${param.error == 'true'}">
                        <div class="alert alert-danger" role="alert">
                            <i class="fas fa-exclamation-triangle"></i>
                            <span>Email ou mot de passe incorrect!</span>
                        </div>
                    </c:if>

                    <!-- Social Login -->
                    <div class="social-login">
                        <button class="btn-social">
                            <i class="fab fa-google"></i>
                            <span>Google</span>
                        </button>
                        <button class="btn-social">
                            <i class="fab fa-microsoft"></i>
                            <span>Microsoft</span>
                        </button>
                    </div>
                    
                    <div class="divider">ou</div>

                    <!-- Formulaire -->
                    <form action="${pageContext.request.contextPath}/LoginController" method="post">
                        <!-- Email -->
                        <div class="form-group">
                            <input type="email" id="email" name="email" class="form-control" required>
                            <label for="email" class="form-label">Adresse email</label>
                        </div>
                        <!-- Mot de passe -->
                        <div class="form-group">
                            <input type="password" id="password" name="mdp" class="form-control" required>
                            <label for="password" class="form-label">Mot de passe</label>
                            <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                        </div>
                        
                        <!-- Remember me -->
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe" name="rememberMe">
                            <label class="form-check-label" for="rememberMe">Se souvenir de moi</label>
                        </div>
                        
                        <!-- Bouton -->
                        <button type="submit" class="btn-login">
                            <i class="fas fa-sign-in-alt"></i>
                            <span>Se connecter</span>
                        </button>
                        
                        <!-- Liens -->
                        <div class="login-links">
                            <a href="${pageContext.request.contextPath}/users/inscription.jsp" class="login-link">
                                <i class="fas fa-user-plus"></i>
                                <span>Créer un compte</span>
                            </a>
                            <a href="${pageContext.request.contextPath}/users/motdepasseOublie.jsp" class="login-link">
                                <i class="fas fa-key"></i>
                                <span>Mot de passe oublié ?</span>
                            </a>
                        </div>
                    </form>
                </div>
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
                &copy; ${java.time.Year.now().getValue()} Entreprise Congé. Tous droits réservés.
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

            // Toggle password visibility
            const toggle = document.getElementById('togglePassword');
            const pwd = document.getElementById('password');
            toggle.addEventListener('click', () => {
                const type = pwd.getAttribute('type') === 'password' ? 'text' : 'password';
                pwd.setAttribute('type', type);
                toggle.classList.toggle('fa-eye-slash');
                toggle.classList.toggle('fa-eye');
            });

            // Floating label
            document.querySelectorAll('.form-group').forEach(group => {
                const inp = group.querySelector('.form-control');
                
                // Initial check for values
                if (inp.value) {
                    group.classList.add('focused');
                }
                
                inp.addEventListener('focus', () => group.classList.add('focused'));
                inp.addEventListener('blur', () => {
                    if (!inp.value) group.classList.remove('focused');
                });
            });
            
            // Language selector (placeholder functionality)
            document.querySelector('.language-selector').addEventListener('click', function() {
                alert('Fonctionnalité de changement de langue à venir');
            });
        });
    </script>
</body>
</html>
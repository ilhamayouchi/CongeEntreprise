<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr" data-theme="dark">
<head>
    <meta charset="UTF-8">
    <title>Inscription – Gestion des Congés</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --bg-primary: #1a1d29;
            --bg-secondary: #242736;
            --bg-form: #2a2e3f;
            --text-primary: #ffffff;
            --text-secondary: #b4b7c5;
            --accent-color: #4d7cfe;
            --accent-hover: #3a69eb;
            --border-color: #3a3f55;
            --input-bg: #242736;
            --danger-color: #dc3545;
            --success-color: #28a745;
        }

        [data-theme="light"] {
            --bg-primary: #f5f7fa;
            --bg-secondary: #ffffff;
            --bg-form: #ffffff;
            --text-primary: #333333;
            --text-secondary: #666666;
            --accent-color: #4d7cfe;
            --accent-hover: #3a69eb;
            --border-color: #e1e5ee;
            --input-bg: #f5f7fa;
            --danger-color: #dc3545;
            --success-color: #28a745;
        }

        * { 
            margin: 0; 
            padding: 0; 
            box-sizing: border-box;
        }
        
        body { 
            font-family: 'Segoe UI', sans-serif; 
            background: var(--bg-primary); 
            color: var(--text-primary); 
            height: 100vh; 
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }
        
        .particle { 
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation-name: float;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
        }
        
        @keyframes float { 
            from { transform: translateY(0); } 
            to { transform: translateY(-120vh); }
        }
        
        .theme-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            background: transparent;
            border: none;
            color: var(--text-secondary);
            font-size: 1.2rem;
            cursor: pointer;
            z-index: 100;
        }
        
        .registration-container {
            width: 400px;
            background: var(--bg-form);
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .brand-section {
            background: var(--accent-color);
            text-align: center;
            padding: 2rem;
        }
        
        .brand-icon {
            font-size: 2.5rem;
            color: white;
            margin-bottom: 0.5rem;
        }
        
        .brand-title { 
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0.5rem 0 0.25rem;
        }
        
        .brand-subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.9rem;
        }
        
        .registration-card {
            padding: 2rem;
        }
        
        .registration-header {
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .registration-header h3 { 
            color: var(--text-primary);
            font-size: 1.2rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .form-group { 
            position: relative;
            margin-bottom: 1.5rem;
        }
        
        .form-control, .form-select {
            width: 100%;
            padding: 0.75rem 1rem;
            background: var(--input-bg);
            border: 1px solid var(--border-color);
            border-radius: 4px;
            color: var(--text-primary);
            font-size: 0.95rem;
            transition: all 0.2s;
        }
        
        .form-control:focus, .form-select:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 2px rgba(77, 124, 254, 0.2);
        }
        
        .form-label {
            position: absolute;
            top: 50%;
            left: 1rem;
            transform: translateY(-50%);
            pointer-events: none;
            transition: all 0.2s;
            color: var(--text-secondary);
            font-size: 0.95rem;
            background: transparent;
        }
        
        .focused .form-label, 
        .form-control:focus + .form-label, 
        .form-select:focus + .form-label,
        .form-control:not(:placeholder-shown) + .form-label {
            top: -0.5rem;
            left: 0.5rem;
            font-size: 0.8rem;
            padding: 0 0.25rem;
            color: var(--accent-color);
            background: var(--bg-form);
        }
        
        .password-toggle {
            position: absolute;
            top: 50%;
            right: 1rem;
            transform: translateY(-50%);
            cursor: pointer;
            color: var(--text-secondary);
        }
        
        .btn-register { 
            width: 100%;
            padding: 0.75rem;
            background: var(--accent-color);
            border: none;
            border-radius: 4px;
            color: white;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-register:hover {
            background: var(--accent-hover);
        }
        
        .registration-links {
            margin-top: 1.5rem;
            text-align: center;
        }
        
        .registration-link { 
            display: inline-block;
            color: var(--accent-color);
            font-size: 0.9rem;
            text-decoration: none;
            transition: color 0.2s;
        }
        
        .registration-link:hover {
            color: var(--accent-hover);
            text-decoration: underline;
        }
        
        .alert {
            padding: 0.75rem 1rem;
            margin-bottom: 1.5rem;
            border-radius: 4px;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .alert-danger {
            background-color: rgba(220, 53, 69, 0.1);
            color: var(--danger-color);
            border: 1px solid rgba(220, 53, 69, 0.2);
        }
        
        .alert-success {
            background-color: rgba(40, 167, 69, 0.1);
            color: var(--success-color);
            border: 1px solid rgba(40, 167, 69, 0.2);
        }
        
        .divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
            color: var(--text-secondary);
            font-size: 0.9rem;
        }
        
        .divider::before, .divider::after {
            content: "";
            flex: 1;
            height: 1px;
            background: var(--border-color);
        }
        
        .divider::before {
            margin-right: 1rem;
        }
        
        .divider::after {
            margin-left: 1rem;
        }
        
        .footer {
            margin-top: 2rem;
            text-align: center;
            color: var(--text-secondary);
            font-size: 0.8rem;
        }
        
        .footer a {
            color: var(--text-secondary);
            text-decoration: none;
            margin: 0 0.5rem;
        }
        
        .footer a:hover {
            text-decoration: underline;
        }
        
        .social-links {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .social-link {
            color: var(--text-secondary);
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <button class="theme-toggle" id="themeToggle">
        <i class="fas fa-moon" id="themeIcon"></i>
    </button>
    
    <div class="particles" id="particles"></div>
    
    <div class="registration-container">
        <div class="brand-section">
            <i class="fas fa-calendar-check brand-icon"></i>
            <h1 class="brand-title">Entreprise Congé</h1>
            <p class="brand-subtitle">Gestion des congés professionnels</p>
        </div>
        <div class="registration-card">
            <div class="registration-header">
                <h3><i class="fas fa-user-plus"></i> Nouveau compte</h3>
            </div>
            <div class="registration-body">
                <c:if test="${not empty success}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle"></i> ${success}
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-circle"></i> ${error}
                    </div>
                </c:if>
                <form action="${pageContext.request.contextPath}/InscriptionController" method="post">
                    <div class="form-group">
                        <input type="text" id="nom" name="nom" class="form-control" placeholder=" " required>
                        <label for="nom" class="form-label">Nom</label>
                    </div>
                    <div class="form-group">
                        <input type="text" id="prenom" name="prenom" class="form-control" placeholder=" " required>
                        <label for="prenom" class="form-label">Prénom</label>
                    </div>
                    <div class="form-group">
                        <input type="email" id="email" name="email" class="form-control" placeholder=" " required>
                        <label for="email" class="form-label">Adresse email</label>
                    </div>
                    <div class="form-group">
                        <input type="password" id="password" name="password" class="form-control" placeholder=" " required>
                        <label for="password" class="form-label">Mot de passe</label>
                        <i class="fas fa-eye password-toggle" id="togglePassword"></i>
                    </div>
                    <div class="form-group role-select">
                        <select name="role" id="role" class="form-select" required>
                            <option value="" disabled selected></option>
                            <option value="admin">Admin</option>
                            <option value="employe">Employé</option>
                        </select>
                        <label for="role" class="form-label">Rôle</label>
                    </div>
                    <button type="submit" class="btn-register">
                        <i class="fas fa-user-plus"></i>S'inscrire
                    </button>
                    <div class="registration-links">
                        <a href="${pageContext.request.contextPath}/login.jsp" class="registration-link">
                            <i class="fas fa-sign-in-alt"></i> Déjà un compte ? Connectez-vous
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="footer">
        <div class="social-links">
            <a href="#" class="social-link"><i class="fab fa-linkedin"></i></a>
            <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
            <a href="#" class="social-link"><i class="fab fa-facebook"></i></a>
            <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
        </div>
        <div style="margin-top: 0.5rem;">
            © Entreprise Congé. Tous droits réservés.
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Create particles
            const container = document.getElementById('particles');
            for (let i = 0; i < 25; i++) {
                const p = document.createElement('div');
                p.classList.add('particle');
                const size = Math.random() * 5 + 2;
                p.style.width = p.style.height = size + 'px';
                p.style.left = Math.random() * 100 + '%';
                p.style.bottom = '-' + size + 'px';
                p.style.animationDuration = Math.random() * 15 + 10 + 's';
                p.style.animationDelay = Math.random() * 5 + 's';
                container.appendChild(p);
            }
            
            // Password toggle
            const toggle = document.getElementById('togglePassword');
            const pwd = document.getElementById('password');
            toggle.addEventListener('click', () => {
                const type = pwd.getAttribute('type') === 'password' ? 'text' : 'password';
                pwd.setAttribute('type', type);
                toggle.classList.toggle('fa-eye-slash');
                toggle.classList.toggle('fa-eye');
            });
            
            // Form field focus effects
            document.querySelectorAll('.form-group').forEach(group => {
                const inp = group.querySelector('.form-control, .form-select');
                if (inp.value) {
                    group.classList.add('focused');
                }
                inp.addEventListener('focus', () => group.classList.add('focused'));
                inp.addEventListener('blur', () => { 
                    if (!inp.value) group.classList.remove('focused'); 
                });
            });
            
            // Theme toggle
            const themeToggle = document.getElementById('themeToggle');
            const themeIcon = document.getElementById('themeIcon');
            const htmlElement = document.documentElement;
            
            // Check for saved theme preference or use default
            const savedTheme = localStorage.getItem('theme') || 'dark';
            htmlElement.setAttribute('data-theme', savedTheme);
            updateThemeIcon(savedTheme);
            
            themeToggle.addEventListener('click', () => {
                const currentTheme = htmlElement.getAttribute('data-theme');
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
                
                htmlElement.setAttribute('data-theme', newTheme);
                localStorage.setItem('theme', newTheme);
                updateThemeIcon(newTheme);
            });
            
            function updateThemeIcon(theme) {
                if (theme === 'dark') {
                    themeIcon.classList.remove('fa-sun');
                    themeIcon.classList.add('fa-moon');
                } else {
                    themeIcon.classList.remove('fa-moon');
                    themeIcon.classList.add('fa-sun');
                }
            }
            
            // Focus first field
            document.getElementById('nom').focus();
        });
    </script>
</body>
</html>
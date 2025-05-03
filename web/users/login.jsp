<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion – Système Congé Entreprise</title>
    <!-- Bootstrap & FontAwesome CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        /* === Reset & global === */
        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #1f2833;
            color: #c5c6c7;
            height:100vh;
            overflow:hidden;
        }
        a { text-decoration:none; }

        /* === Particules === */
        #particles {
            position: absolute; width:100%; height:100%;
            overflow:hidden; z-index:-1;
        }
        .particle {
            position: absolute;
            background: rgba(255,255,255,0.2);
            border-radius:50%;
            animation-name: float;
            animation-timing-function: linear;
        }
        @keyframes float {
            from { transform: translateY(0); }
            to   { transform: translateY(-120vh); }
        }

        /* === Container === */
        .login-container {
            width: 360px;
            margin: 5% auto;
            background: #0b0c10;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.6);
            overflow: hidden;
        }
        .brand-section {
            background: #45a29e;
            text-align: center;
            padding: 1.5rem;
        }
        .brand-icon { font-size: 2rem; color:#0b0c10; }
        .brand-title {
            color: #0b0c10; font-size: 1.8rem;
            margin-top: 0.5rem;
        }
        .brand-subtitle { color:#0b0c10; opacity:0.8; }

        /* === Card === */
        .login-card { padding: 1.5rem; }
        .login-header h3 { color: #fff; }
        .login-body { margin-top:1rem; }

        .form-group {
            position: relative;
            margin-bottom:1.5rem;
        }
        .form-control, .form-select {
            width:100%; padding:0.75rem;
            background: #1f2833; border:1px solid #45a29e;
            border-radius:4px; color:#c5c6c7;
        }
        .form-label {
            position:absolute; top:50%; left:0.75rem;
            transform:translateY(-50%);
            pointer-events:none; transition: all .2s;
            color: #c5c6c7;
        }
        .focused .form-label,
        .form-control:focus + .form-label,
        .form-select:focus + .form-label {
            top:-0.6rem; left:0.6rem;
            background:#0b0c10; padding:0 0.25rem;
            font-size:0.85rem; color:#45a29e;
        }
        .password-toggle {
            position:absolute; top:50%; right:0.75rem;
            transform:translateY(-50%); cursor:pointer;
            color:#c5c6c7;
        }

        .btn-login {
            width:100%; padding:0.75rem;
            background:#45a29e; border:none;
            border-radius:4px; color:#0b0c10;
            font-weight:bold;
        }
        .login-links {
            margin-top:1rem; text-align:center;
        }
        .login-link {
            display:inline-block; margin:0 .5rem;
            color:#66fcf1; font-size:0.9rem;
        }
    </style>
</head>
<body>
    <!-- Particules -->
    <div id="particles"></div>

    <div class="login-container animate__animated animate__fadeIn">
        <!-- Brand -->
        <div class="brand-section">
            <i class="fas fa-building brand-icon"></i>
            <h1 class="brand-title">Entreprise Congé</h1>
            <p class="brand-subtitle">Gestion des congés</p>
        </div>
        <!-- Card -->
        <div class="login-card">
            <div class="login-header">
                <h3><i class="fas fa-lock"></i> Connexion</h3>
            </div>
            <div class="login-body">
                <!-- Messages d’alerte -->
                <c:if test="${param.error == 'true'}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i> Email ou mot de passe incorrect!
                    </div>
                </c:if>

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
                    <!-- Bouton -->
                    <button type="submit" class="btn btn-login">
                        <i class="fas fa-sign-in-alt me-2"></i> Se connecter
                    </button>
                    <!-- Liens -->
                    <div class="login-links">
                        <a href="${pageContext.request.contextPath}/users/inscription.jsp" class="login-link">
                            <i class="fas fa-user-plus me-1"></i>Créer un compte
                        </a>
                        <a href="${pageContext.request.contextPath}/users/motdepasseOublie.jsp" class="login-link">
                            <i class="fas fa-key me-1"></i>Mot de passe oublié ?
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Particules background
        document.addEventListener('DOMContentLoaded', () => {
            const container = document.getElementById('particles');
            for (let i = 0; i < 25; i++) {
                const p = document.createElement('div');
                p.classList.add('particle');
                const size = Math.random()*12 + 4;
                p.style.width = p.style.height = size + 'px';
                p.style.left = Math.random()*100 + '%';
                p.style.bottom = '-' + size + 'px';
                p.style.animationDuration = Math.random()*10 + 8 + 's';
                p.style.animationDelay = Math.random()*5 + 's';
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
                inp.addEventListener('focus', () => group.classList.add('focused'));
                inp.addEventListener('blur', () => {
                    if (!inp.value) group.classList.remove('focused');
                });
            });
            document.getElementById('email').focus();
        });
    </script>
</body>
</html>

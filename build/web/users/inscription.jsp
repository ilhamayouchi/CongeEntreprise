<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription – Gestion des Congés</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin:0; padding:0; box-sizing:border-box;
        }
        body { 
            font-family: 'Segoe UI', sans-serif; background: #1f2833; color: #c5c6c7; height:100vh; overflow:hidden;
        }
        .particles {
            position: absolute; width:100%; height:100%; overflow:hidden; z-index:-1;
        }
        .particle { 
            position: absolute; background: rgba(255,255,255,0.2); border-radius:50%; animation-name: float; animation-timing-function: linear; }
        @keyframes float { from { transform: translateY(0); } to { transform: translateY(-120vh); 
                } }
        .registration-container {
            width: 360px; margin: 5% auto; background: #0b0c10; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.6); overflow: hidden; }
        .brand-section {
            background: #45a29e; text-align: center; padding: 1.5rem; }
        .brand-icon {
            font-size: 2rem; color:#0b0c10; }
        .brand-title { 
            color: #0b0c10; font-size: 1.8rem; margin-top: 0.5rem; }
        .brand-subtitle {
            color:#0b0c10; opacity:0.8; }
        .registration-card {
            padding: 1.5rem; }
        .registration-header h3 { 
            color: #fff; }
        .form-group { 
            position: relative; margin-bottom:1.5rem; }
        .form-control, .form-select {
            width:100%; padding:0.75rem; background: #1f2833; border:1px solid #45a29e; border-radius:4px; color:#c5c6c7; }
        .form-label {
            position:absolute; top:50%; left:0.75rem; transform:translateY(-50%); pointer-events:none; transition: all .2s; color: #c5c6c7; }
        .focused .form-label, .form-control:focus + .form-label, .form-select:focus + .form-label {
            top:-0.6rem; left:0.6rem; background:#0b0c10; padding:0 0.25rem; font-size:0.85rem; color:#45a29e; }
        .password-toggle {
            position:absolute; top:50%; right:0.75rem; transform:translateY(-50%); cursor:pointer; color:#c5c6c7; }
        .btn-register { 
            width:100%; padding:0.75rem; background:#45a29e; border:none; border-radius:4px; color:#0b0c10; font-weight:bold; }
        .registration-links {
            margin-top:1rem; text-align:center; }
        .registration-link { 
            display:inline-block; margin:0 .5rem; color:#66fcf1; font-size:0.9rem; }
        .alert {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 4px;
        }
        .alert-danger {
            background-color: rgba(220, 53, 69, 0.2);
            color: #dc3545;
            border: 1px solid #dc3545;
        }
        .alert-success {
            background-color: rgba(40, 167, 69, 0.2);
            color: #28a745;
            border: 1px solid #28a745;
        }
    </style>
</head>
<body>
    <div class="particles" id="particles"></div>
    <div class="registration-container animate__animated animate__fadeIn">
        <div class="brand-section">
            <i class="fas fa-calendar-check brand-icon"></i>
            <h1 class="brand-title">Gestion des Congés</h1>
            <p class="brand-subtitle">Inscription</p>
        </div>
        <div class="registration-card">
            <div class="registration-header">
                <h3><i class="fas fa-user-plus"></i> Nouveau compte</h3>
            </div>
            <div class="registration-body">
                <c:if test="${not empty success}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i> ${success}
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i> ${error}
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
                            <option value="" disabled selected>Choisissez le rôle</option>
                            <option value="admin">Admin</option>
                            <option value="employe">Employé</option>
                        </select>
                        <label for="role" class="form-label">Rôle</label>
                    </div>
                    <button type="submit" class="btn-register">
                        <i class="fas fa-user-plus me-2"></i>S'inscrire
                    </button>
                    <div class="registration-links">
                        <a href="${pageContext.request.contextPath}/login.jsp" class="registration-link">
                            <i class="fas fa-sign-in-alt me-1"></i>Déjà un compte ? Connectez-vous
                        </a>
                    </div>
                </form>
            </div>
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
                const size = Math.random() * 12 + 4;
                p.style.width = p.style.height = size + 'px';
                p.style.left = Math.random() * 100 + '%';
                p.style.bottom = '-' + size + 'px';
                p.style.animationDuration = Math.random() * 10 + 8 + 's';
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
            
            // Focus first field
            document.getElementById('nom').focus();
        });
    </script>
</body>
</html>

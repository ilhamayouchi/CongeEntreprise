<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mot de passe oublié – Gestion des Congés</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin:0; padding:0; box-sizing:border-box; }
        body { 
            font-family: 'Segoe UI', sans-serif; background: #1f2833; color: #c5c6c7; height:100vh; overflow:hidden; }
        .particles {
            position: absolute; width:100%; height:100%; overflow:hidden; z-index:-1; }
        .particle {
            position: absolute; background: rgba(255,255,255,0.2); border-radius:50%; animation-name: float; animation-timing-function: linear; }
        @keyframes float { from { transform: translateY(0); } to { transform: translateY(-120vh); } }
        .forgot-password-container {
            width: 360px; margin: 5% auto; background: #0b0c10; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.6); overflow: hidden; }
        .brand-section { 
            background: #45a29e; text-align: center; padding: 1.5rem; }
        .brand-icon {
            font-size: 2rem; color:#0b0c10; }
        .brand-title { 
            color: #0b0c10; font-size: 1.8rem; margin-top: 0.5rem; }
        .brand-subtitle { 
            color:#0b0c10; opacity:0.8; }
        .forgot-password-card { 
            padding: 1.5rem; }
        .forgot-password-header h3 {
            color: #fff; }
        .form-group { 
            position: relative; margin-bottom:1.5rem; }
        .form-control { 
            width:100%; padding:0.75rem; background: #1f2833; border:1px solid #45a29e; border-radius:4px; color:#c5c6c7; }
        .form-label {
            position:absolute; top:50%; left:0.75rem; transform:translateY(-50%); pointer-events:none; transition: all .2s; color: #c5c6c7; }
        .focused .form-label, .form-control:focus + .form-label { 
            top:-0.6rem; left:0.6rem; background:#0b0c10; padding:0 0.25rem; font-size:0.85rem; color:#45a29e; }
        .btn-reset { 
            width:100%; padding:0.75rem; background:#45a29e; border:none; border-radius:4px; color:#0b0c10; font-weight:bold; }
        .forgot-password-links { 
            margin-top:1rem; text-align:center; }
        .forgot-password-link {
            display:inline-block; margin:0 .5rem; color:#66fcf1; font-size:0.9rem; }
    </style>
</head>
<body>
    <div class="particles" id="particles"></div>
    <div class="forgot-password-container animate__animated animate__fadeIn">
        <div class="brand-section">
            <i class="fas fa-calendar-check brand-icon"></i>
            <h1 class="brand-title">Gestion des Congés</h1>
            <p class="brand-subtitle">Réinitialiser mot de passe</p>
        </div>
        <div class="forgot-password-card">
            <div class="forgot-password-header">
                <h3><i class="fas fa-key"></i> Mot de passe oublié</h3>
            </div>
            <div class="forgot-password-body">
                <c:if test="${param.success == 'reset'}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i> Email de réinitialisation envoyé.
                    </div>
                </c:if>
                <c:if test="${param.error == 'email'}">
                    <div class="alert alert-danger" role="alert">
                        <i class="fas fa-exclamation-circle me-2"></i> Adresse email introuvable.
                    </div>
                </c:if>
                <form action="${pageContext.request.contextPath}/ForgotPasswordController" method="post">
                    <div class="form-group">
                        <input type="email" id="email" name="email" class="form-control" placeholder=" " required>
                        <label for="email" class="form-label">Adresse email</label>
                    </div>
                    <button type="submit" class="btn-reset">
                        <i class="fas fa-paper-plane me-2"></i>Envoyer le lien
                    </button>
                    <div class="forgot-password-links">
                        <a href="${pageContext.request.contextPath}/users/login.jsp" class="forgot-password-link">
                            <i class="fas fa-sign-in-alt me-1"></i>Se connecter
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
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
            document.querySelectorAll('.form-group').forEach(group => {
                const inp = group.querySelector('.form-control');
                inp.addEventListener('focus', () => group.classList.add('focused'));
                inp.addEventListener('blur', () => { if (!inp.value) group.classList.remove('focused'); });
            });
            document.getElementById('email').focus();
        });
    </script>
</body>
</html>

<%-- 
    Document   : newjsp
    Created on : 16 avr. 2025, 17:27:04
    Author     : hp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Connexion</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f9ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-image: linear-gradient(135deg, rgba(173, 216, 230, 0.1) 0%, rgba(135, 206, 250, 0.1) 100%);
        }

        .login-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 32px;
            width: 100%;
            max-width: 420px;
            padding: 20px;
        }

        .logo-container {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-bottom: 16px;
        }

        .logo {
            max-width: 280px;
            max-height: 120px;
            object-fit: contain;
        }

        form {
            background-color: #ffffff;
            border: 2px solid #b3e0ff;
            border-radius: 16px;
            padding: 40px;
            width: 100%;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        form:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
        }

        h2 {
            color: #1a73e8;
            font-size: 28px;
            margin-bottom: 24px;
            font-weight: 600;
            position: relative;
            padding-bottom: 8px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background-color: #64b5f6;
            border-radius: 3px;
        }

        .form-group {
            margin-bottom: 24px;
            text-align: left;
        }

        label {
            font-size: 16px;
            color: #1a73e8;
            margin-bottom: 8px;
            display: block;
            font-weight: 500;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 16px;
            margin-top: 8px;
            border: 1px solid #b3e0ff;
            border-radius: 8px;
            font-size: 16px;
            color: #333333;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #64b5f6;
            box-shadow: 0 0 0 3px rgba(100, 181, 246, 0.2);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #4285f4;
            border: none;
            color: #ffffff;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .btn:hover {
            background-color: #1a73e8;
            transform: translateY(-2px);
        }

        .btn:active {
            transform: translateY(0);
        }

        .error-message {
            color: #f44336;
            font-size: 14px;
            margin: 16px 0;
            padding: 8px;
            background-color: rgba(244, 67, 54, 0.1);
            border-radius: 4px;
            display: inline-block;
        }

        .footer-text {
            margin-top: 24px;
            color: #555555;
            font-size: 14px;
        }

        .footer-text a {
            color: #4285f4;
            text-decoration: none;
            font-weight: 500;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            form {
                padding: 24px;
                border-radius: 12px;
            }
            
            .login-container {
                padding: 16px;
            }
            
            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Logo intégré - Remplacez le src par votre image -->
        <div class="logo-container">
            <img src="/img/Untitled design (15).png" alt="SYSTME CONGE ENTREPRISE" class="logo">
        </div>

        <form method="post" action="LoginController">
            <h2>Connexion</h2>

            <% String error = request.getParameter("error"); %>
            <% if ("true".equals(error)) { %>
                <p class="error-message">Email ou mot de passe incorrect !</p>
            <% } %>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" required placeholder="votre@email.com">
            </div>

            <div class="form-group">
                <label for="mdp">Mot de passe:</label>
                <input type="password" name="mdp" id="mdp" required placeholder="••••••••">
            </div>

            <button type="submit" class="btn">Se connecter</button>
            
            <p class="footer-text">Problème de connexion ? <a href="#">Contactez l'administrateur</a></p>
        </form>
    </div>
</body>
</html>
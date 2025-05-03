package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Connexion</title>\n");
      out.write("    <style>\n");
      out.write("        * {\n");
      out.write("            box-sizing: border-box;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        body {\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("            background-color: #f5f9ff;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("            min-height: 100vh;\n");
      out.write("            background-image: linear-gradient(135deg, rgba(173, 216, 230, 0.1) 0%, rgba(135, 206, 250, 0.1) 100%);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .login-container {\n");
      out.write("            display: flex;\n");
      out.write("            flex-direction: column;\n");
      out.write("            align-items: center;\n");
      out.write("            gap: 32px;\n");
      out.write("            width: 100%;\n");
      out.write("            max-width: 420px;\n");
      out.write("            padding: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .logo-container {\n");
      out.write("            width: 100%;\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            margin-bottom: 16px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .logo {\n");
      out.write("            max-width: 280px;\n");
      out.write("            max-height: 120px;\n");
      out.write("            object-fit: contain;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        form {\n");
      out.write("            background-color: #ffffff;\n");
      out.write("            border: 2px solid #b3e0ff;\n");
      out.write("            border-radius: 16px;\n");
      out.write("            padding: 40px;\n");
      out.write("            width: 100%;\n");
      out.write("            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.08);\n");
      out.write("            text-align: center;\n");
      out.write("            transition: transform 0.3s ease, box-shadow 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        form:hover {\n");
      out.write("            transform: translateY(-5px);\n");
      out.write("            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h2 {\n");
      out.write("            color: #1a73e8;\n");
      out.write("            font-size: 28px;\n");
      out.write("            margin-bottom: 24px;\n");
      out.write("            font-weight: 600;\n");
      out.write("            position: relative;\n");
      out.write("            padding-bottom: 8px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h2::after {\n");
      out.write("            content: '';\n");
      out.write("            position: absolute;\n");
      out.write("            bottom: 0;\n");
      out.write("            left: 50%;\n");
      out.write("            transform: translateX(-50%);\n");
      out.write("            width: 60px;\n");
      out.write("            height: 3px;\n");
      out.write("            background-color: #64b5f6;\n");
      out.write("            border-radius: 3px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .form-group {\n");
      out.write("            margin-bottom: 24px;\n");
      out.write("            text-align: left;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        label {\n");
      out.write("            font-size: 16px;\n");
      out.write("            color: #1a73e8;\n");
      out.write("            margin-bottom: 8px;\n");
      out.write("            display: block;\n");
      out.write("            font-weight: 500;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input[type=\"email\"],\n");
      out.write("        input[type=\"password\"] {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 12px 16px;\n");
      out.write("            margin-top: 8px;\n");
      out.write("            border: 1px solid #b3e0ff;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            font-size: 16px;\n");
      out.write("            color: #333333;\n");
      out.write("            transition: border-color 0.3s ease, box-shadow 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input[type=\"email\"]:focus,\n");
      out.write("        input[type=\"password\"]:focus {\n");
      out.write("            outline: none;\n");
      out.write("            border-color: #64b5f6;\n");
      out.write("            box-shadow: 0 0 0 3px rgba(100, 181, 246, 0.2);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 12px;\n");
      out.write("            background-color: #4285f4;\n");
      out.write("            border: none;\n");
      out.write("            color: #ffffff;\n");
      out.write("            font-weight: 600;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            font-size: 18px;\n");
      out.write("            transition: all 0.3s ease;\n");
      out.write("            text-transform: uppercase;\n");
      out.write("            letter-spacing: 0.5px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn:hover {\n");
      out.write("            background-color: #1a73e8;\n");
      out.write("            transform: translateY(-2px);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn:active {\n");
      out.write("            transform: translateY(0);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .error-message {\n");
      out.write("            color: #f44336;\n");
      out.write("            font-size: 14px;\n");
      out.write("            margin: 16px 0;\n");
      out.write("            padding: 8px;\n");
      out.write("            background-color: rgba(244, 67, 54, 0.1);\n");
      out.write("            border-radius: 4px;\n");
      out.write("            display: inline-block;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .footer-text {\n");
      out.write("            margin-top: 24px;\n");
      out.write("            color: #555555;\n");
      out.write("            font-size: 14px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .footer-text a {\n");
      out.write("            color: #4285f4;\n");
      out.write("            text-decoration: none;\n");
      out.write("            font-weight: 500;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .footer-text a:hover {\n");
      out.write("            text-decoration: underline;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        @media (max-width: 480px) {\n");
      out.write("            form {\n");
      out.write("                padding: 24px;\n");
      out.write("                border-radius: 12px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            .login-container {\n");
      out.write("                padding: 16px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            h2 {\n");
      out.write("                font-size: 24px;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"login-container\">\n");
      out.write("        <!-- Logo intégré - Remplacez le src par votre image -->\n");
      out.write("        <div class=\"logo-container\">\n");
      out.write("            <img src=# alt=\"SYSTME CONGE ENTREPRISE\" class=\"logo\">\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <form method=\"post\" action=\"LoginController\">\n");
      out.write("            <h2>Connexion</h2>\n");
      out.write("\n");
      out.write("            ");
 String error = request.getParameter("error"); 
      out.write("\n");
      out.write("            ");
 if ("true".equals(error)) { 
      out.write("\n");
      out.write("                <p class=\"error-message\">Email ou mot de passe incorrect !</p>\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"email\">Email:</label>\n");
      out.write("                <input type=\"email\" name=\"email\" id=\"email\" required placeholder=\"votre@email.com\">\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-group\">\n");
      out.write("                <label for=\"mdp\">Mot de passe:</label>\n");
      out.write("                <input type=\"password\" name=\"mdp\" id=\"mdp\" required placeholder=\"••••••••\">\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <button type=\"submit\" class=\"btn\">Se connecter</button>\n");
      out.write("            \n");
      out.write("            <p class=\"footer-text\">Problème de connexion ? <a href=\"#\">Contactez l'administrateur</a></p>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

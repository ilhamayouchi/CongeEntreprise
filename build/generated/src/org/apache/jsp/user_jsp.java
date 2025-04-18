package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entites.User;
import services.UserService;

public final class user_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"fr\">\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Connexion Utilisateur</title>\n");
      out.write("        <style>\n");
      out.write("            * {\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                font-family: 'Arial', sans-serif;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            body {\n");
      out.write("                background-color: #f0f0f0;\n");
      out.write("                display: flex;\n");
      out.write("                justify-content: center;\n");
      out.write("                align-items: center;\n");
      out.write("                min-height: 100vh;\n");
      out.write("                padding: 20px;\n");
      out.write("                font-size: 16px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-container {\n");
      out.write("                background: #ffffff;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                padding: 40px;\n");
      out.write("                width: 100%;\n");
      out.write("                max-width: 450px;\n");
      out.write("                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-header {\n");
      out.write("                text-align: center;\n");
      out.write("                margin-bottom: 30px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-header h1 {\n");
      out.write("                font-size: 28px;\n");
      out.write("                color: #333;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-header p {\n");
      out.write("                font-size: 14px;\n");
      out.write("                color: #777;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-header::after {\n");
      out.write("                content: '';\n");
      out.write("                display: block;\n");
      out.write("                width: 50px;\n");
      out.write("                height: 4px;\n");
      out.write("                background-color: #4a90e2;\n");
      out.write("                margin: 15px auto 0;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-group {\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            label {\n");
      out.write("                font-size: 14px;\n");
      out.write("                color: #555;\n");
      out.write("                margin-bottom: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=\"text\"], input[type=\"password\"] {\n");
      out.write("                padding: 12px;\n");
      out.write("                font-size: 16px;\n");
      out.write("                border: 2px solid #ddd;\n");
      out.write("                border-radius: 8px;\n");
      out.write("                transition: border-color 0.3s;\n");
      out.write("                width: 100%;\n");
      out.write("                margin-bottom: 15px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=\"text\"]:focus, input[type=\"password\"]:focus {\n");
      out.write("                border-color: #4a90e2;\n");
      out.write("                outline: none;\n");
      out.write("                box-shadow: 0 0 5px rgba(74, 144, 226, 0.3);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=\"submit\"] {\n");
      out.write("                background-color: #4a90e2;\n");
      out.write("                color: white;\n");
      out.write("                border: none;\n");
      out.write("                padding: 12px;\n");
      out.write("                font-size: 16px;\n");
      out.write("                border-radius: 8px;\n");
      out.write("                cursor: pointer;\n");
      out.write("                transition: background-color 0.3s;\n");
      out.write("                width: 100%;\n");
      out.write("                margin-top: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            input[type=\"submit\"]:hover {\n");
      out.write("                background-color: #357ABD;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-footer {\n");
      out.write("                text-align: center;\n");
      out.write("                margin-top: 20px;\n");
      out.write("                font-size: 14px;\n");
      out.write("                color: #777;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-footer a {\n");
      out.write("                color: #4a90e2;\n");
      out.write("                text-decoration: none;\n");
      out.write("                font-weight: 600;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-footer a:hover {\n");
      out.write("                text-decoration: underline;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (max-width: 480px) {\n");
      out.write("                .form-container {\n");
      out.write("                    padding: 30px;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"form-container\">\n");
      out.write("            <div class=\"form-header\">\n");
      out.write("                <h1>Connexion Utilisateur</h1>\n");
      out.write("                <p>Veuillez entrer vos informations pour vous connecter.</p>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <form method=\"POST\" action=\"../UserController\">\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"email\">Email :</label>\n");
      out.write("                    <input type=\"text\" id=\"email\" name=\"email\" placeholder=\"Entrez votre email\" />\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <label for=\"mdp\">Mot de passe :</label>\n");
      out.write("                    <input type=\"password\" id=\"mdp\" name=\"mdp\" placeholder=\"Entrez votre mot de passe\" />\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                    <input type=\"submit\" value=\"Se connecter\" />\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("            \n");
      out.write("            <div class=\"form-footer\">\n");
      out.write("                <p>Pas encore de compte ? <a href=\"#\">Inscrivez-vous</a></p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

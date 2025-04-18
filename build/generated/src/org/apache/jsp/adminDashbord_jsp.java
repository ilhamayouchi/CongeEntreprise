package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import entites.Employe;
import services.EmployeService;

public final class adminDashbord_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Dashboard - Liste des Employés</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <style>\n");
      out.write("            /* RESET + GLOBAL */\n");
      out.write("            * {\n");
      out.write("                margin: 0;\n");
      out.write("                padding: 0;\n");
      out.write("                box-sizing: border-box;\n");
      out.write("                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            body {\n");
      out.write("                display: flex;\n");
      out.write("                background-color: #f0f2f5;\n");
      out.write("                min-height: 100vh;\n");
      out.write("                gap: 20px;\n");
      out.write("                padding: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* SIDEBAR */\n");
      out.write("            .sidebar {\n");
      out.write("                width: 250px;\n");
      out.write("                background-color: #1f2a40;\n");
      out.write("                color: white;\n");
      out.write("                padding: 20px;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                align-items: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar-logo {\n");
      out.write("                width: 180px;\n");
      out.write("                margin-bottom: 25px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar h2 {\n");
      out.write("                margin-bottom: 40px;\n");
      out.write("                font-size: 22px;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar a {\n");
      out.write("                color: white;\n");
      out.write("                text-decoration: none;\n");
      out.write("                padding: 10px;\n");
      out.write("                font-size: 16px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                margin-bottom: 12px;\n");
      out.write("                transition: background-color 0.3s;\n");
      out.write("                width: 100%;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar a:hover {\n");
      out.write("                background-color: #2e3b55;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            /* MAIN */\n");
      out.write("            .main-content {\n");
      out.write("                flex: 1;\n");
      out.write("                background-color: #fff;\n");
      out.write("                padding: 30px;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .main-content h1 {\n");
      out.write("                color: #333;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            fieldset {\n");
      out.write("                border: none;\n");
      out.write("                padding: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            legend {\n");
      out.write("                font-size: 22px;\n");
      out.write("                font-weight: bold;\n");
      out.write("                color: #2c3e50;\n");
      out.write("                margin-bottom: 20px;\n");
      out.write("                position: relative;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            legend::after {\n");
      out.write("                content: '';\n");
      out.write("                display: block;\n");
      out.write("                width: 50px;\n");
      out.write("                height: 3px;\n");
      out.write("                background-color: #2980b9;\n");
      out.write("                margin-top: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            table {\n");
      out.write("                width: 100%;\n");
      out.write("                border-collapse: collapse;\n");
      out.write("                margin-top: 15px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            th, td {\n");
      out.write("                padding: 14px;\n");
      out.write("                border-bottom: 1px solid #eee;\n");
      out.write("                text-align: left;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            th {\n");
      out.write("                background-color: #ecf0f1;\n");
      out.write("                font-weight: 600;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            tbody tr:hover {\n");
      out.write("                background-color: #f9f9f9;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .actions-container {\n");
      out.write("                display: flex;\n");
      out.write("                gap: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a.action {\n");
      out.write("                padding: 8px 12px;\n");
      out.write("                border-radius: 5px;\n");
      out.write("                font-weight: 500;\n");
      out.write("                font-size: 14px;\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a[href*=\"delete\"] {\n");
      out.write("                background-color: #e74c3c;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a[href*=\"delete\"]:hover {\n");
      out.write("                background-color: #c0392b;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a[href*=\"update\"] {\n");
      out.write("                background-color: #f39c12;\n");
      out.write("                color: white;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a[href*=\"update\"]:hover {\n");
      out.write("                background-color: #e67e22;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .empty-message {\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 20px;\n");
      out.write("                color: #777;\n");
      out.write("                font-style: italic;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .add-button {\n");
      out.write("                margin-top: 20px;\n");
      out.write("                display: inline-block;\n");
      out.write("                background-color: #27ae60;\n");
      out.write("                color: white;\n");
      out.write("                padding: 12px 20px;\n");
      out.write("                border-radius: 6px;\n");
      out.write("                font-weight: bold;\n");
      out.write("                transition: background-color 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .add-button:hover {\n");
      out.write("                background-color: #219150;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (max-width: 768px) {\n");
      out.write("                table {\n");
      out.write("                    display: block;\n");
      out.write("                    overflow-x: auto;\n");
      out.write("                    white-space: nowrap;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                .sidebar {\n");
      out.write("                    width: 200px;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("                .main-content {\n");
      out.write("                    padding: 15px;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- SIDEBAR -->\n");
      out.write("        <div class=\"sidebar\">\n");
      out.write("            <img src=\"images/logo.png\" alt=\"Logo Entreprise\" class=\"sidebar-logo\">\n");
      out.write("            <h2>Admin - Gestion des Congés</h2>\n");
      out.write("            <a href=\"listeEmployes.jsp\">Employés</a>\n");
      out.write("            <a href=\"listeConges.jsp\">Demandes de Congés</a>\n");
      out.write("            <a href=\"statistiques.jsp\">Statistiques</a>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- MAIN -->\n");
      out.write("        <div class=\"main-content\">\n");
      out.write("            <h1>Dashboard - Liste des Employés</h1>\n");
      out.write("            <fieldset>\n");
      out.write("                <legend>Employés de l'entreprise</legend>\n");
      out.write("                <table>\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>ID</th>\n");
      out.write("                            <th>Nom</th>\n");
      out.write("                            <th>Prénom</th>\n");
      out.write("                            <th>Email</th>\n");
      out.write("                            <th>Service</th>\n");
      out.write("                            <th>Poste</th>\n");
      out.write("                            <th>Actions</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        ");

                            EmployeService es = new EmployeService();
                            java.util.List<Employe> employes = es.findAll();
                            if (employes != null && !employes.isEmpty()) {
                                for (Employe emp : employes) {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print( emp.getId());
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( emp.getNom());
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( emp.getPrenom());
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( emp.getEmail());
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( emp.getDepartement() != null ? emp.getDepartement().getNom() : "N/A");
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( emp.getPoste());
      out.write("</td>\n");
      out.write("                            <td class=\"actions-container\">\n");
      out.write("                                <a href=\"EmployeController?id=");
      out.print( emp.getId());
      out.write("&op=update\" class=\"action\">Modifier</a>\n");
      out.write("                                <a href=\"EmployeController?id=");
      out.print( emp.getId());
      out.write("&op=delete\" class=\"action\">Supprimer</a>\n");
      out.write("                            </td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            }
                        } else {
                        
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td colspan=\"7\" class=\"empty-message\">Aucun employé trouvé.</td>\n");
      out.write("                        </tr>\n");
      out.write("                        ");
 }
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("            </fieldset>\n");
      out.write("\n");
      out.write("            <a href=\"ajouterEmploye.jsp\" class=\"add-button\">Ajouter un employé</a>\n");
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

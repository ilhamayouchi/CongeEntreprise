package org.apache.jsp.users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import entites.Employe;
import entites.Departement;

public final class employes_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');
      services.EmployeService employeService = null;
      synchronized (session) {
        employeService = (services.EmployeService) _jspx_page_context.getAttribute("employeService", PageContext.SESSION_SCOPE);
        if (employeService == null){
          employeService = new services.EmployeService();
          _jspx_page_context.setAttribute("employeService", employeService, PageContext.SESSION_SCOPE);
        }
      }
      out.write('\n');
      services.DepartementService departementService = null;
      synchronized (session) {
        departementService = (services.DepartementService) _jspx_page_context.getAttribute("departementService", PageContext.SESSION_SCOPE);
        if (departementService == null){
          departementService = new services.DepartementService();
          _jspx_page_context.setAttribute("departementService", departementService, PageContext.SESSION_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Gestion des Employés</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/admin.css\">\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.6.0.min.js\"></script>\n");
      out.write("        <style>\n");
      out.write("            #employes-section table {\n");
      out.write("                width: 100%;\n");
      out.write("                border-collapse: collapse;\n");
      out.write("                margin-top: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #employes-section th, td {\n");
      out.write("                border: 1px solid #ccc;\n");
      out.write("                padding: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            #employes-section form input,\n");
      out.write("            #employes-section form select {\n");
      out.write("                margin-bottom: 10px;\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav>\n");
      out.write("            <a href=\"dashboard.jsp\">🏠 Retour au Dashboard</a>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <main>\n");
      out.write("            <section id=\"employes-section\">\n");
      out.write("                <h2>👤 Gestion des Employés</h2>\n");
      out.write("\n");
      out.write("                <button onclick=\"$('#employeTable').toggle();\">📋 Voir / Cacher la liste des employés</button>\n");
      out.write("\n");
      out.write("                <div id=\"employeTable\" style=\"display:none; margin-top: 20px;\">\n");
      out.write("                    <table>\n");
      out.write("                        <thead>\n");
      out.write("                            <tr>\n");
      out.write("                                <th>Nom</th>\n");
      out.write("                                <th>Prénom</th>\n");
      out.write("                                <th>Email</th>\n");
      out.write("                                <th>Département</th>\n");
      out.write("                                <th>Actions</th>\n");
      out.write("                            </tr>\n");
      out.write("                        </thead>\n");
      out.write("                        ");

if (employeService == null) {
    out.println("<p>EmployeService est null</p>");
} else {
    out.println("<p>EmployeService OK</p>");
}

      out.write("\n");
      out.write("\n");
      out.write("                        <tbody>\n");
      out.write("                            ");

                                if (employeService == null) {
                                    employeService = new services.EmployeService();
                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("                            ");
 List<Employe> employes = employeService.findAll();
                            for (Employe e : employes) {
      out.write("\n");
      out.write("                            <tr>\n");
      out.write("                                <td>");
      out.print( e.getNom());
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( e.getPrenom());
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( e.getEmail());
      out.write("</td>\n");
      out.write("                                <td>");
      out.print( e.getDepartement().getNom());
      out.write("</td>\n");
      out.write("                                <td>\n");
      out.write("                                    <form action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/EmployeController\" method=\"post\" style=\"display:inline;\">\n");
      out.write("\n");
      out.write("                                        <!-- Pour l'édition -->\n");
      out.write("                                        <input type=\"hidden\" name=\"id\" value=\"");
      out.print( e.getId());
      out.write("\">\n");
      out.write("                                        <button type=\"submit\" name=\"op\" value=\"update\">🖊️ Modifier</button>\n");
      out.write("\n");
      out.write("                                        <!-- Pour la suppression -->\n");
      out.write("                                        <button type=\"submit\" name=\"op\" value=\"delete\" onclick=\"return confirm('Êtes-vous sûr de vouloir supprimer cet employé ?');\">❌ Supprimer</button>\n");
      out.write("                                    </form>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            ");
 } 
      out.write("\n");
      out.write("                        </tbody>\n");
      out.write("                    </table>\n");
      out.write("\n");
      out.write("                    <button onclick=\"$('#ajoutForm').toggle();\" style=\"margin-top: 20px;\">➕ Ajouter un Employé</button>\n");
      out.write("\n");
      out.write("                    <div id=\"ajoutForm\" style=\"display:none; margin-top: 15px;\">\n");
      out.write("                        <!-- Formulaire d'ajout d'un employé -->\n");
      out.write("                        <form action=\"EmployeController\" method=\"post\">\n");
      out.write("                            <label>Nom:</label>\n");
      out.write("                            <input type=\"text\" name=\"nom\" required>\n");
      out.write("\n");
      out.write("                            <label>Prénom:</label>\n");
      out.write("                            <input type=\"text\" name=\"prenom\" required>\n");
      out.write("\n");
      out.write("                            <label>Email:</label>\n");
      out.write("                            <input type=\"email\" name=\"email\" required>\n");
      out.write("\n");
      out.write("                            <label>Département:</label>\n");
      out.write("                            <select name=\"departementId\" required>\n");
      out.write("                                ");
 List<Departement> departements = departementService.findAll();
                                for (Departement d : departements) {
      out.write("\n");
      out.write("                                <option value=\"");
      out.print( d.getId());
      out.write('"');
      out.write('>');
      out.print( d.getNom());
      out.write("</option>\n");
      out.write("                                ");
 }
      out.write("\n");
      out.write("                            </select>\n");
      out.write("\n");
      out.write("                            <button type=\"submit\" name=\"op\" value=\"create\">✅ Enregistrer</button>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </section>\n");
      out.write("        </main>\n");
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

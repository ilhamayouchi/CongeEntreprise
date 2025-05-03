package org.apache.jsp.users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ajouterEmploye_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_forEach_var_items;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_forEach_var_items = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_forEach_var_items.release();
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Ajouter un Employé</title>\n");
      out.write("    <style>\n");
      out.write("        * {\n");
      out.write("            box-sizing: border-box;\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        body {\n");
      out.write("            margin: 0;\n");
      out.write("            display: flex;\n");
      out.write("            height: 100vh;\n");
      out.write("            background: linear-gradient(135deg, #74ebd5, #acb6e5);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar {\n");
      out.write("            width: 250px;\n");
      out.write("            background-color: #2c3e50;\n");
      out.write("            color: white;\n");
      out.write("            padding: 20px;\n");
      out.write("            display: flex;\n");
      out.write("            flex-direction: column;\n");
      out.write("            align-items: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar .logo {\n");
      out.write("            width: 120px;\n");
      out.write("            margin-bottom: 15px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar h2 {\n");
      out.write("            font-size: 22px;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar ul {\n");
      out.write("            list-style: none;\n");
      out.write("            padding: 0;\n");
      out.write("            width: 100%;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar li {\n");
      out.write("            margin: 10px 0;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar a {\n");
      out.write("            color: white;\n");
      out.write("            text-decoration: none;\n");
      out.write("            font-size: 16px;\n");
      out.write("            display: block;\n");
      out.write("            padding: 10px;\n");
      out.write("            border-radius: 6px;\n");
      out.write("            transition: background 0.3s;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .sidebar a:hover {\n");
      out.write("            background-color: #34495e;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .content {\n");
      out.write("            flex: 1;\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("            padding: 40px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        form {\n");
      out.write("            background-color: white;\n");
      out.write("            padding: 30px 40px;\n");
      out.write("            border-radius: 15px;\n");
      out.write("            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);\n");
      out.write("            width: 100%;\n");
      out.write("            max-width: 500px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        h2 {\n");
      out.write("            text-align: center;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("            color: #333;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        label {\n");
      out.write("            display: block;\n");
      out.write("            margin: 12px 0 6px;\n");
      out.write("            color: #555;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input[type=\"text\"],\n");
      out.write("        input[type=\"email\"],\n");
      out.write("        input[type=\"password\"],\n");
      out.write("        select {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 10px;\n");
      out.write("            border: 1px solid #ccc;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            font-size: 14px;\n");
      out.write("            transition: border-color 0.3s;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input:focus, select:focus {\n");
      out.write("            border-color: #4a90e2;\n");
      out.write("            outline: none;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        button {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 12px;\n");
      out.write("            background-color: #4a90e2;\n");
      out.write("            color: white;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            font-size: 16px;\n");
      out.write("            margin-top: 20px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            transition: background-color 0.3s;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        button:hover {\n");
      out.write("            background-color: #357ab7;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        @media (max-width: 768px) {\n");
      out.write("            body {\n");
      out.write("                flex-direction: column;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar {\n");
      out.write("                width: 100%;\n");
      out.write("                flex-direction: row;\n");
      out.write("                justify-content: space-around;\n");
      out.write("                padding: 10px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .sidebar ul {\n");
      out.write("                display: flex;\n");
      out.write("                gap: 15px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content {\n");
      out.write("                padding: 20px;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <nav class=\"sidebar\">\n");
      out.write("        <img src=\"");
      out.print(request.getContextPath());
      out.write("/images/logo.png\" alt=\"Logo\" class=\"logo\">\n");
      out.write("        <h2>Admin Panel</h2>\n");
      out.write("        <ul>\n");
      out.write("            <li><a href=\"#employes\">👤 Employés</a></li>\n");
      out.write("            <li><a href=\"#demandes\">📄 Demandes</a></li>\n");
      out.write("            <li><a href=\"#stats\">📊 Statistiques</a></li>\n");
      out.write("            <li><a href=\"");
      out.print(request.getContextPath());
      out.write("/logout\">🚪 Déconnexion</a></li>\n");
      out.write("        </ul>\n");
      out.write("    </nav>\n");
      out.write("\n");
      out.write("    <div class=\"content\">\n");
      out.write("        <form action=\"admin\" method=\"post\">\n");
      out.write("            <input type=\"hidden\" name=\"action\" value=\"ajouterEmploye\" />\n");
      out.write("            <h2>Ajouter un Employé</h2>\n");
      out.write("\n");
      out.write("            <label>Nom:</label>\n");
      out.write("            <input type=\"text\" name=\"nom\" required>\n");
      out.write("\n");
      out.write("            <label>Prénom:</label>\n");
      out.write("            <input type=\"text\" name=\"prenom\" required>\n");
      out.write("\n");
      out.write("            <label>Email:</label>\n");
      out.write("            <input type=\"email\" name=\"email\" required>\n");
      out.write("\n");
      out.write("            <label>Mot de passe:</label>\n");
      out.write("            <input type=\"password\" name=\"motDePasse\" required>\n");
      out.write("\n");
      out.write("            <label>Poste:</label>\n");
      out.write("            <input type=\"text\" name=\"poste\" required>\n");
      out.write("\n");
      out.write("            <label>Rôle:</label>\n");
      out.write("            <select name=\"role\" required>\n");
      out.write("                <option value=\"\">-- Sélectionner un rôle --</option>\n");
      out.write("                <option value=\"admin\">Admin</option>\n");
      out.write("                <option value=\"employe\">Employé</option>\n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("            <label>Département:</label>\n");
      out.write("            <select name=\"departementId\" required>\n");
      out.write("                <option value=\"\">-- Sélectionner un département --</option>\n");
      out.write("                ");
      if (_jspx_meth_c_forEach_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("            </select>\n");
      out.write("\n");
      out.write("            <button type=\"submit\">Ajouter</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("</body>\n");
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

  private boolean _jspx_meth_c_forEach_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_forEach_0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _jspx_tagPool_c_forEach_var_items.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    _jspx_th_c_forEach_0.setPageContext(_jspx_page_context);
    _jspx_th_c_forEach_0.setParent(null);
    _jspx_th_c_forEach_0.setItems((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${departements}", java.lang.Object.class, (PageContext)_jspx_page_context, null));
    _jspx_th_c_forEach_0.setVar("d");
    int[] _jspx_push_body_count_c_forEach_0 = new int[] { 0 };
    try {
      int _jspx_eval_c_forEach_0 = _jspx_th_c_forEach_0.doStartTag();
      if (_jspx_eval_c_forEach_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\n");
          out.write("                    <option value=\"");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${d.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write('"');
          out.write('>');
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${d.nom}", java.lang.String.class, (PageContext)_jspx_page_context, null));
          out.write("</option>\n");
          out.write("                ");
          int evalDoAfterBody = _jspx_th_c_forEach_0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_forEach_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
    } catch (Throwable _jspx_exception) {
      while (_jspx_push_body_count_c_forEach_0[0]-- > 0)
        out = _jspx_page_context.popBody();
      _jspx_th_c_forEach_0.doCatch(_jspx_exception);
    } finally {
      _jspx_th_c_forEach_0.doFinally();
      _jspx_tagPool_c_forEach_var_items.reuse(_jspx_th_c_forEach_0);
    }
    return false;
  }
}

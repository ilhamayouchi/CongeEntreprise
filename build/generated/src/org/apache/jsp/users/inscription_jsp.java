package org.apache.jsp.users;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class inscription_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_if_test.release();
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
      response.setContentType("text/html; charset=UTF-8");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"fr\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Inscription – Gestion des Congés</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\">\n");
      out.write("    <style>\n");
      out.write("        * { margin:0; padding:0; box-sizing:border-box;\n");
      out.write("        }\n");
      out.write("        body { \n");
      out.write("            font-family: 'Segoe UI', sans-serif; background: #1f2833; color: #c5c6c7; height:100vh; overflow:hidden;\n");
      out.write("        }\n");
      out.write("        .particles {\n");
      out.write("            position: absolute; width:100%; height:100%; overflow:hidden; z-index:-1;\n");
      out.write("        }\n");
      out.write("        .particle { \n");
      out.write("            position: absolute; background: rgba(255,255,255,0.2); border-radius:50%; animation-name: float; animation-timing-function: linear; }\n");
      out.write("        @keyframes float { from { transform: translateY(0); } to { transform: translateY(-120vh); \n");
      out.write("                } }\n");
      out.write("        .registration-container {\n");
      out.write("            width: 360px; margin: 5% auto; background: #0b0c10; border-radius: 8px; box-shadow: 0 4px 15px rgba(0,0,0,0.6); overflow: hidden; }\n");
      out.write("        .brand-section {\n");
      out.write("            background: #45a29e; text-align: center; padding: 1.5rem; }\n");
      out.write("        .brand-icon {\n");
      out.write("            font-size: 2rem; color:#0b0c10; }\n");
      out.write("        .brand-title { \n");
      out.write("            color: #0b0c10; font-size: 1.8rem; margin-top: 0.5rem; }\n");
      out.write("        .brand-subtitle {\n");
      out.write("            color:#0b0c10; opacity:0.8; }\n");
      out.write("        .registration-card {\n");
      out.write("            padding: 1.5rem; }\n");
      out.write("        .registration-header h3 { \n");
      out.write("            color: #fff; }\n");
      out.write("        .form-group { \n");
      out.write("            position: relative; margin-bottom:1.5rem; }\n");
      out.write("        .form-control, .form-select {\n");
      out.write("            width:100%; padding:0.75rem; background: #1f2833; border:1px solid #45a29e; border-radius:4px; color:#c5c6c7; }\n");
      out.write("        .form-label {\n");
      out.write("            position:absolute; top:50%; left:0.75rem; transform:translateY(-50%); pointer-events:none; transition: all .2s; color: #c5c6c7; }\n");
      out.write("        .focused .form-label, .form-control:focus + .form-label, .form-select:focus + .form-label {\n");
      out.write("            top:-0.6rem; left:0.6rem; background:#0b0c10; padding:0 0.25rem; font-size:0.85rem; color:#45a29e; }\n");
      out.write("        .password-toggle {\n");
      out.write("            position:absolute; top:50%; right:0.75rem; transform:translateY(-50%); cursor:pointer; color:#c5c6c7; }\n");
      out.write("        .btn-register { \n");
      out.write("            width:100%; padding:0.75rem; background:#45a29e; border:none; border-radius:4px; color:#0b0c10; font-weight:bold; }\n");
      out.write("        .registration-links {\n");
      out.write("            margin-top:1rem; text-align:center; }\n");
      out.write("        .registration-link { \n");
      out.write("            display:inline-block; margin:0 .5rem; color:#66fcf1; font-size:0.9rem; }\n");
      out.write("        .alert {\n");
      out.write("            padding: 10px;\n");
      out.write("            margin-bottom: 15px;\n");
      out.write("            border-radius: 4px;\n");
      out.write("        }\n");
      out.write("        .alert-danger {\n");
      out.write("            background-color: rgba(220, 53, 69, 0.2);\n");
      out.write("            color: #dc3545;\n");
      out.write("            border: 1px solid #dc3545;\n");
      out.write("        }\n");
      out.write("        .alert-success {\n");
      out.write("            background-color: rgba(40, 167, 69, 0.2);\n");
      out.write("            color: #28a745;\n");
      out.write("            border: 1px solid #28a745;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"particles\" id=\"particles\"></div>\n");
      out.write("    <div class=\"registration-container animate__animated animate__fadeIn\">\n");
      out.write("        <div class=\"brand-section\">\n");
      out.write("            <i class=\"fas fa-calendar-check brand-icon\"></i>\n");
      out.write("            <h1 class=\"brand-title\">Gestion des Congés</h1>\n");
      out.write("            <p class=\"brand-subtitle\">Inscription</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"registration-card\">\n");
      out.write("            <div class=\"registration-header\">\n");
      out.write("                <h3><i class=\"fas fa-user-plus\"></i> Nouveau compte</h3>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"registration-body\">\n");
      out.write("                ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                ");
      if (_jspx_meth_c_if_1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("                <form action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/InscriptionController\" method=\"post\">\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input type=\"text\" id=\"nom\" name=\"nom\" class=\"form-control\" placeholder=\" \" required>\n");
      out.write("                        <label for=\"nom\" class=\"form-label\">Nom</label>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input type=\"text\" id=\"prenom\" name=\"prenom\" class=\"form-control\" placeholder=\" \" required>\n");
      out.write("                        <label for=\"prenom\" class=\"form-label\">Prénom</label>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input type=\"email\" id=\"email\" name=\"email\" class=\"form-control\" placeholder=\" \" required>\n");
      out.write("                        <label for=\"email\" class=\"form-label\">Adresse email</label>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <input type=\"password\" id=\"password\" name=\"password\" class=\"form-control\" placeholder=\" \" required>\n");
      out.write("                        <label for=\"password\" class=\"form-label\">Mot de passe</label>\n");
      out.write("                        <i class=\"fas fa-eye password-toggle\" id=\"togglePassword\"></i>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group role-select\">\n");
      out.write("                        <select name=\"role\" id=\"role\" class=\"form-select\" required>\n");
      out.write("                            <option value=\"\" disabled selected>Choisissez le rôle</option>\n");
      out.write("                            <option value=\"admin\">Admin</option>\n");
      out.write("                            <option value=\"employe\">Employé</option>\n");
      out.write("                        </select>\n");
      out.write("                        <label for=\"role\" class=\"form-label\">Rôle</label>\n");
      out.write("                    </div>\n");
      out.write("                    <button type=\"submit\" class=\"btn-register\">\n");
      out.write("                        <i class=\"fas fa-user-plus me-2\"></i>S'inscrire\n");
      out.write("                    </button>\n");
      out.write("                    <div class=\"registration-links\">\n");
      out.write("                        <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("/login.jsp\" class=\"registration-link\">\n");
      out.write("                            <i class=\"fas fa-sign-in-alt me-1\"></i>Déjà un compte ? Connectez-vous\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("    <script>\n");
      out.write("        document.addEventListener('DOMContentLoaded', () => {\n");
      out.write("            // Create particles\n");
      out.write("            const container = document.getElementById('particles');\n");
      out.write("            for (let i = 0; i < 25; i++) {\n");
      out.write("                const p = document.createElement('div');\n");
      out.write("                p.classList.add('particle');\n");
      out.write("                const size = Math.random() * 12 + 4;\n");
      out.write("                p.style.width = p.style.height = size + 'px';\n");
      out.write("                p.style.left = Math.random() * 100 + '%';\n");
      out.write("                p.style.bottom = '-' + size + 'px';\n");
      out.write("                p.style.animationDuration = Math.random() * 10 + 8 + 's';\n");
      out.write("                p.style.animationDelay = Math.random() * 5 + 's';\n");
      out.write("                container.appendChild(p);\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            // Password toggle\n");
      out.write("            const toggle = document.getElementById('togglePassword');\n");
      out.write("            const pwd = document.getElementById('password');\n");
      out.write("            toggle.addEventListener('click', () => {\n");
      out.write("                const type = pwd.getAttribute('type') === 'password' ? 'text' : 'password';\n");
      out.write("                pwd.setAttribute('type', type);\n");
      out.write("                toggle.classList.toggle('fa-eye-slash');\n");
      out.write("                toggle.classList.toggle('fa-eye');\n");
      out.write("            });\n");
      out.write("            \n");
      out.write("            // Form field focus effects\n");
      out.write("            document.querySelectorAll('.form-group').forEach(group => {\n");
      out.write("                const inp = group.querySelector('.form-control, .form-select');\n");
      out.write("                if (inp.value) {\n");
      out.write("                    group.classList.add('focused');\n");
      out.write("                }\n");
      out.write("                inp.addEventListener('focus', () => group.classList.add('focused'));\n");
      out.write("                inp.addEventListener('blur', () => { \n");
      out.write("                    if (!inp.value) group.classList.remove('focused'); \n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("            \n");
      out.write("            // Focus first field\n");
      out.write("            document.getElementById('nom').focus();\n");
      out.write("        });\n");
      out.write("    </script>\n");
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

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty success}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                    <div class=\"alert alert-success\" role=\"alert\">\n");
        out.write("                        <i class=\"fas fa-check-circle me-2\"></i> ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${success}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("\n");
        out.write("                    </div>\n");
        out.write("                ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }

  private boolean _jspx_meth_c_if_1(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_1.setPageContext(_jspx_page_context);
    _jspx_th_c_if_1.setParent(null);
    _jspx_th_c_if_1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${not empty error}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_1 = _jspx_th_c_if_1.doStartTag();
    if (_jspx_eval_c_if_1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("                    <div class=\"alert alert-danger\" role=\"alert\">\n");
        out.write("                        <i class=\"fas fa-exclamation-circle me-2\"></i> ");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("\n");
        out.write("                    </div>\n");
        out.write("                ");
        int evalDoAfterBody = _jspx_th_c_if_1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_1);
    return false;
  }
}

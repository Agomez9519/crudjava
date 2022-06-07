/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.mvcejercicio27042022;

import config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Dao;
import modelo.Usuario;

/**
 *
 * @author andre
 */
public class Controller extends HttpServlet {

    Dao uD = new Dao();
    Usuario u = new Usuario();
    Conexion cn = new Conexion();

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        String res = "Ingrese los datos";
        PrintWriter out = response.getWriter();
        HttpSession sesion = request.getSession();
        try {
            switch (accion) {
                case "Login":                    
                    if (!request.getParameter("txtEmail").equals("") && !request.getParameter("txtPass").equals("")) {
                        String email = request.getParameter("txtEmail");
                        String pass = request.getParameter("txtPass");                           
                        request.setAttribute("res", res);
                        if(cn.Conectar()== null){
                              res = "Error en la conexion";
                              request.setAttribute("res", res);
                              System.out.println(request.getAttribute("res"));
                              request.getRequestDispatcher("index.jsp?respuesta="+request.getAttribute("res")).forward(request, response); 
                            }else{
                                 if (uD.login(email, pass) != null) {
                                     u = uD.login(email, pass);
                                     sesion.setAttribute("user", u);
                                     sesion.setAttribute("email",u.getEmail());
                                     request.getRequestDispatcher("listar.jsp").forward(request, response);                       
                                 }else{
                                    res = "Usuario inexistente en la bd";
                                    request.setAttribute("res", res);
                                    System.out.println(request.getAttribute("res"));
                                    request.getRequestDispatcher("index.jsp?respuesta="+request.getAttribute("res")).forward(request, response); 
                                    }
                            }
                        }
                    
                    break;
                    
                case "Insertar":
                    
                    if(!request.getParameter("txtEmail").equals("") && !request.getParameter("txtPass").equals("")){
                        String email = request.getParameter("txtEmail");
                        String pass = request.getParameter("txtPass");
                            if(uD.insert(email, pass)){
                                try{
                                    request.getRequestDispatcher("listar.jsp").forward(request, response);
                                    /*
                                    out.println("<!DOCTYPE html>");
                                    out.println("<html>");
                                    out.println("<head>");
                                    out.println("<title>Valores</title>");
                                    out.println("</head>");
                                    out.println("<body>");
                                    out.println("<h1>Datos Ingresados Correctamente</h1>");
                                    out.println("<h1>Email " + email+"</h1>");
                                    out.println("<h1>Password " + pass+"</h1>");
                                    out.println("</body>");
                                    out.println("</html>");  
                                    */                
                                }
                                finally
                                {
                                out.close();
                                }
                            }else{
                                out.println("<!DOCTYPE html>");
                                    out.println("<html>");
                                    out.println("<head>");
                                    out.println("<title>Valores</title>");
                                    out.println("</head>");
                                    out.println("<body>");
                                    out.println("<h1>No se pudo ingresar</h1>");                     
                                    out.println("</body>");
                                    out.println("</html>");      
                            }
                    }else{
                                    try {
                                       /* TODO output your page here. You may use following sample code. */
                                       out.println("<!DOCTYPE html>");
                                       out.println("<html>");
                                       out.println("<head>");
                                       out.println("<title>Servlet Insert</title>");
                                       out.println("</head>");
                                       out.println("<body>");
                                       out.println("<h1>Debes ingresar todos los campos</h1>");
                                       out.println("</body>");
                                       out.println("</html>");
                                   } finally{
                                       out.close();
                                   }
                    }                  
                break; 
                case "Delete":
                    try {
                        int id = Integer.parseInt(request.getParameter("id"));
                        uD.eliminar(id);
                        request.getRequestDispatcher("listar.jsp").forward(request, response);
                     }catch(Exception e){
                    out.print("<h1>Error: "+e+"</h1>");
                     }
                break;
                
                case "Update":
                
                    int ide= Integer.parseInt(request.getParameter("txtId"));
                    String email = request.getParameter("txtEmail");
                    String pass = request.getParameter("txtPass");        

                    try{
                    u = new Usuario(ide,email, pass);
                    int fila = uD.update(u);
                    if(fila == 1){
                        response.sendRedirect("listar.jsp");
                    }else{
                        out.println("<h1>Error al actualizar</h1>");            
                    }
                    }catch(Exception e){
                        out.println("<h1>"+e+"</h1>");
        }    
                    
                break;
                
                case "Salir":
                    
                    //Usuario u = null;
                    
                    //u = (Usuario) sesion.getAttribute("user");   
                    if (sesion != null) {
                        sesion.invalidate();
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }
                break;
                
                default:
                    
                break;
              
            }
                }finally{
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

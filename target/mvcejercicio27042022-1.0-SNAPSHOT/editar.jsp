<%-- 
    Document   : editar
    Created on : 11-05-2022, 1:10:45
    Author     : andre
--%>

<%@page import="modelo.Dao"%>
<%@page import="modelo.Usuario"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
              crossorigin="anonymous">          
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="sweetalert2.min.css">
    </head>
    <body>    
        <%! 
           int numero = 0;
           Dao uD= new Dao();
           Usuario user,u = new Usuario();
        %>      
        
        <%
            if (request.getParameter("id").equals("") || request.getParameter("id") == null) {
                 numero = 0;   
                }else{
                 numero = Integer.parseInt(request.getParameter("id")); 
            }
                
                       
            user = uD.getById(numero);
            
 
                HttpSession sesion2 = request.getSession(); 
                String sesionEmail = (String) sesion2.getAttribute("email");
                
                if (sesionEmail != null) {
                    u = (Usuario) sesion2.getAttribute("user");     
                    }else{
                    response.sendRedirect("nologin.jsp");
                }
                       

        %> 
        
        <div class="container pb-4">
            <%@include file="nav.jsp" %>
        </div>
        
        <div class="container mt-5">
            <div class="col-md-6 offset-md-3 mt-2">
                <h1>Actualizar Registro</h1>
                    <form action="Controller" method ="post" name="frmLogin" id="frmLogin">
                        <div class="mb-3">
                          <label for="exampleInputEmail1" class="form-label">Email del usuario</label>
                            <input type="email" class="form-control" id="txtEmail" name="txtEmail" value='<%out.print(user.getEmail());%>'>
                            <input type="hidden" value="<%out.print(user.getId());%>" name="txtId">
                        </div>
                        <div class="mb-3">
                          <label for="exampleInputPassword1" class="form-label">Ingrese su contraseña</label>
                            <input type="password" class="form-control" id="txtPass" name="txtPass" value='<%out.print(user.getPass());%>'  >
                        </div> 
                        
                        <div>
                            <span class="vacio">Valide Todos los campos</span>
                            <span class="email">Valide el campo email</span>
                            <span class="pass">Valide el campo pass</span>
                        </div>
                        <br>
                        <button type="submit" name="accion" value="Update" id="guardar" class="btn btn-primary" >Actualizar</button> 
                    </form>    
            </div>       
        </div> 
         <!-- ja main -->
        
        <script src="js/main2.js" type="text/javascript"></script>
        <!--cdn de sweetalert -->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>         
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous">                
        </script>
        <script src="js/validar.js"></script>   
    </body>
</html>

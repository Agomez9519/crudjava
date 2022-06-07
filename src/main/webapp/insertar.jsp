<%-- 
    Document   : index
    Created on : 27-04-2022, 19:45:09
    Author     : andre
--%>

<%@page import="modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
              crossorigin="anonymous">
        <title>Ejercicio MVC</title>
    </head>
    <body>  
         <%  
                Usuario u = new Usuario();
                HttpSession sesion = request.getSession(); 
                String sesionEmail = (String) sesion.getAttribute("email");                 
                System.out.println(sesionEmail);                
                 if (sesionEmail != null) {
                 u = (Usuario) sesion.getAttribute("user");     
                 }else{
                    response.sendRedirect("nologin.jsp");
                }                     
                       
        %>
        
     <div class="container pb-4">
            <%@include file="nav.jsp" %>
     </div>
     
        <div class="container mt-5">
            <h1>Formulario de ingreso</h1>
                <form action="Controller" method ="post" name="frmInsert" id="frmLogin">
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label">Email del usuario</label>
                        <input type="email" class="form-control" id="txtEmail" name="txtEmail">
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputPassword1" class="form-label">Ingrese su contraseña</label>
                        <input type="password" class="form-control" id="txtPass" name="txtPass">
                    </div>  
                     <div>
                            <span class="vacio">Valide Todos los campos</span>
                            <span class="email">Valide el campo email</span>
                            <span class="pass">Valide el campo pass</span>
                        </div>
                        <br>
                   <button type="submit" name="accion" value="Insertar" id="guardar" class="btn btn-primary">Enviar</button> <a class='btn btn-primary m-3' href="listar.jsp">Volver</a>
                </form>        
        </div>        
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

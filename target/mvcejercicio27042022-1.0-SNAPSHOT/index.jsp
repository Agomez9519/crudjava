<%-- 
    Document   : index
    Created on : 02-06-2022, 2:28:53
    Author     : andre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
              crossorigin="anonymous">          
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>        
        <title>Login</title>
    </head>
    <body>  
    <div class="container">
       <div class="wrapper">
        <div cla ss="logo">
            <img src="" alt="">
        </div>
        <div class="text-center mt-4 name">
            Registrarse
        </div>
           <form class="p-3 mt-3" action="Controller" method="POST"  name="frmLogin" id="frmLogin">
            <div class="form-field d-flex align-items-center">
                <span class="far fa-user"></span>
                <input type="text" name="txtEmail" id="txtEmail" placeholder="Email">
            </div>
            <div class="form-field d-flex align-items-center">
                <span class="fas fa-key"></span>
                <input type="password" name="txtPass" id="txtPass" placeholder="Pass">
            </div>  
            <div>
                <span class="vacio">Valide Todos los campos</span>
                <span class="email">Valide el campo email</span>
                <span class="pass">Valide el campo pass</span>
                        <%
                         
                         String res = request.getParameter("respuesta");                         
                    
                         if ( res != null) {                           
                            System.out.println(request.getParameter("respuesta"));
                            out.print("<p>" + res + "</p>");
                            
                        }                            
                        %>  
            </div>
            <button type="submit" name="accion" value="Login" id="guardar" class="btn mt-3">Entrar</button>
        </form>        
        </div>
    </div> 
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous">                
        </script>
        <script src="js/validar.js"></script>        
    </body>
</html>

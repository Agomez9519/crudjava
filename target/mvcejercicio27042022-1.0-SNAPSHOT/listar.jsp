<%-- 
    Document   : listar
    Created on : 03-05-2022, 0:05:31
    Author     : andre
--%>

<%@page import="modelo.Usuario"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
              crossorigin="anonymous">  
        <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="sweetalert2.min.css">
        <title>Listar</title>
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
        
        <div Class="container mt-5">
            <div class="">  
                <table border="1" class="table table-bordered table-hover">
                    <thead>
                        <tr Class="table-success">
                            <th>ID</th>
                            <th>Email</th>
                            <th>Pass</th> 
                            <th>Accion</th>
                        </tr>
                    </thead>
                    <jsp:useBean class="modelo.Dao" id="Dao"></jsp:useBean>
                    <c:forEach items="${Dao.list()}" var="users" >
                      <tr>
                            <td>${users.id}</td>
                            <td>${users.email}</td>
                            <td>${users.pass}</td>
                            <td>
                                    <button type="button" class="btn btn-outline-warning"  onclick="edit(${users.id}, '${users.email}', '${users.pass}')">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                        </svg>
                                    </button>
                                    <button type="button" class="btn btn-outline-danger" onclick="del(${users.id}, '${users.email}', '${users.pass}')" >
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" 
                                             class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                        </svg>
                                    </button>
                            </td>
                      </tr>
                    </c:forEach>                  
                </table>
                   <a class='btn btn-success m-3' href="insertar.jsp">Ingresar </a>  <a class='btn btn-danger m-3' name="accion" href='Controller?accion=Salir'>Salir </a>         
        </div>
                
         <!-- ja main -->
        <script src="js/main.js" type="text/javascript"></script>
        <!--cdn de sweetalert -->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </body>
</html>

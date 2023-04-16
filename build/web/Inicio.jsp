<%-- 
    Document   : about
    Created on : 15-sep-2022, 2:14:03
    Author     : Juan Sebastian S
--%>

<%@page import="Controlador.ControllerLog"%>
<%@page import="Modelo.PetsMain"%>
<%@page import="Modelo.UsersMain"%>
<%@page import="Controlador.ControllerPets"%>
<%@page import="java.util.List"%>
<%@page import="Controlador.ControllerUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
         <link rel="icon" href="Img/LogoJava.png"/>
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="Frontend/Dashboard.css"/>
        <title>Inicio Dashboard</title>
    </head>
    <body>
        
        
   
        <%
   
    String nombre = request.getSession().getAttribute("Adress").toString();
        ControllerUser CtrlUser = new ControllerUser();
        ControllerLog ctrlLog = new ControllerLog();
        String StrlNombre[] = CtrlUser.DataProfile(nombre).split("\\,");
        %>
        
        
        
        <!<!-- De aqui comienza el dashboard -->
        
        <div class="d-flex"> 
        
            <div id="sidebar-container" >
                <div class="logo">
                    <h4>WELCOME</h4>
                </div>        
                <div class="menu"> 
                    <a href="Inicio.jsp" class="d-block  p-4 ml-2"><i class="fa-solid fa-layer-group mr-2 "></i>Dashboard</a>
                     <a href="Perfil.jsp" class="d-block p-4 ml-2" ><i class="fa-sharp fa-solid fa-user mr-2 lead"></i>Perfil</a>
                      <a href="VinculoUser.jsp" class="d-block  p-4 ml-2" ><i class="fa-sharp fa-solid fa-arrow-right mr-2"></i>Vinculos</a>
                </div>
            </div> 
            
            <!<!-- Navbar -->
            
            <div class="w-100">
             <nav class="navbar navbar-expand-lg navbar-light" id="container">
 
                 <div class="container">
                   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto" >
     
        <li class="nav-item dropdown" id="perfil_general">
        <a id="user-text" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <img src="Img/<%=StrlNombre[0]%>" class="img-fluid rounded-circle avatar mr-2">
        <%=StrlNombre[2]%>
        </a>
      <div class="dropdown-menu"  id="drop_menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" id="Lg_Sign_off"  href="Sing_Off.jsp" ><i class="fa-solid fa-right-from-bracket"></i> <strong>Cerrar Sesion</Strong> </a>
        </div>
      </li>
    </ul>
    
  </div>
                 </div>
</nav>
            </div>
        
        <!<!-- Dashboard Vinculos del usuario.-->
        
        <div id="card_Encontrados">
            <img src="Img/Logo_Perdido.png" width="220px">
            
            <div class="Div_Box0"> 
                <h3>
                  <i class="fa-solid fa-paw"></i> En esta area puede observar los animales encontrados por medio del boton que esta en la parte inferior <i class="fa-solid fa-paw"></i>
            </div>
            
            <button type="button" id="btnEncontrado" data-toggle="modal" data-target="#ModalEncontrado" class="btn btn-dark btn-lg btn-block"">Visualizar</button>
        </div>
        
        <div id="card_Perdidos">
           <img src="Img/Logo_Encontrado.png" width="200px"> 
           
           <div class="Div_Box0" id="divBox"> 
               <h3>
                 <i class="fa-solid fa-heart-pulse"></i> En esta area puede observar los animales que estan en busqueda por medio del boton que esta en la parte inferior <i class="fa-solid fa-heart-pulse"></i>
            </div>
           <button type="button" id="btnPerdido"  data-toggle="modal" data-target="#ModalBusqueda" class="btn btn-dark btn-lg btn-block"">Visualizar</button>
        </div>
        </div>
        
        
        
        <!-- Modal Encontrado -->
<div class="modal fade" id="ModalEncontrado" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
      <div class="modal-content" id="content">
      
        <h4>Info de la data: </h4>
        
      <div class="modal-body">
          <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Fecha Perdida</th>
      <th scope="col">Fecha Encontrada</th>
      <th scope="col">Descripcion</th>
    </tr>
  </thead>
  <tbody id="body-data">
     
      <%
          
       int id=Integer.parseInt(StrlNombre[1]);
          
       List<Object[]> listDato=ctrlLog.Listar_Encontrados(id);
       
        for (Object[] iterador : listDato){
      %>
      <tr>
          <th><%=iterador[0]%></th>
          <th><%=iterador[1]%></th>
          <th><%=iterador[2]%></th>
          <th><%=iterador[3]%></th>
      </tr>
      <%}%>  
  </tbody>
</table> 
      </div>
     
    </div>
  </div>
</div>
    
        <!-- Modal En Busqueda -->
<div class="modal fade" id="ModalBusqueda" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     
      <div class="modal-body">
             
          <h1 id="Title">¡Sin animales en busqueda!</h1>
          <<img src="Img/SinAnimales.gif" width="450px" alt="alt"/>
          
    </div>
  </div>
</div>
    
    <script>
           
            'use strict';
            
            let ValorLocal=sessionStorage.getItem("Session");
            
            if(ValorLocal=="session_invalidate"){
               $('.menu').hide();
              $('#card_Encontrados').hide();
              $('#perfil_general').hide();
              $('#card_Perdidos').hide();
             }
        </script>
    </body>
</html>
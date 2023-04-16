<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>

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
        <title>Vinculo Dashboard</title>
    </head>
    <body>
   
        <%
          String nombre=request.getSession().getAttribute("Adress").toString();
          ControllerUser CtrlUser=new ControllerUser();
          String StrlNombre[]=CtrlUser.DataProfile(nombre).split("\\,");
        %>
        
      
        
        <!<!-- De aqui comienza el dashboard -->
        
        <div class="d-flex"> 
        
            <div id="sidebar-container">
                <div class="logo">
                    <h4>WELCOME</h4>
                </div>        
                <div class="menu"> 
                    <a href="Inicio.jsp" class="d-block  p-4 ml-2"><i class="fa-solid fa-layer-group mr-2 "></i>Dashboard</a>
                     <a href="Perfil.jsp?%usuario%" class="d-block p-4 ml-2" ><i class="fa-sharp fa-solid fa-user mr-2 lead"></i>Perfil</a>
                      <a href="VinculoUser.jsp?%Usuario%" class="d-block  p-4 ml-2" ><i class="fa-sharp fa-solid fa-arrow-right mr-2"></i>Vinculos</a>
                      
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
              <a class="dropdown-item" id="Lg_Sign_off" href="Sing_Off.jsp"><i class="fa-solid fa-right-from-bracket"></i> <strong>Cerrar Sesion</strong></a>
        </div>
      </li>
    </ul>
    
  </div>
                 </div>
</nav>
            </div>
        
        <!<!-- Dashboard Vinculos del usuario.-->
       
    <div id="tbl_vinculos"> 
   
        <table class="table rounded-sm">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Años</th>
      <th scope="col">Especie</th>
      <th scope="col">Genero</th>
      <th scope="col">Raza</th>
      <th scope="col" id='thUser' >#User</th>
      <th scope="col">Acciones</th> 
       
    </tr>
  </thead>
  <tbody>
      
     <%    
         String Users_Name=StrlNombre[2];         
         List<Object[]> listDatos=CtrlUser.Vinculos(Users_Name);
     
        for (Object[] listDato : listDatos){

     %>
      
    <tr id="data_box<%=listDato[0]%>">
        <th scope="row"><%=listDato[0]%></th>
        <td> <%=listDato[1]%> </td>
        <td> <%=listDato[2]%> </td>
        <td> <%=listDato[3]%> </td>
        <td> <%=listDato[4]%> </td>
        <td> <%=listDato[5]%> </td>
        <td id='thUser'><%=StrlNombre[1]%> </td>
        <td> 
            <button id="modificar" data-toggle="modal" data-target="#myModal" title="Actualizar" onclick="getValue(this)" value="<%=listDato[0]%>"><i class="fa-solid fa-pen"></i></button> 
            <button id="eliminar" title="Eliminar" onclick="setEliminar()"><i class="fa-solid fa-trash"></i></button>
        </td>
    </tr>  
      <%}%>
  </tbody>
</table>
       
        </div> 
        </div>
    
      <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
     
      <div class="modal-body"id="campos_modal">
        
          <div class="modal-header">
              
              <h3 style="color:black; margin-left: 100px;"><i class="fa-solid fa-shield-dog"></i> Info Mascota <i class="fa-solid fa-shield-cat"></i></h3>
      </div>
           
          <form method="POST" action="Mod_Del_Crud.jsp?db=vinculo" id="form-data">
              
             
          <input type="text" class="form-control" style="display:none;" name="txt_id">
          <input type="text" class="form-control" onkeyup="validarCampos()" id="txt_nombre" name="txt_nombre">
          <input type="text" class="form-control"  onkeyup="validarCampos()" id="txt_age" name="txt_nombre2">
          <input type="text" class="form-control" onkeyup="validarCampos()" id="txt_especie" name="txt_especie">
          <input type="text" class="form-control"  onkeyup="validarCampos()" id="txt_genero" name="genero">  
          <input type="text" class="form-control"  onkeyup="validarCampos()" id="txt_raza" name="txt_raza">
          <input type="text" value='<%=StrlNombre[1]%>' style="display:none" name="foreingkey>

          <div class="container ml-2"> 
          <button class="btn btn-primary btn-lg btn-block"  type='submit' name="btnSubmit" id="Btnmod">Modificar</button>
          </form>

          </div>  
      </div>
    </div>

  </div>
</div>

      <script>
      
      'use strict';
      
      let setEliminar=()=>{
          swal("¿Lo quieres eliminar?", "Por favor comunicarse con el administrador para los respectiva accion ATT: Admin_MP@S!", "error");
      }
      
      let getValue=(event)=>{   
          
          let Datos_Input=[];
          
            let btnModificar=$(event).val();  
            let data_form=document.getElementById("data_box"+btnModificar).children;
              let data_input=document.querySelector("#form-data").children;
              
              for (let index = 0; index <=5; index++) {              
                 Datos_Input.push(data_form[index].textContent.trim());
               }
                 
                 for (let iterador = 0; iterador < data_input.length; iterador++) {
                    data_input[iterador].value=Datos_Input[iterador];
               }   
        }
        
      let validarCampos=()=>{
           
           let Strlnombre=$('#txt_nombre').val().length;
           let Strlespecie=$('#txt_especie').val().length;
           let Strlage=$('#txt_age').val().length;
           let Strlgenero=$('#txt_genero').val().length;
           let StrRaza=$('#txt_raza').val().length;
           
           let StrlCampos=[Strlnombre,Strlespecie,Strlage,Strlgenero,StrRaza];
           
           for (let index = 0; index < StrlCampos.length; index++) {
               
                   if(StrlCampos[index]!=0){
                      $("#Btnmod").attr("disabled",false);
                   }else{
                       $("#Btnmod").attr("disabled",true);
                       break;
                   }
}
};

         let ValorLocal=sessionStorage.getItem("Session");
       
       if(ValorLocal=="session_invalidate"){
               $('.menu').hide();
               $('#tbl_vinculos').remove();
               $('#perfil_general').hide();
             }
          

      </script>
      
    </body>
</html>

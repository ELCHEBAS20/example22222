
<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="Controlador.ControllerUser"%>
<%@page import="Controlador.ControllerAdmin"%>
<%@page import="Controlador.ControllerInfoChip"%>
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
 <script src="https://cdn.jsdelivr.net/npm/chart.js@latest/dist/Chart.min.js"></script>
<link rel="stylesheet" href="Frontend/Dashboard.css"/>

<style>
       
    #campos_modal01{
        position: relative;
        top: -30px;
        
    }
</style>

        <title>Usuario Dashboard</title>
    </head>
    <body>
   
        <!<!-- De aqui comienza el dashboard -->
 <jsp:include page="/Template_Dashboard/DashTemplate.jsp"/>
     
        <!<!-- Dashboard Vinculos del usuario.-->
       
        <div id="tbl_vinculos" style="margin-top:90px;">
 <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellido</th>
      <th scope="col">Usuario</th>
      <th scope="col">Pswd</th>
      <th scope="col">Direccion</th>
      <th scope="col">Vinculo</th>
    </tr>
  </thead>
  <tbody id="tblInfo">
      
      <c:forEach items="${ListAdmin_user}" var="index">
          
          <tr id="data_box${index.idUser}">
              <td>${index.idUser}</td>
              <td>${index.nameUser}</td>
              <td>${index.surnameUser}</td>
              <td>${index.email}</td>
              <td>${index.passwordUser}</td>
              <td>${index.address}</td>
              <td>
                  <button id="Updatebtn" title='Modificar' onclick="getValue(this)" value="${index.idUser}" data-toggle='modal' data-target='#myModal1'><i class='fa-solid fa-pen-to-square'></i></button>
                  <button id="Deletebtn" onclick="DeleteInfo(this)" value="${index.idUser}"><i class='fa-solid fa-trash'></i></button>
                  <button onclick="location.href='VinculosAdmin.jsp?VinculoUser=${index.nameUser}'" id="Visualizarbtn"><i class="fa-solid fa-eye"></i></button>
              </td>
          </tr>
          
      </c:forEach>
      
  </tbody>
</table>
        </div> 
      
       <button class="btn btn-primary" data-toggle="modal" id="btn_add" data-target="#myModal" style="position: absolute; margin-top: 730px; margin-left: 1472px; border-radius:100px; width: 50px; height: 50px;"><i class="fa-solid fa-plus"></i></button> 

       
     <!-- Modal Para Modificar -->
<div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
  
      <div class="modal-body" id="campos_modal01">
        
          <div class="modal-header"><h3 style="color:black; margin-left: 110px;"><i class="fa-solid fa-shield-dog"></i> Info Usuario <i class="fa-solid fa-shield-cat"></i></h3></div>
          <form method="POST" action="./Modificador_Admin?TipoUsuario=UsuarioAdmin&Opcion=Modificar" id="form-data">
               
          <input type="text" class="form-control" style="display:none;" name="txt_id">
          <input type="text" class="form-control"  id="txt_nombre" name="txt_nombre" placeholder="Nombre">
          <input type="text" class="form-control"   id="txt_apellido" name="txt_apellido" placeholder="Apellido">
          <input type="text" class="form-control"  id="txt_usuario" name="txt_usuario" placeholder="Usuario">
          <input type="text" class="form-control"   id="txt_Pswd" name="Pswd" placeholder="Contraseña">  
          <input type="text" class="form-control"   id="txt_direccion" name="txt_direccion" placeholder="Direccion">
          
           
          <div class="container ml-2"> 
          <button class="btn btn-primary btn-lg btn-block"  type='submit'  name="btnSubmit" id="Btnmod">Modificar</button>
          </div>
               </form>
      </div> 
    </div>
  </div>
</div>
          
          
      <!-- Modal para insertar DATA -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      
      <div class="modal-body">
                    <div class="modal-header"><h3 style="color:black; margin-left: 110px;"><i class="fa-solid fa-shield-dog"></i> Info Usuario <i class="fa-solid fa-shield-cat"></i></h3></div>

                    <form method="POST" action="InsertAdmin.jsp?user=${NameUser}&db=bd_user" id="form-data">
               
          <input type="text" class="form-control" style="display:none;" name="txt_id">
          <input type="text" class="form-control"  id="txt_nombre" name="txt_nombre" placeholder="Nombre">
          <input type="text" class="form-control"   id="txt_apellido" name="txt_apellido" placeholder="Apellido">
          <input type="text" class="form-control"  id="txt_usuario" name="txt_Email" placeholder="Usuario">
          <input type="text" class="form-control"   id="txt_Pswd" name="Pswd" placeholder="Contraseña">  
          <input type="text" class="form-control"   id="txt_direccion" name="txt_direccion" placeholder="Direccion">
          
           
          <div class="container ml-2"> 
          <button class="btn btn-primary btn-lg btn-block"  type='submit'  name="btnSubmit" id="Btnmod">Insertar</button>
          </div>
               </form>

      </div>
    </div>

  </div>
</div>
                    <script src="./Vista/api.js"></script>
    </body>
</html>
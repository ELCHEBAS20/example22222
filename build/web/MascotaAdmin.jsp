<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="Controlador.ControllerPets"%>
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
        <title>Mascota Dashboard</title>
    </head>
    <body>
  
        <!<!-- De aqui comienza el dashboard -->
         <jsp:include page="/Template_Dashboard/DashTemplate.jsp"/>
        <!<!-- Dashboard Vinculos del usuario.-->
       
        <div id="tbl_vinculos" class="Grafica">
           
             <table class="table rounded-sm">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nombre</th>
      <th scope="col">Años</th>
      <th scope="col">Especie</th>
      <th scope="col">Genero</th>
      <th scope="col">Raza</th>
      <th scope="col">Vinculo</th>
      <th scope="col">Acciones</th> 
       
    </tr>
  </thead>
  <tbody>
      
     <c:forEach items="${ListPetsAdmin}" var="iterador">
          
          <tr id="databox${iterador.idPet}">
              
              <td>${iterador.idPet}</td>
              <td>${iterador.namePet}</td>
              <td>${iterador.agePet}</td>
              <td>${iterador.speciesPet}</td>
              <td>${iterador.genderPet}</td>
              <td>${iterador.racePet}</td>
              <td>${iterador.idUser.nameUser}</td>
              <td>
                  <button id="Updatebtn" title="Modificar" onclick="setValue(this)" value="${iterador.idPet}"  data-toggle="modal" data-target="#myModal1"><i class="fa-solid fa-pen-to-square"></i></button>  
              </td>
              
          </tr>
          
      </c:forEach>
      
     
  </tbody>
</table>
          
        </div> 
       
       <button class="btn btn-primary" data-toggle="modal" id="btn_add" data-target="#myModal" style="position: absolute; margin-top: 730px; margin-left: 1472px; border-radius:100px; width: 50px; height: 50px;"><i class="fa-solid fa-plus"></i></button> 

        </div>

            <!-- Modal Para Modificar -->
<div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
 
      <div class="modal-body" id="campos_modal01">
        
          <div class="modal-header"><h3 style="color:black; margin-left: 110px;"><i class="fa-solid fa-shield-dog"></i> Info Usuario <i class="fa-solid fa-shield-cat"></i></h3></div>
          <form method="POST" action="./Modificador_Admin?TipoUsuario=MascotaAdmin" id="form-data">
               
          <input type="text" class="form-control" style="display:none;" name="txt_id">
          <input type="text" class="form-control"  id="txt_nombre" name="txt_nombre" placeholder="Nombre">
          <input type="text" class="form-control"   id="txt_apellido" name="txt_edad" placeholder="Apellido">
          <input type="text" class="form-control"  id="txt_usuario" name="txt_Especie" placeholder="Usuario">
          <input type="text" class="form-control"   id="txt_Pswd" name="txt_genero" placeholder="Contraseña">  
          <input type="text" class="form-control"   id="txt_direccion" name="txt_raza" placeholder="Direccion">
          
           
          <div class="container ml-2"> 
          <button class="btn btn-primary btn-lg btn-block"  type='submit'  name="btnSubmit" id="Btnmod">Modificar</button>
          </div>
               </form>
      </div> 
    </div>
  </div>
</div>

          <!-- Modal para insertar data -->

          <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
        <div class="modal-body" style="position: relative;top: -25px;">
<div class="modal-header"><h3 style="color:black; left: 100px"><i class="fa-solid fa-shield-dog"></i> Data Mascota <i class="fa-solid fa-shield-cat"></i></h3></div>
          <form action="InsertAdmin.jsp?db=bdMascota" method="POST">
               <input type="text" class="form-control" style="display:none;" name="txt_id">
          <input type="text" class="form-control"  id="txt_nombre" name="txt_nombre" placeholder="Nombre">
          <input type="text" class="form-control"   id="txt_apellido" name="txt_edad" placeholder="Edad">
          <input type="text" class="form-control"  id="txt_usuario" name="txt_Especie" placeholder="Especie">
          <input type="text" class="form-control"   id="txt_Pswd" name="txt_genero" placeholder="Genero">
          <input type="text" class="form-control"   id="txt_Pswd" name="txt_raza" placeholder="Raza">
          <select class="custom-select" id="Cmb_Id" name="Cmb_Id"  onchange="setId()" style="text-align: center; font-weight: bold; position: relative; top: 20px;" id="cmbId"> 
              <option selected="#">Seleccionar un [Id]</option>
  
               <c:forEach items="${ListAdmin_user}" var="index">
                   <option value="${index.nameUser},${index.idUser}">${index.idUser}</option>
          </tr>
          
      </c:forEach>
            
           <input type="text" class="form-control" style="display: none;" disabled="false"  id="txt_user_id"  placeholder="txt_user_id">
          
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

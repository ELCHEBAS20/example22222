<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>

<%@page import="java.util.List"%>
<%@page import="Controlador.ControllerUser"%>
<%@page import="Controlador.ControllerAdmin"%>
<%@page import="Controlador.ControllerInfoChip"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>InfoChip Dashboard</title>
    </head>
    <body>
   
        <%
         
            String strlNikckname=request.getParameter("usuario");
            
             String nombre = request.getSession().getAttribute("UserAdmin").toString();
            
    ControllerAdmin ctrlAdmin=new ControllerAdmin();
    String []StrlSplit=ctrlAdmin.DataProfile(strlNikckname).split("\\,");
    ControllerInfoChip ctrlinfo = new ControllerInfoChip();
    String StatusFinal = ctrlinfo.Status_Chip();
    String RstStatus = "";
         
        for (int index = 0; index < StatusFinal.length(); index++) {
                if (index % 2 != 0) {
                    RstStatus += StatusFinal.charAt(index);
                }
            }
  
          String Strlrequest=request.getParameter("usuario");
         List<Object[]> listdata=ctrlinfo.ListarInfo();
        %>
        
        <!<!-- De aqui comienza el dashboard -->
        
        
        <div class="d-flex"> 
        
            <div id="sidebar-container">
                <div class="logo">
                    <h4>WELCOME</h4>
                </div>        
                <div class="menu"> 
            <a href="Inicio_Admin.jsp" class="d-block  p-4 ml-2"><i class="fa-solid fa-layer-group mr-2 "></i>Dashboard</a>
                    <a href="ProfileAdmin.jsp" class="d-block p-4 ml-2" ><i class="fa-sharp fa-solid fa-user mr-2 lead"></i>Perfil</a>
                      <a href="UsuarioAdmin.jsp" class="d-block  p-4 ml-2" ><i class="fa-solid fa-database mr-2 "></i>Usuarios</a>
                       <a href="MascotaAdmin.jsp" class="d-block  p-4 ml-2"><i class="fa-solid fa-database mr-2"></i>Mascotas</a>
                        <a href="InfoChipAdmin.jsp" class="d-block  p-4 ml-2"><i class="fa-solid fa-database mr-2"></i>InfoChip</a>
                        
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
     
        <li class="nav-item dropdown" id="perfil_admini">
        <a id="user-text" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <img src="Img/admin01.png" class="img-fluid rounded-circle avatar mr-2">
         <%=StrlSplit[1]%>
        </a>
        <div class="dropdown-menu"  id="drop_menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" id="Lg_Sign_off" href="Sing_Off_Admin.jsp"><i class="fa-solid fa-right-from-bracket"></i> <strong>Cerrar Sesion</strong></a>
        </div>
      </li>
    </ul>
  </div>
                 </div>
</nav>
            </div>
        
        <!<!-- Dashboard Vinculos del usuario.-->
       
        <div id="tbl_vinculos" class="Grafica">

              <table class="table rounded-sm">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Serial_Chip</th>
      <th scope="col">Estado_Chip</th>
      <th scope="col">Bateria_Chip</th>
      <th scope="col">Grafico</th>
      <th scope="col">Acciones</th> 
       
    </tr>
  </thead>
  <tbody>
            <%
              String MsgBatery = "", BatteryColor = "";
                  for (Object[] elem : listdata) {
            %>
              
            <%
               if (Integer.parseInt(elem[3].toString()) >= 70 && Integer.parseInt(elem[3].toString()) <= 100) {
                       MsgBatery = "full";
                       BatteryColor = "white";
                   } else if (Integer.parseInt(elem[3].toString()) >= 40 && Integer.parseInt(elem[3].toString()) < 70) {
                       MsgBatery = "half";
                       BatteryColor = "white";
                   } else if (Integer.parseInt(elem[3].toString()) >= 10 && Integer.parseInt(elem[3].toString()) < 40) {
                       MsgBatery = "quarter";
                       BatteryColor = "red";
                   } else if (Integer.parseInt(elem[3].toString()) >= 0 && Integer.parseInt(elem[3].toString()) < 10) {
                       MsgBatery = "empty";
                       BatteryColor = "red";
                   }
            %>
  
             <tr id="data_box<%=elem[0]%>">
                <td><%=elem[0]%></td>
                 <td><%=elem[1]%></td>
                  <td><%=elem[2]%></td>
                   <td><%=elem[3]%></td>
                   <td><i style="font-size: 20px;color:<%=BatteryColor%>" class="fa-solid fa-battery-<%=MsgBatery%>"></i></td>
                   <td>
                       <button id="Updatebtn" title="Modificar" onclick="getValue(this)" value="<%=elem[0]%>" data-toggle="modal" data-target="#myModal1"><i class="fa-solid fa-pen-to-square"></i></button> 
                       <button id="Deletebtn"  title="Eliminar" value="<%=elem[0]%>" onclick="DeleteInfo(this);"><i class="fa-solid fa-trash"></i></button> 
              
            </td>
            </tr>
            
             <%}%>
            
  </tbody>
</table>  
        </div>         
        </div>

     <!-- Modal Para Modificar -->
     
<div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
  
      <div class="modal-body" id="campos_modal01">
        
          <div class="modal-header"><h3 style="color:black; margin-left: px;"><i class="fa-solid fa-shield-dog"></i> Info Usuario <i class="fa-solid fa-shield-cat"></i></h3></div>
          <form method="POST" action="ModificadorAdmin.jsp?Bd=info_chip&usuario=<%=Strlrequest%>" id="form-data">
               
          <input type="text" class="form-control" style="display:none;" name="txt_id">
          <input type="text" class="form-control"  id="txt_nombre" name="txt_serial" placeholder="Serial">
          <input type="text" class="form-control"   id="txt_apellido" name="txt_estado_chip" placeholder="Estado Chip">
          <input type="text" class="form-control"  id="txt_usuario" name="txt_bateria" placeholder="Bateria">

          <div class="container ml-2"> 
          <button class="btn btn-primary btn-lg btn-block"  type='submit'  name="btnSubmit" id="Btnmod">Modificar</button>
          </div>
               </form>
      </div> 
    </div>
  </div>
</div>
             
      <script>
  
   'use strict';

   let LocalData=sessionStorage.getItem("Session");
       
          if(LocalData=="session_invalidate"){
              $('.menu').remove();
              $('#tbl_vinculos').remove();
              $('#perfil_admini').remove();
          }
            
   // Obtenemos el [Id] Por medio del click que haga el usuario.
  
         let getValue=(event)=>{   
          
          let Datos_Input=[];
          
            let btnModificar=$(event).val();  
            let data_form=document.getElementById("data_box"+btnModificar).children;
              let data_input=document.querySelector("#form-data").children;
              
              for (let index = 0; index <4; index++) {              
                 Datos_Input.push(data_form[index].textContent.trim());
               }
                 
                 for (let iterador = 0; iterador < data_input.length; iterador++) {
                    data_input[iterador].value=Datos_Input[iterador];
               }   
        }

      // Por medio del click que haga el usuario sabremos si lo quiere eliminar o efectivamente nop.
      
          let DeleteInfo=(event)=>{
              
            const setId=$(event).val();
            
           swal({
                    title: "¿Estas seguro que quiere eliminar la Info?",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                  }).then((isDelete) => {
                    if (isDelete) {                   
                    setTimeout(() => {
                        location.href="DeleteAdmin.jsp?idInfo="+setId+"&"+"Db=Info"+"&"+"user="+"<%=Strlrequest%>";
                    }, 1000);
                    } else {
                     return false;
                    }
                  });   
           }

     </script>
                  

    </body>
</html>

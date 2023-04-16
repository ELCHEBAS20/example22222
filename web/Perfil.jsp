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
        <title>Perfil Dashboard</title>
    </head>
    <body>
   
        <%
         
          String nombre=request.getSession().getAttribute("Adress").toString();
          ControllerUser CtrlUser=new ControllerUser();
          String StrlNombre[]=CtrlUser.DataProfile(nombre).split("\\,");
          
          String Profile=(Integer.parseInt(StrlNombre[1])%2==0) ? "Profile02" : "Profile01";
          
        %>
        
        <!<!-- De aqui comienza el dashboard -->
        
        
        <div class="d-flex"> 
        
            <div id="sidebar-container">
                <div class="logo">
                    <h4>WELCOME</h4>
                </div>        
                <div class="menu"> 
                    <a href="Inicio.jsp" class="d-block  p-4 ml-2"><i class="fa-solid fa-layer-group mr-2 "></i>Dashboard</a>
                     <a href="Perfil.jsp?usuario" class="d-block p-4 ml-2" ><i class="fa-sharp fa-solid fa-user mr-2 lead"></i>Perfil</a>
                      <a href="VinculoUser.jsp?Usuario" class="d-block  p-4 ml-2" ><i class="fa-sharp fa-solid fa-arrow-right mr-2"></i>Vinculos</a>
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
              <a class="dropdown-item" id="Lg_Sign_off" href="Sing_Off.jsp"><i class="fa-solid fa-right-from-bracket"></i>  <strong>Cerrar Sesion</Strong> </a>
        </div>
      </li>
    </ul>
    
  </div>
                 </div>
</nav>
            </div>
        
        <!<!-- Dashboard Vinculos del usuario.-->
       
    <div id="tbl_vinculos"> 
   
        <img id="ImgProfile" src="Img/<%=Profile+".png"%>" >
        
        <form action="Mod_Del_Crud.jsp?iduser=<%=StrlNombre[1]%>&db=profile_user" method="POST">
             <div id="InfoProfile"><h1 style="color: black;margin-top: 20px;">
               
                <div id="info_first"> 
                    <label>USUARIO:</label><input id="Pswd_text" name="Txt_usuario" class="form-control Caja1" type="text" >
                <label>CONTRASEÑA:</label><input id="Pswd_text" name="Txt_pswd"  class="form-control Caja2" type="text">
                <label>APELLIDO:</label><input id="Pswd_text" name="Txt_apellido"  class="form-control Caja3" type="text">
                </div>
                
                <div id="info_second">
                    <label>DIRECCION:</label><input id="Pswd_text" name="Txt_direccion"  class="form-control Caja4" type="text">
                    <label>EMAIL:</label><input id="Pswd_text" name="txt_email" class="form-control Caja5" type="text">
                    <label>TIPO DE USUARIO:</label><input disabled="true" id="Pswd_text" class="form-control Caja6" type="text">
                </div>
 
            </div>
        
        <button class="btn btn-danger" type="submit" style="position: relative; left:580px; top: 160px; width: 350px;">Modificar</button>
        </form>
        
        </div> 
        
        </div>
    
        
        <script> 
        
        let ValorLocal=sessionStorage.getItem("Session");
       
       if(ValorLocal=="session_invalidate"){
               $('.menu').hide();
               $('#tbl_vinculos').remove();
               $('#perfil_general').hide();
             }
        
      let ExportInfo=()=>{
          
          let name="<%=StrlNombre[2]%>".trim();
          let surname="<%=StrlNombre[4]%>".trim();
          let pswd="<%=StrlNombre[3]%>".trim();
          let address="<%=StrlNombre[5]%>".trim();
          let Email="<%=StrlNombre[6]%>".trim();

          let infoUser={
              nombre:name,
              Contraseña:pswd,
              apellido:surname,
              Direccion:address,
              Emai:Email,
              Tipo:"Usuario"
          };
          
          let LngInfo=Object.values(infoUser);
          
          for (let index = 0; index <LngInfo.length; index++) {
       $('.Caja'+(index+1)).val(LngInfo[index]);
} 
}
      
       ExportInfo();
       
       
        </script>
    
    </body>
</html>

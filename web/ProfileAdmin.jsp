<%-- 
    Document   : Inicio_Admin
    Created on : 27-sep-2022, 0:08:35
    Author     : Juan Sebastian S
--%>


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
        <title>Profile Dashboard</title>
    </head>
    <body>
        
         <%
        String _Data_ = (String) request.getSession().getAttribute("DataProfile");
        String[] StrlProfile = _Data_.split("\\,");
    %> 
   
        
        <!<!-- De aqui comienza el dashboard -->
        <jsp:include page="/Template_Dashboard/DashTemplate.jsp"/>
        
        <!<!-- Dashboard Vinculos del usuario.-->
       <div id="tbl_vinculos"> 

           <img id="ImgProfile" src="Img/adminProfile.png" >
        
           <form action="ModificadorAdmin.jsp?Bd=User_Admin_Modi&usuario=${NameUser}&idUsuario=<%=StrlProfile[0]%>" method="POST">
               <div id="InfoProfile"><h1 style="color: black;margin-top: 20px;">
               
                <div id="info_first01"> 
                    <label>NOMBRE:</label><input id="Pswd_text" class="form-control Caja1" name="txt_nombre"  value="<%=StrlProfile[1]%>" type="text" >
                <label>APELLIDO:</label><input id="Pswd_text" class="form-control Caja2" name="txt_apellido" value="<%=StrlProfile[2]%>" type="text">
                
                </div>
                
                <div id="info_second02">
                    <label>USUARIO:</label><input id="Pswd_text" class="form-control Caja4" name="txt_user" value="<%=StrlProfile[3]%>" type="text">
                    <label>PSWD</label><input id="Pswd_text" class="form-control Caja5" name="txt_contra" value="<%=StrlProfile[4]%>" type="text">
                </div>
            </div>
        
                <button class="btn btn-danger" type="submit" style="position: relative; left:580px; top: 100px; width: 350px;">Modificar</button>
           </form>
        
                
        </div> 
        
        </div>
       </div> 
        
        </div>

        
        <script> 
       let LocalData=sessionStorage.getItem("Session");
       
          if(LocalData=="session_invalidate"){
              $('.menu').remove();
              $('#tbl_vinculos').remove();
              $('#perfil_admini').remove();
          }
        </script>
       
    </body>
</html>

<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>
<%@page import="Modelo.PetsMain"%>
<%@page import="Controlador.ControllerPets"%>
<%@page import="Modelo.UsersMain"%>
<%@page import="Modelo.UsersMain_"%>
<%@page import="Controlador.ControllerUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
         
             String Temp=request.getParameter("db");
           String urluser=request.getParameter("user"); 
            
           
           if(Temp.equals("bdMascota")){
           String nombre=request.getParameter("txt_nombre");
           String edad=request.getParameter("txt_edad");
           String especie=request.getParameter("txt_Especie");
           String genero=request.getParameter("txt_genero");
           String raza=request.getParameter("txt_raza");
           String idVinculo=request.getParameter("Cmb_Id");
           String StrlSplit[]=idVinculo.split("\\,");
           
           UsersMain user=new UsersMain(Integer.parseInt(StrlSplit[1]));
             
         PetsMain pets=new PetsMain(null,nombre,especie,genero,Integer.parseInt(edad), raza, user);
         
           ControllerPets petsCtrl=new ControllerPets();
          petsCtrl.CrearUser(pets);
          response.sendRedirect("MascotaAdmin.jsp?usuario="+urluser);
            }else if(Temp.equals("bd_user")){
            
            ControllerUser ctrlUser = new ControllerUser();
          
           String nameUser=request.getParameter("txt_nombre");
           String surnameUser=request.getParameter("txt_apellido");
           String passwordUser=request.getParameter("Pswd");
           String email=request.getParameter("txt_Email");
           String address=request.getParameter("txt_direccion");
          
           UsersMain userobj = new UsersMain(null, nameUser, surnameUser, passwordUser, address, email, "Usuario");
           ctrlUser.CrearUser(userobj);
           response.sendRedirect("UsuarioAdmin.jsp?usuario="+urluser);
            
            }
         
        %>
    </body>
</html>

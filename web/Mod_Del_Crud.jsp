<%-- 
  Integrantes: Paula Bonilla,Kevin Cañon,Juan Suarez.
  Descripcion: "Login con [JAVA WEB] con dos diferentes roles tanto para usuario como para admin."
  fecha_de_entrega: XXX-XXX-XXX
  Version: 1.0
--%>

<%@page import="Controlador.ControllerUser"%>
<%@page import="Modelo.PetsMain"%>
<%@page import="Modelo.UsersMain"%>
<%@page import="Controlador.ControllerPets"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
           
            /* 
            String id=request.getParameter("txt_id").trim();
            String nombre = request.getParameter("txt_nombre").trim(); 
            String especie = request.getParameter("txt_especie").trim();
            String genero = request.getParameter("genero").trim();
            String raza = request.getParameter("txt_raza").trim();
            String age=request.getParameter("txt_nombre2").trim();
            PetsMain pets=new PetsMain();

            pets.setNamePet(nombre);
            pets.setSpeciesPet(especie);
            pets.setGenderPet(genero);
            pets.setRacePet(raza);
            pets.setIdPet(Integer.parseInt(id));
            pets.setAgePet(Integer.parseInt(age));
            
            ControllerPets ctrlPets = new ControllerPets();
            ctrlPets.ModificarPets(pets);
            response.sendRedirect("VinculoUser.jsp");
        */
             
            String type_db=request.getParameter("db");
             String id_user=request.getParameter("iduser");
             String usuario=request.getParameter("Txt_usuario");
             String contraseña=request.getParameter("Txt_pswd");
             String apellido=request.getParameter("Txt_apellido");
             String direccion=request.getParameter("Txt_direccion");
             String email=request.getParameter("txt_email");
             
             if(type_db.equalsIgnoreCase("profile_user")){
                ControllerUser userCtrl=new ControllerUser();       
            UsersMain userObj=new UsersMain();
      
  
         userObj.setNameUser(usuario);
         userObj.setPasswordUser(contraseña);
         userObj.setSurnameUser(apellido);
         userObj.setAddress(direccion);
         userObj.setEmail(email);
         userObj.setIdUser(Integer.parseInt(id_user));
             userCtrl.ModificadorUser(userObj);
             
              response.sendRedirect("Perfil.jsp");
              
            }else if(type_db.equalsIgnoreCase("vinculo")){
            
            String id=request.getParameter("txt_id").trim();
            String nombre = request.getParameter("txt_nombre").trim(); 
            String especie = request.getParameter("txt_especie").trim();
            String genero = request.getParameter("genero").trim();
            String raza = request.getParameter("txt_raza").trim();
            String age=request.getParameter("txt_nombre2").trim();
            PetsMain pets=new PetsMain();

            pets.setNamePet(nombre);
            pets.setSpeciesPet(especie);
            pets.setGenderPet(genero);
            pets.setRacePet(raza);
            pets.setIdPet(Integer.parseInt(id));
            pets.setAgePet(Integer.parseInt(age));
            
            ControllerPets ctrlPets = new ControllerPets();
            ctrlPets.ModificarPets(pets);
            response.sendRedirect("VinculoUser.jsp");
            }

    

     out.print("El elemento fue modificado capturado correctamente.");
   ;
        %>
       
    </body>
</html>

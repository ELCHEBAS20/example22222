/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controlador.ControllerAdmin;
import Controlador.ControllerPets;
import Controlador.ControllerUser;
import Modelo.AdminMain;
import Modelo.PetsMain;
import Modelo.UsersMain;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(name = "Modificador_Admin", urlPatterns = {"/Modificador_Admin"})
public class Modificador_Admin extends HttpServlet {

    
       static String tipoUsuario, DefAccion, setId = "", name = "", user = "", surname = "", pswd = "", Address = ""; // Usuario
       static String Edad = "", Especie = "", Genero = "", Raza = ""; // Mascota

    
      ControllerUser ctrlUser = new ControllerUser();
      ControllerPets ctrlPets=new ControllerPets();

        protected String Redirect_default(HttpServletRequest request, HttpServletResponse response){
          return tipoUsuario.equals("UsuarioAdmin") ? "UsuarioAdmin.jsp" : "MascotaAdmin.jsp";
      }
      
     // Urls 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        PrintWriter out=response.getWriter();
        HttpSession session = request.getSession(); // obtenemos sesiones
        tipoUsuario=request.getParameter("TipoUsuario");
         DefAccion=request.getParameter("Opcion");
         setId=request.getParameter("id");

        if (tipoUsuario.equals("UsuarioAdmin")) {
            if (DefAccion.equals("Eliminar")) {
                ctrlUser.DetroyUserDash(Integer.parseInt(setId));
                session.setAttribute("ListAdmin_user", ctrlUser.ListarInfo()); 
                response.sendRedirect(this.Redirect_default(request, response));
            }
        }else if(tipoUsuario.equals("InfoChipAdmin")){
            
              if(DefAccion=="ModificarInfo"){
                  
              }else{
                  
              }
        }
        
    }
    
    //Formularios que manejan POST para obtener los NAME de los campos.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        PrintWriter out=response.getWriter();
        HttpSession session = request.getSession(); // obtenemos sesiones en General.
        
         tipoUsuario=request.getParameter("TipoUsuario");
         DefAccion=request.getParameter("Opcion");

         switch (tipoUsuario) {
            case "UsuarioAdmin":

                 if(DefAccion.equals("Modificar")){

                     setId = request.getParameter("txt_id");
                     name = request.getParameter("txt_nombre");
                     user = request.getParameter("txt_usuario");
                     surname = request.getParameter("txt_apellido");
                     pswd = request.getParameter("Pswd");
                     Address = request.getParameter("txt_direccion");

                     UsersMain userObj = new UsersMain(Integer.parseInt(setId), name, surname, pswd, Address, user, "Usuario");

                     ctrlUser.ModificadorUser(userObj);
                     session.setAttribute("ListAdmin_user", ctrlUser.ListarInfo());
                     response.sendRedirect(this.Redirect_default(request, response));
                
                 }
                break;
                
            case "MascotaAdmin":
                
                PetsMain objPets = new PetsMain();

                setId = request.getParameter("txt_id");
                name = request.getParameter("txt_nombre");
                Edad = request.getParameter("txt_edad");
                Especie = request.getParameter("txt_Especie");
                Genero = request.getParameter("txt_genero");
                Raza = request.getParameter("txt_raza");

                objPets.setIdPet(Integer.parseInt(setId));
                objPets.setNamePet(name);
                objPets.setAgePet(Integer.parseInt(Edad));
                objPets.setSpeciesPet(Especie);
                objPets.setGenderPet(Genero);
                objPets.setRacePet(Raza);

                ctrlPets.ModificarPets(objPets);
                session.setAttribute("ListPetsAdmin", ctrlPets.ListarPets());    
                response.sendRedirect(this.Redirect_default(request, response));

                break;
 
        }
    }

    
}

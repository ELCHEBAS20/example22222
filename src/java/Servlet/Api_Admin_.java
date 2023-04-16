/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controlador.ControllerAdmin;
import Controlador.ControllerInfoChip;
import Controlador.ControllerPets;
import Controlador.ControllerUser;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Juan Sebastian S
 */
@WebServlet(name = "Api_Admin_", urlPatterns = {"/Api_Admin_"})
public class Api_Admin_ extends HttpServlet {

    static String msg="";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{

         PrintWriter out=response.getWriter();
         
         String nombreAdmin=request.getParameter("txt_admin");
         String pswdAdmin=request.getParameter("txt_pswd_admin");

         JSONObject objJson=new JSONObject(); // insertamos el Msg.
        JSONArray list=new JSONArray(); // mostramos el Objecto JSON.
        HttpSession session=request.getSession(); // obtenemos sesiones
 
        ControllerUser ctrlUser=new ControllerUser();
        ControllerAdmin ctrlAdmin=new ControllerAdmin();
        ControllerInfoChip ctrlInfo=new ControllerInfoChip();
        ControllerPets ctrlPets=new ControllerPets();
        
        
          if(nombreAdmin.isEmpty() || pswdAdmin.isEmpty()){
              msg="null";
              objJson.put("msg",msg);
              list.add(objJson);
          }else{ 
              
              boolean isValidate = ctrlAdmin.IngresaAdmin(nombreAdmin, pswdAdmin);
              
         if(isValidate!=true){
             
             msg="true";
             objJson.put("msg",msg);
             session.setAttribute("txtAdmin", nombreAdmin);
             String user = (String) request.getSession().getAttribute("txtAdmin");
             String []RstSplit=ctrlAdmin.DataProfile(user).split("\\,");
             session.setAttribute("NameUser",RstSplit[1]);
             session.setAttribute("DataProfile", ctrlAdmin.DataProfile(user));
             session.setAttribute("Ncantidad", ctrlInfo.Defcantidad());
             session.setAttribute("ListAdmin_user",ctrlUser.ListarInfo());
             session.setAttribute("ListPetsAdmin",ctrlPets.ListarPets());
          
             list.add(objJson);
         }else{
             msg="false";
             objJson.put("msg",msg);
             list.add(objJson);
         }
         
          }
         out.print(list.toJSONString()); 
    }
    }

   



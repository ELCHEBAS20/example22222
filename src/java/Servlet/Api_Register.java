/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controlador.ControllerUser;
import Modelo.UsersMain;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Juan Sebastian S
 */
@WebServlet(name = "Api_Register", urlPatterns = {"/Api_Register"})
public class Api_Register extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
            PrintWriter out=response.getWriter();
            JSONArray ObjArray=new JSONArray();
            JSONObject List=new JSONObject();
            
            ControllerUser CtrlUser=new ControllerUser();
            
            boolean Flag=true;
            
            String nombre=request.getParameter("txt_usuario");
            String apellido=request.getParameter("txt_apellido");
            String Password=request.getParameter("txt_Contrasena");
            String Direccion=request.getParameter("txt_Direccion");
            String e_mail=request.getParameter("txt_Email");
            
            
            if(nombre=="" || apellido=="" || Password=="" || Direccion=="" || e_mail==""){
                Flag=false;
            }

            if(Flag){
                UsersMain user=new UsersMain(null, nombre, apellido, Password, Direccion, e_mail,"Usuario");
                CtrlUser.CrearUser(user);
                List.put("MsgFinal",Flag);
                ObjArray.add(List);
            }else{
                List.put("MsgFinal",Flag);
                ObjArray.add(List);
            }
            
             out.println(ObjArray.toJSONString());

    }
}

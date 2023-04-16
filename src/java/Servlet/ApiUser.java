
package Servlet;

import Controlador.ControllerUser;
import Modelo.UsersMain;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/ApiUser")
public class ApiUser extends HttpServlet {
    
static String msg=""; // Atributo Estatico de la clase APIREST.

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        
        PrintWriter out=response.getWriter();
        
        try {
            
        String nombre=request.getParameter("txt_usuario"); 
        String pwd=request.getParameter("txt_pwd");
       
        JSONObject objJson=new JSONObject(); // insertamos el Msg.
        JSONArray list=new JSONArray(); // mostramos el Objecto JSON.
        HttpSession session=request.getSession(); // obtenemos sesiones
        
        ControllerUser CtrlUser=new ControllerUser();
        UsersMain user=new UsersMain(nombre,pwd);
        
        boolean isNull=CtrlUser.IngresaUser(user);
        
         if(isNull){
             msg="1";
        objJson.put("msg",msg); 
        list.add(objJson);
      
        session.setAttribute("Adress",nombre);
        
         }else{
             msg="-1";
             objJson.put("msg",msg);
             list.add(objJson);
         }
         
         out.println(list.toJSONString()); // convetir el JSON en cadena para por pocision.
         
        } catch (Exception e) {
            System.err.println(this.equals(e));
        }
    }
}

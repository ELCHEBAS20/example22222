
package Controlador;

import Modelo.AdminMain;
import Modelo.Conexion;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;


public class ControllerAdmin {
    
    /*Llamamos la conexion tanto de la clase conexion como de la persistencia [Entitymanager]*/
    private static EntityManager getConnect(){ 
        EntityManager Connect=Conexion.getObjConnect().getApiConnect().createEntityManager();
        return Connect;
    }
    
    
    public String[] defDatosPerfil(String userName){

        String[] StrlSplit=DataProfile(userName).split("\\,");
        
        return StrlSplit;
    }
    
    /*El Ingresa a la plataforma con sus creendenciales respectivas.*/
     public boolean IngresaAdmin(String nombre,String pswd){
         
         /*Conexion a la persistencia*/
        EntityManager em = getConnect();

        /*Consultas en la DB.*/
        Query query = em.createQuery("SELECT a.nameAdmin FROM AdminMain a WHERE a.nickname=:nickname AND a.passwordAdmin=:passwordAdmin");
        query.setParameter("nickname",nombre);
        query.setParameter("passwordAdmin",pswd);
        /*Resultante de la QUERY de la DB.*/
        List Rst = query.getResultList();

        /*Condicional Ternario*/
        boolean RstQuery = (Rst.isEmpty()) ? true : false; 

        return RstQuery;
     }
     
      /*Datos para el perfil del dashboard*/
      public String DataProfile(String user){
          
          EntityManager em = getConnect();
          String MsgFinal="";
          
          Query query=em.createQuery("SELECT a.idAdmin,a.nameAdmin,a.surnameAdmin,a.nickname,a.passwordAdmin FROM AdminMain a WHERE a.nickname=:nickname");
          
          query.setParameter("nickname",user);
          
          List <Object[]> listData=query.getResultList();
          
          for (Object[] ListObj : listData) {
              
               for (int index = 0; index < ListObj.length; index++) {
                    
                   if(MsgFinal==""){
                       MsgFinal+=ListObj[index];
                   }else{
                       MsgFinal+=","+ListObj[index];
                   }
                    
              }
          }

          return MsgFinal;
      }
      
      public void ModificadorPerfil(AdminMain admin){
          
          EntityManager em=getConnect();
          
          Query query=em.createQuery("UPDATE AdminMain SET nameAdmin = :nameAdmin,surnameAdmin = :surnameAdmin,nickname = :nickname,passwordAdmin = :passwordAdmin where idAdmin = :idAdmin");

          query.setParameter("nameAdmin", admin.getNameAdmin());
          query.setParameter("surnameAdmin",admin.getSurnameAdmin());
          query.setParameter("nickname",admin.getNickname());
          query.setParameter("passwordAdmin",admin.getPasswordAdmin());
          query.setParameter("idAdmin",admin.getIdAdmin());
          
        em.getTransaction().begin();
        int Rst = query.executeUpdate();
        em.getTransaction().commit();
        em.close();
          
      }
     
}

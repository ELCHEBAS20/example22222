/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Conexion;
import Modelo.InfochipMain;
import Modelo.PetsMain;
import Modelo.UsersMain;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.swing.JOptionPane;

/**
 *
 * @author Juan Sebastian S
 */
public class ControllerInfoChip {
    
    /*Llamamos la conexion tanto de la clase conexion como de la persistencia [Entitymanager]*/
    private static EntityManager getConnect(){ 
        EntityManager Connect=Conexion.getObjConnect().getApiConnect().createEntityManager();
        return Connect;
    }
    
    public String  Defcantidad(){
         ControllerInfoChip ctrlinfo = new ControllerInfoChip();
    String StatusFinal = ctrlinfo.Status_Chip();
    String RstStatus = "";
         
        for (int index = 0; index < StatusFinal.length(); index++) {
                if (index % 2 != 0) {
                    RstStatus += StatusFinal.charAt(index);
                }
            }
        
        return RstStatus;
            
    }
    
    /*Datos para el perfil del dashboard*/
      public String Status_Chip(){
          
          EntityManager em = getConnect();
          String MsgFinal="";
          
          Query query=em.createQuery("SELECT i.statusChip,COUNT(i.statusChip) FROM InfochipMain i GROUP BY i.statusChip");
          
          List <Object[]> listData=query.getResultList();
          
          for (Object[] ListObj : listData) {
              
               for (int index = 0; index < ListObj.length; index++) {
                    
                   MsgFinal+=ListObj[index];    
              }
          }

          return MsgFinal;
      }
  
     /*Listar info de la clase Respectiva*/
      public List ListarInfo(){
          
          EntityManager em=getConnect();
          
          Query query=em.createQuery("SELECT i.idChip,i.serialChip,i.statusChip,i.battery FROM InfochipMain i");
          
          List<Object[]> listdata=query.getResultList();
          
          return listdata;
          
      }
      
      /*Modificar de la clase ControllerChip*/
      public void ModificarChip(InfochipMain infoChip){
    
        EntityManager em=getConnect();    
        
        Query query=em.createQuery("UPDATE InfochipMain SET serialChip=:serialChip,statusChip=:statusChip,battery=:battery WHERE idChip = :idChip");
        
        query.setParameter("serialChip",infoChip.getSerialChip());
        query.setParameter("statusChip",infoChip.getStatusChip());
        query.setParameter("battery",infoChip.getBattery());
        query.setParameter("idChip",infoChip.getIdChip());
        em.getTransaction().begin();
        int Rst=query.executeUpdate();
        em.getTransaction().commit();
        em.close();
 
    } 

      public void DetroyInfoChip(Integer id){
       
           EntityManager em=getConnect();
           InfochipMain infoChip; 

              try {
              
              em.getTransaction().begin();
              infoChip=em.getReference(InfochipMain.class,id);
              infoChip.getIdChip();
              em.remove(infoChip);
              em.getTransaction().commit();

          } catch (Exception e) {
              System.err.println(e);
          }
         
          
      }
}

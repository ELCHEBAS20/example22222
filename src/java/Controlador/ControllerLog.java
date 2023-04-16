/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Conexion;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Juan Sebastian S
 */
public class ControllerLog {

    /*Llamamos la conexion tanto de la clase conexion como de la persistencia [Entitymanager]*/
     private static EntityManager getConnect(){ 
        EntityManager Connect=Conexion.getObjConnect().getApiConnect().createEntityManager();
        return Connect;
    }
   
     public List Listar_Encontrados(int id){
        
        String msgFinal="";
        
        /*Conexion a la persistencia*/
        EntityManager em = getConnect();
        
        Query query=em.createQuery("SELECT l.idLog,l.datePetsLost,l.datePetsLocated,l.description FROM LogPets l INNER JOIN l.idPet a INNER JOIN a.idUser b WHERE b.idUser=:idUser");
        query.setParameter("idUser",id);
        
        List<Object[]> listDatos=query.getResultList();
        
        
        return listDatos;
    }
    
}


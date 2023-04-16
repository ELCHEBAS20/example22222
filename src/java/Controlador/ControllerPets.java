/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Conexion;
import Modelo.PetsMain;
import Modelo.UsersMain;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Juan Sebastian S
 */
public class ControllerPets {
    
     /*Llamamos la conexion tanto de la clase conexion como de la persistencia [Entitymanager]*/
     private static EntityManager getConnect(){ 
        EntityManager Connect=Conexion.getObjConnect().getApiConnect().createEntityManager();
        return Connect;
    }
    
    public void ModificarPets(PetsMain petsAge){
    
        EntityManager em=getConnect();    
        
        Query query=em.createQuery("UPDATE PetsMain SET namePet=:namePet,speciesPet=:speciesPet,genderPet=:genderPet,agePet=:agePet,racePet=:racePet WHERE idPet=:idPet");
        query.setParameter("namePet",petsAge.getNamePet());
        query.setParameter("speciesPet",petsAge.getSpeciesPet());
        query.setParameter("genderPet",petsAge.getGenderPet());
        query.setParameter("agePet",petsAge.getAgePet());
        query.setParameter("racePet",petsAge.getRacePet());
        query.setParameter("idPet",petsAge.getIdPet());
        
        em.getTransaction().begin();
        int Rst=query.executeUpdate();
        em.getTransaction().commit();
        em.close();
 
    }  
    
    public List<PetsMain> ListarPets(){
        
        EntityManager em=getConnect();
        
        Query query=em.createQuery("SELECT b FROM PetsMain b");

        return query.getResultList();
    }
    
    /*Se inserta la data correspondiente*/
      
      public void CrearUser(PetsMain pets){
         
         EntityManager em=getConnect();
         
         try {
             em.getTransaction().begin();
             em.persist(pets);
             em.getTransaction().commit();
             System.out.print("Se ingreso correctamente la data.");
         } catch (Exception e) {
             System.err.print(e);;
         }
     }
    
}
    


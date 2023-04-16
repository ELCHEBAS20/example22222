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
public class ControllerUser {

    /*Llamamos la conexion tanto de la clase conexion como de la persistencia [Entitymanager]*/
    private static EntityManager getConnect() {
        EntityManager Connect = Conexion.getObjConnect().getApiConnect().createEntityManager();
        return Connect;
    }

    /*El Ingresa a la plataforma con sus creendenciales respectivas.*/
    public boolean IngresaUser(UsersMain user) {

        /*Conexion a la persistencia*/
        EntityManager em = getConnect();

        /*Consultas en la DB.*/
        Query query = em.createQuery("SELECT u.email,u.passwordUser FROM UsersMain u WHERE u.email=:email AND u.passwordUser=:passwordUser");
        query.setParameter("email", user.getEmail());
        query.setParameter("passwordUser", user.getPasswordUser());
        /*Resultante de la QUERY de la DB.*/
        List Rst = query.getResultList();

        /*Condicional Ternario*/
        boolean RstQuery = (Rst.isEmpty()) ? false : true;

        return RstQuery;

    }

    /*Vinculos del usuario sobre el animal*/
    public List Vinculos(String user) {

        String msgFinal = "";

        EntityManager em = getConnect();

        Query query = em.createQuery("SELECT b FROM PetsMain b INNER JOIN b.idUser a WHERE a.nameUser=:nameUser");
        query.setParameter("nameUser", user);

        List<Object[]> listDatos = query.getResultList();

        return listDatos;
    }

    
    
    public List<UsersMain> ListarInfo() {

        EntityManager em = getConnect();

        Query query = em.createQuery("SELECT u FROM UsersMain u");

        return query.getResultList();
    }
    
    public String getName(String nameUser) {

        EntityManager em = getConnect();

        Query query = em.createQuery("SELECT u.nameUser from UsersMain u WHERE u.nameUser:nameUser");
        query.setParameter("nameUser", nameUser);

        List<Object[]> listDatos = query.getResultList();

        String rstFinal = String.valueOf(listDatos);

        return rstFinal;

    }

    /*==========================================================================================*/

 /*Informacion para el Dashboard con el ID,USERNAME & IMAGEN*/
    public String DataProfile(String user) {

        EntityManager em = getConnect();
        String ImgProfile = "";
        String QueryFinish = "";

        Query query = em.createQuery("SELECT u.idUser,u.nameUser,u.passwordUser,u.surnameUser,u.address,u.email FROM UsersMain u WHERE u.email=:email");
        query.setParameter("email", user);
        List<Object[]> listDatos = query.getResultList();

        for (Object[] listDato : listDatos) {

            for (int index = 0; index < listDato.length; index++) {
                if (QueryFinish.equals("")) {
                    QueryFinish += listDato[index];
                } else {
                    QueryFinish += "," + listDato[index];
                }
            }
        }

        String getId = String.valueOf(QueryFinish.charAt(0));

        if (Integer.parseInt(getId) % 2 == 0) {
            ImgProfile = "user2.png";
        } else {
            ImgProfile = "user1.png";
        }

        ImgProfile += "," + QueryFinish;

        return ImgProfile;
    }

    /*Se crea el CRUD para el usuario en el dashboard aca COMIENZA*/
    public void CrearUser(UsersMain user) {

        EntityManager em = getConnect();

        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            System.err.print(e);
        }
    }

    /*Modificar de la clase ControllerChip*/
    public void ModificadorUser(UsersMain user) {

        EntityManager em = getConnect();

        Query query = em.createQuery("UPDATE UsersMain SET nameUser=:nameUser,surnameUser=:surnameUser,passwordUser=:passwordUser,address=:address,email=:email,typeUser=:typeUser WHERE idUser=:idUser");

        query.setParameter("nameUser", user.getNameUser());
        query.setParameter("surnameUser", user.getSurnameUser());
        query.setParameter("passwordUser", user.getPasswordUser());
        query.setParameter("address", user.getAddress());
        query.setParameter("email", user.getEmail());
        query.setParameter("typeUser", "Usuario");
        query.setParameter("idUser", user.getIdUser());

        em.getTransaction().begin();
        int Rst = query.executeUpdate();
        em.getTransaction().commit();
        em.close();

    }
    
    public void DetroyUserDash(Integer id) {
        EntityManager em = getConnect();
        UsersMain User;
        try {
            em.getTransaction().begin();
            User = em.getReference(UsersMain.class, id);
            em.remove(User);
            em.getTransaction().commit();

        } catch (Exception e) {
            System.err.println(e);
        }
    }

   

    /*Aca termina el CRUD respectivo.*/
 /*==========================================================================================*/
}

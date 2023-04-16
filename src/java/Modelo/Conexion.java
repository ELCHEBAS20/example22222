
package Modelo;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class Conexion {
    
    private static Conexion ObjConnect=new Conexion(); // Instanciamos la misma clase para poder obtener la conexion.
    private static EntityManagerFactory ApiConnect; // Obtenemos la conexion por medio de la persistencia.xml
    
    public Conexion(){ // El metodo Constructor Obtiene La conexion total de la DB con la PERSISTENCIA.
        ApiConnect=Persistence.createEntityManagerFactory("MpasWebPU");
    }
    
    public static Conexion getObjConnect() {  // El metodo retorno el objeto con la conexion.
        return ObjConnect;
    }

    public EntityManagerFactory getApiConnect() { // Me retorna la conexion total por medio de la persistencia.
        return ApiConnect;
    } 
}

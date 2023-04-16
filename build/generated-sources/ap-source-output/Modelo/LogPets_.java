package Modelo;

import Modelo.PetsMain;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-11-15T21:19:14")
@StaticMetamodel(LogPets.class)
public class LogPets_ { 

    public static volatile SingularAttribute<LogPets, PetsMain> idPet;
    public static volatile SingularAttribute<LogPets, Date> datePetsLocated;
    public static volatile SingularAttribute<LogPets, Date> datePetsLost;
    public static volatile SingularAttribute<LogPets, String> description;
    public static volatile SingularAttribute<LogPets, Integer> idLog;

}
package Modelo;

import Modelo.LogPets;
import Modelo.UsersMain;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-11-15T21:19:14")
@StaticMetamodel(PetsMain.class)
public class PetsMain_ { 

    public static volatile SingularAttribute<PetsMain, Integer> agePet;
    public static volatile SingularAttribute<PetsMain, String> racePet;
    public static volatile SingularAttribute<PetsMain, UsersMain> idUser;
    public static volatile SingularAttribute<PetsMain, Integer> idPet;
    public static volatile CollectionAttribute<PetsMain, LogPets> logPetsCollection;
    public static volatile SingularAttribute<PetsMain, String> namePet;
    public static volatile SingularAttribute<PetsMain, String> genderPet;
    public static volatile SingularAttribute<PetsMain, String> speciesPet;

}
package Modelo;

import Modelo.PetsMain;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2022-11-15T21:19:14")
@StaticMetamodel(UsersMain.class)
public class UsersMain_ { 

    public static volatile SingularAttribute<UsersMain, Integer> idUser;
    public static volatile SingularAttribute<UsersMain, String> nameUser;
    public static volatile SingularAttribute<UsersMain, String> address;
    public static volatile SingularAttribute<UsersMain, String> typeUser;
    public static volatile SingularAttribute<UsersMain, String> surnameUser;
    public static volatile SingularAttribute<UsersMain, String> passwordUser;
    public static volatile SingularAttribute<UsersMain, String> email;
    public static volatile CollectionAttribute<UsersMain, PetsMain> petsMainCollection;

}
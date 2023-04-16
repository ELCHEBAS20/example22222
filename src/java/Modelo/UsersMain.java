/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Juan Sebastian S
 */
@Entity
@Table(name = "users_main")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "UsersMain.findAll", query = "SELECT u FROM UsersMain u"),
    @NamedQuery(name = "UsersMain.findByIdUser", query = "SELECT u FROM UsersMain u WHERE u.idUser = :idUser"),
    @NamedQuery(name = "UsersMain.findByNameUser", query = "SELECT u FROM UsersMain u WHERE u.nameUser = :nameUser"),
    @NamedQuery(name = "UsersMain.findBySurnameUser", query = "SELECT u FROM UsersMain u WHERE u.surnameUser = :surnameUser"),
    @NamedQuery(name = "UsersMain.findByPasswordUser", query = "SELECT u FROM UsersMain u WHERE u.passwordUser = :passwordUser"),
    @NamedQuery(name = "UsersMain.findByAddress", query = "SELECT u FROM UsersMain u WHERE u.address = :address"),
    @NamedQuery(name = "UsersMain.findByEmail", query = "SELECT u FROM UsersMain u WHERE u.email = :email"),
    @NamedQuery(name = "UsersMain.findByTypeUser", query = "SELECT u FROM UsersMain u WHERE u.typeUser = :typeUser")})
public class UsersMain implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id_User")
    private Integer idUser;
    @Basic(optional = false)
    @Column(name = "Name_User")
    private String nameUser;
    @Basic(optional = false)
    @Column(name = "Surname_User")
    private String surnameUser;
    @Basic(optional = false)
    @Column(name = "Password_User")
    private String passwordUser;
    @Basic(optional = false)
    @Column(name = "Address")
    private String address;
    @Basic(optional = false)
    @Column(name = "Email")
    private String email;
    @Basic(optional = false)
    @Column(name = "Type_User")
    private String typeUser;
    @OneToMany(mappedBy = "idUser", cascade = CascadeType.REMOVE)
    private Collection<PetsMain> petsMainCollection;

    public UsersMain() {
    }

    public UsersMain(Integer idUser) {
        this.idUser = idUser;
    }

    public UsersMain(Integer idUser, String nameUser, String surnameUser, String passwordUser, String address, String email, String typeUser) {
        this.idUser = idUser;
        this.nameUser = nameUser;
        this.surnameUser = surnameUser;
        this.passwordUser = passwordUser;
        this.address = address;
        this.email = email;
        this.typeUser = typeUser;
    }

    public UsersMain(String email, String passwordUser) {
        this.passwordUser = passwordUser;
        this.email = email;
    }

    
    
    

    public Integer getIdUser() {
        return idUser;
    }

    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getSurnameUser() {
        return surnameUser;
    }

    public void setSurnameUser(String surnameUser) {
        this.surnameUser = surnameUser;
    }

    public String getPasswordUser() {
        return passwordUser;
    }

    public void setPasswordUser(String passwordUser) {
        this.passwordUser = passwordUser;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTypeUser() {
        return typeUser;
    }

    public void setTypeUser(String typeUser) {
        this.typeUser = typeUser;
    }

    @XmlTransient
    public Collection<PetsMain> getPetsMainCollection() {
        return petsMainCollection;
    }

    public void setPetsMainCollection(Collection<PetsMain> petsMainCollection) {
        this.petsMainCollection = petsMainCollection;
    }

    
    
}

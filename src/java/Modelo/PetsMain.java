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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "pets_main")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PetsMain.findAll", query = "SELECT p FROM PetsMain p"),
    @NamedQuery(name = "PetsMain.findByIdPet", query = "SELECT p FROM PetsMain p WHERE p.idPet = :idPet"),
    @NamedQuery(name = "PetsMain.findByNamePet", query = "SELECT p FROM PetsMain p WHERE p.namePet = :namePet"),
    @NamedQuery(name = "PetsMain.findBySpeciesPet", query = "SELECT p FROM PetsMain p WHERE p.speciesPet = :speciesPet"),
    @NamedQuery(name = "PetsMain.findByGenderPet", query = "SELECT p FROM PetsMain p WHERE p.genderPet = :genderPet"),
    @NamedQuery(name = "PetsMain.findByAgePet", query = "SELECT p FROM PetsMain p WHERE p.agePet = :agePet"),
    @NamedQuery(name = "PetsMain.findByRacePet", query = "SELECT p FROM PetsMain p WHERE p.racePet = :racePet")})
public class PetsMain implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id_Pet")
    private Integer idPet;
    @Basic(optional = false)
    @Column(name = "Name_Pet")
    private String namePet;
    @Basic(optional = false)
    @Column(name = "Species_Pet")
    private String speciesPet;
    @Basic(optional = false)
    @Column(name = "Gender_Pet")
    private String genderPet;
    @Basic(optional = false)
    @Column(name = "Age_Pet")
    private int agePet;
    @Basic(optional = false)
    @Column(name = "Race_Pet")
    private String racePet;
    @JoinColumn(name = "Id_User", referencedColumnName = "Id_User")
    @ManyToOne
    private UsersMain idUser;
    @OneToMany(mappedBy = "idPet", cascade = CascadeType.REMOVE)
    private Collection<LogPets> logPetsCollection;

    public PetsMain() {
    }

    public PetsMain(Integer idPet) {
        this.idPet = idPet;
    }

    public PetsMain(Integer idPet, String namePet, String speciesPet, String genderPet, int agePet, String racePet, UsersMain idUser) {
        this.idPet = idPet;
        this.namePet = namePet;
        this.speciesPet = speciesPet;
        this.genderPet = genderPet;
        this.agePet = agePet;
        this.racePet = racePet;
        this.idUser = idUser;
    }

    public PetsMain(Integer idPet, String namePet, int agePet,UsersMain idUser) {
        this.idPet = idPet;
        this.namePet = namePet;
        this.agePet = agePet;
        this.idUser = idUser;
    }

    public Integer getIdPet() {
        return idPet;
    }

    public void setIdPet(Integer idPet) {
        this.idPet = idPet;
    }

    public String getNamePet() {
        return namePet;
    }

    public void setNamePet(String namePet) {
        this.namePet = namePet;
    }

    public String getSpeciesPet() {
        return speciesPet;
    }

    public void setSpeciesPet(String speciesPet) {
        this.speciesPet = speciesPet;
    }

    public String getGenderPet() {
        return genderPet;
    }

    public void setGenderPet(String genderPet) {
        this.genderPet = genderPet;
    }

    public int getAgePet() {
        return agePet;
    }

    public void setAgePet(int agePet) {
        this.agePet = agePet;
    }

    public String getRacePet() {
        return racePet;
    }

    public void setRacePet(String racePet) {
        this.racePet = racePet;
    }

    public UsersMain getIdUser() {
        return idUser;
    }

    public void setIdUser(UsersMain idUser) {
        this.idUser = idUser;
    }

    @XmlTransient
    public Collection<LogPets> getLogPetsCollection() {
        return logPetsCollection;
    }

    public void setLogPetsCollection(Collection<LogPets> logPetsCollection) {
        this.logPetsCollection = logPetsCollection;
    }

    @Override
    public String toString() {
        return "PetsMain{" + "idPet=" + idPet + ", namePet=" + namePet + ", speciesPet=" + speciesPet + ", genderPet=" + genderPet + ", agePet=" + agePet + ", racePet=" + racePet + ", idUser=" + idUser + ", logPetsCollection=" + logPetsCollection + '}';
    }
    
    

}

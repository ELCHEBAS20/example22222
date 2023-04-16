/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Juan Sebastian S
 */
@Entity
@Table(name = "admin_main")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AdminMain.findAll", query = "SELECT a FROM AdminMain a"),
    @NamedQuery(name = "AdminMain.findByIdAdmin", query = "SELECT a FROM AdminMain a WHERE a.idAdmin = :idAdmin"),
    @NamedQuery(name = "AdminMain.findByNameAdmin", query = "SELECT a FROM AdminMain a WHERE a.nameAdmin = :nameAdmin"),
    @NamedQuery(name = "AdminMain.findBySurnameAdmin", query = "SELECT a FROM AdminMain a WHERE a.surnameAdmin = :surnameAdmin"),
    @NamedQuery(name = "AdminMain.findByNickname", query = "SELECT a FROM AdminMain a WHERE a.nickname = :nickname"),
    @NamedQuery(name = "AdminMain.findByPasswordAdmin", query = "SELECT a FROM AdminMain a WHERE a.passwordAdmin = :passwordAdmin")})
public class AdminMain implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id_Admin")
    private Integer idAdmin;
    @Basic(optional = false)
    @Column(name = "Name_Admin")
    private String nameAdmin;
    @Basic(optional = false)
    @Column(name = "Surname_Admin")
    private String surnameAdmin;
    @Basic(optional = false)
    @Column(name = "Nickname")
    private String nickname;
    @Basic(optional = false)
    @Column(name = "Password_Admin")
    private String passwordAdmin;

    public AdminMain() {
    }

    public AdminMain(Integer idAdmin) {
        this.idAdmin = idAdmin;
    }

    public AdminMain(Integer idAdmin, String nameAdmin, String surnameAdmin, String nickname, String passwordAdmin) {
        this.idAdmin = idAdmin;
        this.nameAdmin = nameAdmin;
        this.surnameAdmin = surnameAdmin;
        this.nickname = nickname;
        this.passwordAdmin = passwordAdmin;
    }

    public Integer getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(Integer idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getNameAdmin() {
        return nameAdmin;
    }

    public void setNameAdmin(String nameAdmin) {
        this.nameAdmin = nameAdmin;
    }

    public String getSurnameAdmin() {
        return surnameAdmin;
    }

    public void setSurnameAdmin(String surnameAdmin) {
        this.surnameAdmin = surnameAdmin;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPasswordAdmin() {
        return passwordAdmin;
    }

    public void setPasswordAdmin(String passwordAdmin) {
        this.passwordAdmin = passwordAdmin;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idAdmin != null ? idAdmin.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AdminMain)) {
            return false;
        }
        AdminMain other = (AdminMain) object;
        if ((this.idAdmin == null && other.idAdmin != null) || (this.idAdmin != null && !this.idAdmin.equals(other.idAdmin))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.AdminMain[ idAdmin=" + idAdmin + " ]";
    }
    
}

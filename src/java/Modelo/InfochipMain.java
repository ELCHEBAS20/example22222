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
@Table(name = "infochip_main")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "InfochipMain.findAll", query = "SELECT i FROM InfochipMain i"),
    @NamedQuery(name = "InfochipMain.findByIdChip", query = "SELECT i FROM InfochipMain i WHERE i.idChip = :idChip"),
    @NamedQuery(name = "InfochipMain.findBySerialChip", query = "SELECT i FROM InfochipMain i WHERE i.serialChip = :serialChip"),
    @NamedQuery(name = "InfochipMain.findByStatusChip", query = "SELECT i FROM InfochipMain i WHERE i.statusChip = :statusChip"),
    @NamedQuery(name = "InfochipMain.findByBattery", query = "SELECT i FROM InfochipMain i WHERE i.battery = :battery")})
public class InfochipMain implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id_Chip")
    private Integer idChip;
    @Basic(optional = false)
    @Column(name = "Serial_Chip")
    private String serialChip;
    @Basic(optional = false)
    @Column(name = "Status_Chip")
    private String statusChip;
    @Basic(optional = false)
    @Column(name = "Battery")
    private int battery;

    public InfochipMain() {
    }

    public InfochipMain(Integer idChip) {
        this.idChip = idChip;
    }

    public InfochipMain(Integer idChip, String serialChip, String statusChip, int battery) {
        this.idChip = idChip;
        this.serialChip = serialChip;
        this.statusChip = statusChip;
        this.battery = battery;
    }

    public Integer getIdChip() {
        return idChip;
    }

    public void setIdChip(Integer idChip) {
        this.idChip = idChip;
    }

    public String getSerialChip() {
        return serialChip;
    }

    public void setSerialChip(String serialChip) {
        this.serialChip = serialChip;
    }

    public String getStatusChip() {
        return statusChip;
    }

    public void setStatusChip(String statusChip) {
        this.statusChip = statusChip;
    }

    public int getBattery() {
        return battery;
    }

    public void setBattery(int battery) {
        this.battery = battery;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idChip != null ? idChip.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InfochipMain)) {
            return false;
        }
        InfochipMain other = (InfochipMain) object;
        if ((this.idChip == null && other.idChip != null) || (this.idChip != null && !this.idChip.equals(other.idChip))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.InfochipMain[ idChip=" + idChip + " ]";
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Juan Sebastian S
 */
@Entity
@Table(name = "log_pets")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "LogPets.findAll", query = "SELECT l FROM LogPets l"),
    @NamedQuery(name = "LogPets.findByIdLog", query = "SELECT l FROM LogPets l WHERE l.idLog = :idLog"),
    @NamedQuery(name = "LogPets.findByDatePetsLost", query = "SELECT l FROM LogPets l WHERE l.datePetsLost = :datePetsLost"),
    @NamedQuery(name = "LogPets.findByDatePetsLocated", query = "SELECT l FROM LogPets l WHERE l.datePetsLocated = :datePetsLocated"),
    @NamedQuery(name = "LogPets.findByDescription", query = "SELECT l FROM LogPets l WHERE l.description = :description")})
public class LogPets implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "Id_Log")
    private Integer idLog;
    @Basic(optional = false)
    @Column(name = "DatePets_Lost")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datePetsLost;
    @Basic(optional = false)
    @Column(name = "DatePets_Located")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datePetsLocated;
    @Basic(optional = false)
    @Column(name = "Description")
    private String description;
    @JoinColumn(name = "Id_Pet", referencedColumnName = "Id_Pet")
    @ManyToOne
    private PetsMain idPet;

    public LogPets() {
    }

    public LogPets(Integer idLog) {
        this.idLog = idLog;
    }

    public LogPets(Integer idLog, Date datePetsLost, Date datePetsLocated, String description) {
        this.idLog = idLog;
        this.datePetsLost = datePetsLost;
        this.datePetsLocated = datePetsLocated;
        this.description = description;
    }

    public Integer getIdLog() {
        return idLog;
    }

    public void setIdLog(Integer idLog) {
        this.idLog = idLog;
    }

    public Date getDatePetsLost() {
        return datePetsLost;
    }

    public void setDatePetsLost(Date datePetsLost) {
        this.datePetsLost = datePetsLost;
    }

    public Date getDatePetsLocated() {
        return datePetsLocated;
    }

    public void setDatePetsLocated(Date datePetsLocated) {
        this.datePetsLocated = datePetsLocated;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public PetsMain getIdPet() {
        return idPet;
    }

    public void setIdPet(PetsMain idPet) {
        this.idPet = idPet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idLog != null ? idLog.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof LogPets)) {
            return false;
        }
        LogPets other = (LogPets) object;
        if ((this.idLog == null && other.idLog != null) || (this.idLog != null && !this.idLog.equals(other.idLog))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Modelo.LogPets[ idLog=" + idLog + " ]";
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entites;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Embeddable
public class DemandeCongeId implements Serializable {
  

    @Column(name = "employeId")
    private int employeId;

    @Temporal(TemporalType.DATE)
    @Column(name = "dateDebut")
    private Date dateDebut;

    @Temporal(TemporalType.DATE)
    @Column(name = "dateFin")
    private Date dateFin;

    public DemandeCongeId() {
    }

    public DemandeCongeId(int employeId, Date dateDebut, Date dateFin) {
        this.employeId = employeId;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
    }

    // Getters and Setters
    public int getEmployeId() {
        return employeId;
    }

    public void setEmployeId(int employeId) {
        this.employeId = employeId;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    // equals() & hashCode() doivent être générés pour que JPA gère bien la clé composite
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof DemandeCongeId)) return false;
        DemandeCongeId that = (DemandeCongeId) obj;
        return employeId == that.employeId &&
                dateDebut.equals(that.dateDebut) &&
                dateFin.equals(that.dateFin);
    }

    @Override
    public int hashCode() {
        return employeId + dateDebut.hashCode() + dateFin.hashCode();
    }
}



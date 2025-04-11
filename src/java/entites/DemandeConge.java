package entites;

import javax.persistence.*;
import java.util.Date;

@Entity
@IdClass(DemandeCongeId.class)
public class DemandeConge {

    @Id
    @Column(name = "employeId")
    private int employeId;

    @Id
    @Temporal(TemporalType.DATE)
    @Column(name = "dateDebut")
    private Date dateDebut;

    @Id
    @Temporal(TemporalType.DATE)
    @Column(name = "dateFin")
    private Date dateFin;

    private String statut;

    @ManyToOne
    @JoinColumn(name = "employeId", insertable = false, updatable = false)
    private Employe employe;

    public DemandeConge() {}

    public DemandeConge(int employeId, Date dateDebut, Date dateFin, String statut, Employe employe) {
        this.employeId = employeId;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.statut = statut;
        this.employe = employe;
    }

    // Getters & Setters
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

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    public Employe getEmploye() {
        return employe;
    }

    public void setEmploye(Employe employe) {
        this.employe = employe;
    }
    @Override
    public String toString() {
     return "DemandeConge{" +
            "employe=" + employe.getNom() + " " + employe.getPrenom() +
            ", dateDebut=" + dateDebut +
            ", dateFin=" + dateFin +
            ", statut='" + statut + '\'' +
            '}';
}

}

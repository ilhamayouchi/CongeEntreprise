/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entites;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author hp
 */
@Entity
public class Employe extends User {
 


    private String poste;

    @ManyToOne
    @JoinColumn(name = "departement_id")
    private Departement departement;

    public Employe() {
    }

    public Employe(String nom, String prenom, String email, String password) {
        super(nom, prenom, email, password);
    }

    public String getPoste() {
        return poste;
    }

    public Departement getDepartement() {
        return departement;
    }

    public void setPoste(String poste) {
        this.poste = poste;
    }

    public void setDepartement(Departement departement) {
        this.departement = departement;
    }
    
   @Override
    public String toString() {
     return "Employe{" +
            "nom='" + getNom() + '\'' +
            ", prenom='" + getPrenom() + '\'' +
            ", poste='" + poste + '\'' +
            ", departement=" + (departement != null ? departement.getNom() : "Aucun") +
            '}';
}





     
    
    
}

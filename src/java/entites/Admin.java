/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entites;

import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

/**
 *
 * @author hp
 */
@Entity
@Table(name = "admin")
@PrimaryKeyJoinColumn(name = "id")
public class Admin extends User {

    public Admin() {
    }

   public Admin(String nom, String prenom, String email, String password, String role) {
        super(nom, prenom, email, password, role);
    }
    @Override
    public String toString() {
            return "Admin{" +
                    "id=" + getId() +
                    ", nom='" + getNom() + '\'' +
                    ", prenom='" + getPrenom() + '\'' +
                    ", email='" + getEmail() + '\'' +
                    ", password='" + getPassword() + '\'' +
                    '}';
}


   
    
    
}

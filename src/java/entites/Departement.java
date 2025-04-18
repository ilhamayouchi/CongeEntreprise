package entites;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "departements")
public class Departement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    

    private String nom;

    @OneToMany(mappedBy = "departement")
    private List<Employe> employes;
    public List<Employe> getEmployes() {
            return employes;
        }

    public void setEmployes(List<Employe> employes) {
        this.employes = employes;
    }
    
    public Departement() {
    }

    public Departement(int id, String nom) {
        this.id = id;
        this.nom = nom;
    }
    
    public int getId() {
        return id;
    }

    public String getNom() {
        return nom;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    
    
}

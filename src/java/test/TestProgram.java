package test;

import dao.EmployeDao;
import entites.Employe;
import entites.Departement;
import util.HibernateUtil;

import org.hibernate.Session;
import java.util.List;

public class TestProgram  {

    public static void main(String[] args) {
        // Initialiser la session Hibernate
        HibernateUtil.getSessionFactory();

        // Initialiser le DAO pour les employés
        EmployeDao employeDao = new EmployeDao();

        // Créer un département (exemple : Informatique)
        Departement informatique = new Departement(1,"Informatique");
        
        // Créer des employés
        Employe employe1 = new Employe("Ahmed", "ahmed@example.com", "engeneer","informatique");
        Employe employe2 = new Employe("Fatima", "fatima@example.com",null, null); // Pas de département
        Employe employe3 = new Employe("Ali", "ali@example.com", "comptable" ,"economie");
        
        // Sauvegarder les employés dans la base de données
        employeDao.create(employe1);
        employeDao.create(employe2);
        employeDao.create(employe3);

        // Afficher tous les employés
        System.out.println("\nTous les employés :");
        for (Employe e : employeDao.findAll()) {
            System.out.println(e);
        }

        // Filtrage des employés par département (Informatique)
        System.out.println("\nEmployés du département Informatique :");
        filterEmployesByDepartement(informatique);
    }

    // Méthode pour filtrer et afficher les employés d'un département sans utiliser Query
    private static void filterEmployesByDepartement(Departement departement) {
        // Récupérer tous les employés
        EmployeDao employeDao = new EmployeDao();
        List<Employe> employes = employeDao.findAll();

        // Filtrer les employés ayant le même département que celui spécifié
        for (Employe e : employes) {
            if (e.getDepartement() != null && e.getDepartement().getId() == departement.getId()) {
                System.out.println(e);
            }
        }
    }
}

package test;

import dao.EmployeDao;
import entites.Employe;
import java.util.List;

public class TestFindByDepartement {

    public static void main(String[] args) {
        EmployeDao employeDao = new EmployeDao();
        
        // Test pour rechercher des employés d'un département
        List<Employe> employes = employeDao.findByNomAndDepartement("Informatique");

        if (employes != null && !employes.isEmpty()) {
            System.out.println("Employés dans le département Informatique :");
            for (Employe employe : employes) {
                System.out.println(employe.getNom() + " " + employe.getPrenom());
            }
        } else {
            System.out.println("Aucun employé trouvé dans le département Informatique.");
        }
    }
}

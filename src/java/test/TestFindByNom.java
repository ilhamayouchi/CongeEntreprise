package test;

import dao.EmployeDao;
import entites.Employe;
import java.util.List;

public class TestFindByNom {

   public static void main(String[] args) {
        EmployeDao employeDao = new EmployeDao();

        List<Employe> employes = employeDao.findByNom("Fatima");

        if (employes != null && !employes.isEmpty()) {
            System.out.println("Employés avec le nom Fatima :");
            for (Employe employe : employes) {
                System.out.println(employe.getNom() + " " + employe.getPrenom());
            }
        } else {
            System.out.println("Aucun employé trouvé avec le nom Fatima.");
        }
    }
}

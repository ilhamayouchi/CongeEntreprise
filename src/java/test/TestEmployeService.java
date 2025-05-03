/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;
import entites.Employe;
import java.util.List;
import services.EmployeService;
/**
 *
 * @author hp
 */
public class TestEmployeService {
 


    public static void main(String[] args) {
        EmployeService employeService = new EmployeService();

        List<Employe> employes = employeService.findAll();

        if (employes != null && !employes.isEmpty()) {
            System.out.println("✔ Employés récupérés depuis la base :");
            for (Employe emp : employes) {
                System.out.println(emp.getId() + " - " + emp.getNom() + " " + emp.getPrenom());
            }
        } else {
            System.out.println("❌ Aucun employé trouvé ou erreur de connexion !");
        }
    }
}



package test;

import dao.AdminDao;
import dao.DepartementDao;
import dao.EmployeDao;
import dao.DemandeCongeDao;
import entites.Admin;
import entites.Departement;
import entites.Employe;
import entites.DemandeConge;

import java.util.Date;

public class TestProgram {

    public static void main(String[] args) {
        // Instanciation des DAO
        DepartementDao deptDao      = new DepartementDao();
        AdminDao      adminDao     = new AdminDao();
        EmployeDao    employeDao   = new EmployeDao();
        DemandeCongeDao dcDao      = new DemandeCongeDao();

        // 1) Création et persistance du département "Informatique"
        Departement informatique = new Departement();
        informatique.setNom("Informatique");
        deptDao.create(informatique);

        // 2) Création et persistance d’un Admin
        Admin admin = new Admin(
            "John", "Doe",
            "john.doe@example.com",
            "password123",
            "admin"
        );
        adminDao.create(admin);

        // 3) Création et persistance d’un Employé
        Employe employe = new Employe(
            "engineer",     // poste
            "Ahmed",        // nom
            "Mili",         // prénom
            "ahmed@example.com",
            "password",     // mot de passe
            "employe"       // rôle
        );
        employe.setDepartement(informatique);
        employeDao.create(employe);

        // 4) Création et persistance d’une DemandeConge
        DemandeConge demande = new DemandeConge(
            employe.getId(),
            new Date(),
            new Date(),
            "En attente",
            employe
        );
        dcDao.create(demande);

        // 5) Affichage des résultats
        System.out.println("✅ Données insérées avec succès !");
        System.out.println("Admin        : " + admin);
        System.out.println("Employé      : " + employe);
        System.out.println("DemandeConge : " + demande);
    }
}

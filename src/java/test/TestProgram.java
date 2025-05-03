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
import java.util.Calendar;

public class TestProgram {

    public static void main(String[] args) {
        // Instanciation des DAO
        DepartementDao deptDao = new DepartementDao();
        AdminDao adminDao = new AdminDao();
        EmployeDao employeDao = new EmployeDao();
        DemandeCongeDao dcDao = new DemandeCongeDao();

        // 1) Création des départements
        Departement informatique = new Departement();
        informatique.setNom("Informatique");
        deptDao.create(informatique);

        Departement rh = new Departement();
        rh.setNom("Ressources Humaines");
        deptDao.create(rh);

        Departement finance = new Departement();
        finance.setNom("Finance");
        deptDao.create(finance);

        // 2) Création des administrateurs avec noms arabes
        Admin admin1 = new Admin(
            "Mohamed", "Al-Mansour",
            "mohamed.almansour@example.com",
            "admin123",
            "admin"
        );
        adminDao.create(admin1);

        Admin admin2 = new Admin(
            "Fatima", "Zahra",
            "fatima.zahra@example.com",
            "admin456",
            "admin"
        );
     
         adminDao.create(admin2);
        Admin admin3 = new Admin(
            "youssef", "ayouchi",
            "youssef@gmail.com",
            "admin900",
            "admin"
        );
        adminDao.create(admin3);
        Admin admin4 = new Admin(
            "testadmin", "TestAdmin",
            "admintest@gmail.com",
            "admin800",
            "admin"
        );
        adminDao.create(admin4);

        // 3) Création des employés avec noms arabes
        // Département Informatique
        Employe dev1 = new Employe(
            "Développeur Senior", "Karim", "Ben Ahmed",
            "karim.benahmed@example.com", "dev123", "employe"
        );
        dev1.setDepartement(informatique);
        employeDao.create(dev1);

        Employe dev2 = new Employe(
            "Développeur Frontend", "Leila", "Al-Fassi",
            "leila.alfassi@example.com", "frontend123", "employe"
        );
        dev2.setDepartement(informatique);
        employeDao.create(dev2);

         Employe dev3 = new Employe(
            "Développeur Frontend", "manal", "Alayouchi",
            "ilyy@gmail.com", "manal123", "employe"
        );
        dev3.setDepartement(informatique);
        employeDao.create(dev3);
        
         Employe dev4 = new Employe(
            "Développeur Frontend", "testemploye", "EmployeTest",
            "employe@gmail.com", "testemploye123", "employe"
        );
          dev4.setDepartement(informatique);
        employeDao.create(dev4);
        // Département RH
        Employe rh1 = new Employe(
            "Responsable RH", "Youssef", "El-Masry",
            "youssef.elmasry@example.com", "rh123", "employe"
        );
        rh1.setDepartement(rh);
        employeDao.create(rh1);

        Employe rh2 = new Employe(
            "Assistant RH", "Amina", "Bouaziz",
            "amina.bouaziz@example.com", "rh456", "employe"
        );
        rh2.setDepartement(rh);
        employeDao.create(rh2);

        // Département Finance
        Employe fin1 = new Employe(
            "Comptable", "Omar", "Al-Khatib",
            "omar.alkhatib@example.com", "compta123", "employe"
        );
        fin1.setDepartement(finance);
        employeDao.create(fin1);

        // 4) Création des demandes de congé
        // Demande acceptée
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 10);
        Date startDate1 = cal.getTime();
        cal.add(Calendar.DATE, 14);
        Date endDate1 = cal.getTime();
        
        DemandeConge demande1 = new DemandeConge(
            dev1.getId(),
            startDate1,
            endDate1,
            "Approuvée",
            dev1
        );
        dcDao.create(demande1);

        // Demande en attente
        cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 30);
        Date startDate2 = cal.getTime();
        cal.add(Calendar.DATE, 7);
        Date endDate2 = cal.getTime();
        
        DemandeConge demande2 = new DemandeConge(
            dev2.getId(),
            startDate2,
            endDate2,
            "En attente",
            dev2
        );
        dcDao.create(demande2);

        // Demande refusée
        cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 15);
        Date startDate3 = cal.getTime();
        cal.add(Calendar.DATE, 10);
        Date endDate3 = cal.getTime();
        
        DemandeConge demande3 = new DemandeConge(
            rh1.getId(),
            startDate3,
            endDate3,
            "Refusée",
            rh1
        );
        dcDao.create(demande3);

        // 5) Affichage des résultats
        System.out.println("✅ Données insérées avec succès !");
        System.out.println("\n=== Admins ===");
        System.out.println("1. " + admin1.getPrenom() + " " + admin1.getNom());
        System.out.println("2. " + admin2.getPrenom() + " " + admin2.getNom());
        System.out.println("3. " + admin3.getPrenom() + " " + admin3.getNom());
        
        System.out.println("\n=== Employés ===");
        System.out.println("1. " + dev1.getPrenom() + " " + dev1.getNom() + " - " + dev1.getPoste());
        System.out.println("2. " + dev2.getPrenom() + " " + dev2.getNom() + " - " + dev2.getPoste());
         System.out.println("3. " + dev3.getPrenom() + " " + dev3.getNom() + " - " + dev3.getPoste());
        System.out.println("4. " + rh1.getPrenom() + " " + rh1.getNom() + " - " + rh1.getPoste());
        System.out.println("5. " + rh2.getPrenom() + " " + rh2.getNom() + " - " + rh2.getPoste());
        System.out.println("6. " + fin1.getPrenom() + " " + fin1.getNom() + " - " + fin1.getPoste());
        
        System.out.println("\n=== Demandes de Congé ===");
        System.out.println("1. " + dev1.getPrenom() + " " + dev1.getNom() + 
                         " - Statut: " + demande1.getStatut() + 
                         " - Du " + demande1.getDateDebut() + " au " + demande1.getDateFin());
        System.out.println("2. " + dev2.getPrenom() + " " + dev2.getNom() + 
                         " - Statut: " + demande2.getStatut() + 
                         " - Du " + demande2.getDateDebut() + " au " + demande2.getDateFin());
        System.out.println("3. " + rh1.getPrenom() + " " + rh1.getNom() + 
                         " - Statut: " + demande3.getStatut() + 
                         " - Du " + demande3.getDateDebut() + " au " + demande3.getDateFin());
    }
}
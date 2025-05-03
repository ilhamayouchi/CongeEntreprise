package dao;

import entites.Employe;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;



public class EmployeDao extends AbstractDao<Employe> {

    public EmployeDao() {
        super(Employe.class);
    }
    
    public List<Employe> findByNomAndDepartement(String departementNom) {
        Session session = null;
        Transaction tx = null;
        List<Employe> employes = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            employes = session.getNamedQuery("Employe.findByNomAndDepartement")
                    .setParameter("departementNom", departementNom)
                    .list();

            tx.commit();
        } catch (HibernateException ex) {
            if (tx != null) tx.rollback();
            ex.printStackTrace();
        } finally {
            if (session != null) session.close();
        }

        return employes;
    }
    public List<Employe> findByNom(String nom) {
    Session session = null;
    Transaction tx = null;
    List<Employe> employes = null;

    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();

        employes = session
                .getNamedQuery("Employe.findByNom")
                .setParameter("nom", nom)
                .list();

        tx.commit();
    } catch (HibernateException e) {
        if (tx != null) tx.rollback();
        e.printStackTrace();
    } finally {
        if (session != null) session.close();
    }

    return employes;
}
    public Employe findByUserId(int userId) {
    Session session = null;
    Transaction tx = null;
    Employe employe = null;
    
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        
        // Requête HQL pour trouver l'employé associé à un User
        employe = (Employe) session.createQuery("FROM Employe e WHERE e.user.id = :userId")
                                 .setParameter("userId", userId)
                                 .uniqueResult();
        
        tx.commit();
    } catch (HibernateException ex) {
        if (tx != null) {
            tx.rollback();
        }
        System.err.println("Erreur lors de la recherche de l'employé par user ID: " + ex.getMessage());
        ex.printStackTrace();
    } finally {
        if (session != null) {
            session.close();
        }
    }
    
    return employe;
}
     public Employe findClientByEmail(String email) {
        Session session = null;
        Transaction tx = null;
        Employe client = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            client = (Employe) session.getNamedQuery("findClientByEmail").setParameter("email", email).uniqueResult();
            tx.commit();
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return client;
    }
    public List<Employe> getEmployes() {
    Session session = null;
    List<Employe> employes = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        employes = session.createQuery("from Employe").list();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (session != null) {
            session.close();
        }
    }

    if (employes == null) {
        employes = new java.util.ArrayList<>();
    }

    return employes;
}

    public Employe findByEmailAndPassword(String email, String hashedPassword) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    
}

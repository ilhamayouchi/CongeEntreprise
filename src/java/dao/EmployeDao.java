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

    
}

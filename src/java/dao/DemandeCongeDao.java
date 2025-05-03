package dao;

import entites.DemandeConge;
import entites.DemandeCongeId;
import entites.Departement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.Query;
import util.HibernateUtil;

public class DemandeCongeDao extends AbstractDao<DemandeConge> {
    
    public DemandeCongeDao() {
        super(DemandeConge.class);
    }
    
    public DemandeConge findById(DemandeCongeId id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return (DemandeConge) session.get(DemandeConge.class, id);
        } finally {
            session.close();
        }
    }
    public List<DemandeConge> findByEmployeId(int employeId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM DemandeConge dc WHERE dc.employeId = :employeId";
            Query query = session.createQuery(hql);
            query.setParameter("employeId", employeId);
            return query.list();
        } finally {
            session.close();
        }
    }
    
    public List findAllWithEmploye() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "SELECT dc FROM DemandeConge dc JOIN FETCH dc.employe";
            Query query = session.createQuery(hql);
            return query.list();
        } finally {
            session.close();
        }
    }
    
    public boolean create(DemandeConge demande) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(demande);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }
    
    public boolean update(DemandeConge demande) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(demande);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }
    
    public boolean delete(DemandeConge demande) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.delete(demande);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }
    
    public boolean accepterDemande(DemandeCongeId id) {
        return changerStatutDemande(id, "APPROUVE");
    }
    
    public boolean refuserDemande(DemandeCongeId id) {
        return changerStatutDemande(id, "REJETE");
    }
    
    private boolean changerStatutDemande(DemandeCongeId id, String nouveauStatut) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            DemandeConge demande = (DemandeConge) session.get(DemandeConge.class, id);
            if (demande != null) {
                demande.setStatut(nouveauStatut);
                session.update(demande);
            }
            transaction.commit();
            return demande != null;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }
public List<Object[]> getNombreCongesParDepartementSansClasse() {
    Session session = HibernateUtil.getSessionFactory().openSession();
    try {
        String hql =
            "SELECT e.departement.nom, COUNT(dc) " +
            "FROM DemandeConge dc " +
            " JOIN dc.employe e " +
            "GROUP BY e.departement.nom";
        Query query = session.createQuery(hql);
        return query.list();
    } finally {
        session.close();
    }
}
public List<DemandeConge> getDemandesParEmployeSansClasse(int employeId) {
    Session session = HibernateUtil.getSessionFactory().openSession();
    try {
        String hql = "FROM DemandeConge dc WHERE dc.employe.id = :employeId ORDER BY dc.dateDebut DESC";
        Query query = session.createQuery(hql);
        query.setParameter("employeId", employeId);
        return query.list();
    } finally {
        session.close();
    }
}



}
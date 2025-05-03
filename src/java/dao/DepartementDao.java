package dao;

import entites.Departement;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import org.hibernate.Query;

public class DepartementDao {

    public void create(Departement departement) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.save(departement);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace(); // Gérez l'exception correctement (log)
        } finally {
            if (session != null) {
                try {
                    session.close();
                } catch (HibernateException e) {
                    e.printStackTrace(); // Gérez l'erreur de fermeture de session
                }
            }
        }
    }

    public Departement findById(int id) {
        Session session = null;
        Departement departement = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            departement = (Departement) session.get(Departement.class, id);
        } catch (HibernateException e) {
            e.printStackTrace(); // Gérez l'exception correctement (log)
        } finally {
            if (session != null) {
                try {
                    session.close();
                } catch (HibernateException e) {
                    e.printStackTrace(); // Gérez l'erreur de fermeture de session
                }
            }
        }
        return departement;
    }

    public List<Departement> findAll() {
        Session session = null;
        List<Departement> departements = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Query query = session.createQuery("from Departement");
            departements = query.list();
        } catch (HibernateException e) {
            e.printStackTrace(); // Gérez l'exception correctement (log)
        } finally {
            if (session != null) {
                try {
                    session.close();
                } catch (HibernateException e) {
                    e.printStackTrace(); // Gérez l'erreur de fermeture de session
                }
            }
        }
        return departements;
    }

    public void update(Departement departement) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(departement);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace(); // Gérez l'exception correctement (log)
        } finally {
            if (session != null) {
                try {
                    session.close();
                } catch (HibernateException e) {
                    e.printStackTrace(); // Gérez l'erreur de fermeture de session
                }
            }
        }
    }

    public void delete(Departement departement) {
        Session session = null;
        Transaction tx = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.delete(departement);
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace(); // Gérez l'exception correctement (log)
        } finally {
            if (session != null) {
                try {
                    session.close();
                } catch (HibernateException e) {
                    e.printStackTrace(); // Gérez l'erreur de fermeture de session
                }
            }
        }
    }
}
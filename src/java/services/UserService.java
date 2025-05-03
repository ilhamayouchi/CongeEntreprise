/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.UserDao;
import entites.User;
import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author hp
 */
public class UserService implements Iservice <User> {
   
    
    private final UserDao ud;
    
    public UserService(){
        this.ud = new UserDao();
    }

    public boolean create(User o) {
        return ud.create(o);
    }

   
    public boolean update(User o) {
        return ud.update(o);
    }

    
    public boolean delete(User o) {
        return ud.delete(o);
    }

    
    public List<User> findAll() {
        return ud.findAll();
    }

    
    public User findById(int id) {
        return ud.findById(id);
    }
    
  public User findByEmail(String email) {
    Session session = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();
        System.out.println("Recherche de l'email : " + email); // 🔍
        User u = (User) session.createQuery("FROM User WHERE email = :email")
                               .setParameter("email", email.trim())
                               .uniqueResult();
        if (u == null) {
            System.out.println("Aucun utilisateur trouvé !");
        } else {
            System.out.println("Utilisateur trouvé : " + u.getNom());
        }
        return u;
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    } finally {
        if (session != null) {
            session.close();
        }
    }
}

    
}
    


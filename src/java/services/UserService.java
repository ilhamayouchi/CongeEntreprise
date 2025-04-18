/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.UserDao;
import entites.User;
import java.util.List;

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
    
    public List<User> findByEmail(String email) {
        return ud.findByEmail(email);
    }
    
}
    


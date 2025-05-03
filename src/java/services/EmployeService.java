package services;

import dao.EmployeDao;
import entites.Employe;
import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;

public class EmployeService implements Iservice<Employe> {

    private final EmployeDao ed;

    public EmployeService() {
        this.ed = new EmployeDao();
    }

    public EmployeService(EmployeDao ed) {
        this.ed = ed;
    }

    public boolean create(Employe e) {
        return ed.create(e);
    }

    public boolean delete(Employe e) {
        return ed.delete(e);
    }

    public boolean update(Employe e) {
        return ed.update(e);
    }

    public List<Employe> findAll() {
        return ed.getEmployes();
    }
    public Employe findById(int id) {
        return ed.findById(id);
    }
    public Employe findClientByEmail(String email) {
       return ed.findClientByEmail(email);
    }

    public Employe trouverEmployeParId(int employeId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    

}

    





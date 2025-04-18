package services;

import dao.EmployeDao;
import entites.Employe;
import java.util.List;

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
        return ed.findAll();
    }
    public Employe findById(int id) {
        return ed.findById(id);
    }
}


package services;

import dao.DepartementDao;
import entites.Departement;
import java.util.List;

public class DepartementService {

    private final DepartementDao departementDao = new DepartementDao();

    public void create(Departement departement) {
        departementDao.create(departement);
    }

    public void update(Departement departement) {
        departementDao.update(departement);
    }

    public void delete(Departement departement) {
        departementDao.delete(departement);
    }

    public Departement findById(int id) {
        return departementDao.findById(id);
    }

    public List<Departement> findAll() {
        return departementDao.findAll();
    }
}


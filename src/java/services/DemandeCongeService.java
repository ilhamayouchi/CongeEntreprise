package services;

import dao.DemandeCongeDao;
import entites.DemandeConge;
import entites.DemandeCongeId;
import java.util.List;

public class DemandeCongeService {
    private final DemandeCongeDao demandeCongeDao = new DemandeCongeDao();

    public boolean creerDemande(DemandeConge demande) {
        return demandeCongeDao.create(demande);
    }

    public boolean modifierDemande(DemandeConge demande) {
        return demandeCongeDao.update(demande);
    }

    public boolean supprimerDemande(DemandeConge demande) {
        return demandeCongeDao.delete(demande);
    }

    public List<DemandeConge> listerToutesDemandes() {
        return demandeCongeDao.findAllWithEmploye();
    }

    public DemandeConge trouverDemandeParId(DemandeCongeId id) {
        return demandeCongeDao.findById(id);
    }

    public boolean accepterDemande(DemandeCongeId id) {
        return demandeCongeDao.accepterDemande(id);
    }

    public boolean refuserDemande(DemandeCongeId id) {
        return demandeCongeDao.refuserDemande(id);
    }
    public List<Object[]> getNombreCongesParDepartement() {
        return demandeCongeDao.getNombreCongesParDepartementSansClasse();
    }
     public List<DemandeConge> getDemandesParEmployeSansClasse(int employeId) {
        return demandeCongeDao.getDemandesParEmployeSansClasse(employeId);
    }

    public void delete(DemandeConge demande) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public DemandeConge findById(DemandeCongeId id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void create(DemandeConge nouvelleDemande) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void update(DemandeConge demande) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

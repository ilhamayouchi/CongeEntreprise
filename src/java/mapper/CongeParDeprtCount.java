/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

/**
 *
 * @author hp
 */
public class CongeParDeprtCount {
    private String nomDepartement;
    private long congeCount;

    public CongeParDeprtCount(String nomDepartement, long congeCount) {
        this.nomDepartement = nomDepartement;
        this.congeCount = congeCount;
    }

    public String getNomDepartement() {
        return nomDepartement;
    }

    public long getCongeCount() {
        return congeCount;
    }
    
}

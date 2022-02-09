/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Database.DB;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Asus
 */
public class Manufacturer implements IModel {
    private String name;
    private String address;
    
    public static Manufacturer find(String name) {
        try {
            ResultSet res = DB.getConnect().where("manufacturertbl", "name", name);
            res.first();
            
            return new Manufacturer(res);
        }
        catch (Exception e) {
            return null;
        }
    }

    private Manufacturer(ResultSet res) throws SQLException {
        this.name = res.getString("name");
        this.address = res.getString("address");
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    
    
    @Override
    public boolean save() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

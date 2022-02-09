/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Database.DB;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author Asus
 */
public class Supplier extends Authenticatable implements IModel {
    private String email;
    private Manufacturer manufacturer;
    
    public static Supplier find(String email) {
        try {
            ResultSet res = DB.getConnect().where("suppliertbl", "email", email);
            res.first();
            
            return new Supplier(res);
        }
        catch (Exception e) {
            return null;
        }
    }

    private Supplier(ResultSet res) throws SQLException {
        this.email = res.getString("email");
        this.password = res.getString("password");
        this.manufacturer = Manufacturer.find(res.getString("manufacturer"));
    }

    public String getEmail() {
        return email;
    }

    public Manufacturer getManufacturer() {
        return manufacturer;
    }
    

    @Override
    public boolean save() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getName() {
        return this.manufacturer.getName();
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Database.DB;
import java.lang.Math;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Base64;
import java.util.HashMap;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author Asus
 */
public class User implements IModel {
    private String email;
    private String password;
    private String name;
    private String address;
    
    private boolean dirty;

    public User(ResultSet rs) throws SQLException {
        this.email = rs.getString("email");
        this.password = rs.getString("password");
        this.name = rs.getString("name");
        this.address = rs.getString("address");
        
        this.dirty = false;
    }

    public User(String email, String password, String name, String address) throws InvalidKeySpecException, NoSuchAlgorithmException {
        this.email = email;
        this.setPassword(password);
        this.name = name;
        this.address = address;
        
        this.dirty = true;
    }
    
    
    public static User find(String email) {
        try {
            ResultSet res = DB.getConnect().where("usertbl", "email", email);
            res.first();
            
            return new User(res);
        }
        catch (Exception e) {
            return null;
        }
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) throws InvalidKeySpecException, NoSuchAlgorithmException {
        KeySpec spec = new PBEKeySpec(password.toCharArray(), new byte[]{0}, 65536, 128);
        SecretKeyFactory f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        byte[] hash = f.generateSecret(spec).getEncoded();
        Base64.Encoder enc = Base64.getEncoder();
        
        this.password = enc.encodeToString(hash);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public boolean comparePassword(String password) throws NoSuchAlgorithmException, InvalidKeySpecException {
        KeySpec spec = new PBEKeySpec(password.toCharArray(), new byte[]{0}, 65536, 128);
        SecretKeyFactory f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
        byte[] hash = f.generateSecret(spec).getEncoded();
        Base64.Encoder enc = Base64.getEncoder();
        
        String passhash = enc.encodeToString(hash);
        return passhash.equals(this.password);
    }
    
    @Override
    public boolean save() throws SQLException {
        DB db = DB.getConnect();
        if (dirty) {
            db.insert("usertbl", new int[]{Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR}, this.email, this.password, this.name, this.address);
        }
        else {
            HashMap<String, Object> pkey = new HashMap();
            pkey.put("email", this.email);
            db.update("usertbl", pkey, new String[]{"email", "password", "name", "address"}, new int[]{Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR},
                    this.email, this.password, this.name, this.address);
        }
        
        return true;
    }

    @Override
    public boolean delete() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

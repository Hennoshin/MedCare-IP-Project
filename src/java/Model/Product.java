/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Database.DB;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Asus
 */
public class Product implements IModel {
    
    private String id;
    private String productName;
    private String description;
    private float price;
    private String manufacturer;
    private String imageUrl;

    public static ResultSet all() throws SQLException, ClassNotFoundException {
        return DB.getConnect().select("producttbl");
    }
    
    public static Product find(String id) {
        try {
            ResultSet res = DB.getConnect().where("producttbl", "id", id);
            res.first();
            
            return new Product(res);
        }
        catch (Exception e) {
            return null;
        }
    }
    
    public Product() {
    }

    public Product(ResultSet rs) throws SQLException {
        this.id = rs.getString("id");
        this.productName = rs.getString("prodname");
        this.description = rs.getString("description");
        this.price = rs.getFloat("price");
        this.manufacturer = rs.getString("manufacturer");
        this.imageUrl = rs.getString("imageURL");
    }
    
    public Product(String id, String productName, String description, float price, String manufacturer, String imageUrl) {
        this.id = id;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.manufacturer = manufacturer;
        this.imageUrl = imageUrl;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    
    
    @Override
    public boolean save() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

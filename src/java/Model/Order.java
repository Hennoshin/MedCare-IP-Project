/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Database.DB;
import java.sql.Types;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Asus
 */
public class Order implements IModel {
    private String id;
    private String userId;
    private Date orderDate;
    private String address;
    private boolean dirty;

    public Order(ResultSet rs) throws SQLException {
        this.id = rs.getString("orderId");
        this.userId = rs.getString("userId");
        this.orderDate = rs.getDate("orderDate");
        this.address = rs.getString("address");
        
        this.dirty = false;
    }
    
    public Order() throws SQLException {
        DB db = DB.getConnect();
        ResultSet res = db.select("order_history");
        res.first();
        
        String sindex = res.getString("orderId");
        while (res.next()) {
            String cur = res.getString("orderId");
            if (sindex.compareTo(cur) < 0) {
                sindex = cur;
            }
        }
        
        sindex = sindex.substring(3);
        int num = Integer.parseInt(sindex);
        num++;
        sindex = String.valueOf(num);
        int len = sindex.length();
        for (int i = 9; i > len; i--) {
            sindex = "0" + sindex;
        }
        sindex = "ORD" + sindex;
        
        this.id = sindex;
        
        this.userId = "";
        this.address = "";
        
        this.dirty = true;
    }

    public Map<Product, Integer> getOrderedProduct() throws SQLException {
        Map<Product, Integer> map = new HashMap();
        
        DB db = DB.getConnect();
        ResultSet res = db.where("ordered_item", "orderId", this.id);
        
        while (res.next()) {
            int quantity = res.getInt("quantity");
            ResultSet r = db.where("producttbl", "id", res.getString("itemId"));
            r.first();
            Product p = new Product(r);
  
            map.put(p, quantity);
        }
        
        return map;
    }
    
    public void attachOrderedProduct(String id, int quantity) throws SQLException {
        DB db = DB.getConnect();
        
        ResultSet res = db.where("producttbl", "id", id);
        if (res.first()) {
            db.insert("ordered_item", new int[]{Types.VARCHAR, Types.VARCHAR, Types.INTEGER}, this.id, res.getString("id"), quantity);
        }
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(User user) {
        this.userId = user.getEmail();
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    @Override
    public boolean save() throws SQLException {
        DB db = DB.getConnect();
        
        if (this.dirty) {
            db.insert("order_history", new int[]{Types.VARCHAR, Types.VARCHAR, Types.DATE, Types.VARCHAR}, this.id, this.userId, this.orderDate, this.address);
            this.dirty = false;
        }
        else {
            Map<String, Object> pkey = new HashMap();
            pkey.put("id", this.id);
            db.update("order_history", pkey, new String[]{"orderId", "userId", "orderDate", "address"}, new int[]{Types.VARCHAR, Types.VARCHAR, Types.DATE, Types.VARCHAR}, this.id, this.userId, this.orderDate, this.address);
        }

        return true;
    }

    @Override
    public boolean delete() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

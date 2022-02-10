/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Database.DB;
import java.util.List;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.io.*;


/**
 *
 * @author A S U S
 */
public class ViewProduction {
    
    public static List<Product> getAllProducts(){
        List<Product> productList = new ArrayList<Product>();
		try
		{
			DB db = DB.getConnect();
			Statement st= db.createStatement();
			ResultSet rs= st.executeQuery("SELECT * FROM producttbl");
			while(rs.next())
			{
				Product product = new Product(rs.getString("id"),rs.getString("prodname"),rs.getString("description"),  rs.getFloat("price"), rs.getString("manufacturer"), rs.getString("imageUrl"));
				productList.add(product);
                                
			}
			
			closeConnection(db);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

                
		
		return productList;
    }
    
    public static Product getProductById(String id)
	{
		Product product = null;
		try
		{
			DB db = DB.getConnect();
			PreparedStatement ps= db.prepareStatement("SELECT * FROM producttbl WHERE id = ?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
                             product = new Product(rs.getString("id"),rs.getString("prodname"),rs.getString("description"),  rs.getFloat("price"), rs.getString("manufacturer"), rs.getString("imageUrl"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return product;
	}
    
    public static int addProduct(Product product)
	{
		int status = 0;
		try
		{
			DB db = DB.getConnect();
			PreparedStatement ps= db.prepareStatement("INSERT INTO producttbl VALUES(id,?,?,?,?,?)");
			//ps.setString(1, product.getId());
			ps.setString(2, product.getProductName());
			ps.setString(3, product.getDescription());
			ps.setFloat(4, product.getPrice());
                        ps.setString(5, product.getManufacturer());
                        ps.setString(6, product.getImageUrl());
			status = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
    
    public static int updateProduct(Product product)
	{
		int status = 0;
		try
		{
			DB db = DB.getConnect();
			PreparedStatement ps= db.prepareStatement("UPDATE producttbl SET prodname=?, description=?, price=?, manufacturer=?, imageUrl=? WHERE id=?");
			ps.setString(2, product.getProductName());
			ps.setString(3, product.getDescription());
			ps.setFloat(4, product.getPrice());
                        ps.setString(5, product.getManufacturer());
                        ps.setString(6, product.getImageUrl());
			status = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
    public static int deleteProduct(String id)
	{
		int status = 0;
		try
		{
			DB db = DB.getConnect();
			PreparedStatement ps= db.prepareStatement("DELETE FROM producttbl where id = ?");
			ps.setString(1, id);
			status = ps.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
}

    private static void closeConnection(DB db) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}

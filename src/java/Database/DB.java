/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.*;
import java.util.Objects;

/**
 *
 * @author Asus
 */
public class DB {
    private static DB db;
    private final Connection connect;
    
    
    private DB(String url, String port, String dbname, String user, String pass) throws SQLException {
        this.connect = DriverManager.getConnection("jdbc:mysql://" + url + ":" + port + "/" + dbname, user, pass);
    }
    
    public static DB getConnect() throws SQLException, ClassNotFoundException {
        if (Objects.isNull(db)) {
            Class.forName("com.mysql.jdbc.Driver");
            db = new DB("localhost", "3306", "myproject", "root", "");
        }
        
        return db;
    }
}

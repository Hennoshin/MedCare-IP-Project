/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import java.sql.*;
import java.util.Objects;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public static DB getConnect() throws SQLException {
        if (Objects.isNull(db)) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
            }
            db = new DB("localhost", "3306", "projectdb", "root", "");
        }
        
        return db;
    }
    
    /**
     * Execute a raw SQL statement. Can only be used to execute a query that returns ResultSet.
     * Use executeUpdate instead to execute raw SQL statement that does not
     * return any result.
     * This function is equivalent to PreparedStatement.executeQuery()
     * @param sql SQL query statement
     * @return
     * @throws SQLException 
     */
    public ResultSet executeQuery(String sql) throws SQLException {
        return this.connect.prepareStatement(sql).executeQuery();
    }
    /**
     * Execute a raw SQL statement. Can only be used to execute a DML query
     * Use executeQuery instead to execute raw SQL statement that
     * returns result.
     * This function is equivalent to PreparedStatement.executeUpdate()
     * @param sql SQL DML statement
     * @return
     * @throws SQLException 
     */
    public int executeUpdate(String sql) throws SQLException {
        return this.connect.prepareStatement(sql).executeUpdate();
    }
    
    public ResultSet select(String tbl) throws SQLException {
        return this.connect.prepareStatement("SELECT * FROM " + tbl).executeQuery();
    }
    
    /**
     * Insert a new row into a certain table.
     * This function only allows the insertion to all of the columns.
     * The order of the columns is based on the sequence of the columns.
     * @param tbl Name of the table
     * @param types Array of integer determining the data types for the columns,
     * this value is based on the java.sql.Types values
     * @param args The values of the columns
     * @throws SQLException 
     */
    public void insert(String tbl, int[] types, Object ... args) throws SQLException {
        String s = "";
        for (int i = 0; i < types.length; i++) {
            s += "?";
            if (i < types.length - 1) {
                s += ", ";
            }
            else {
                s += ")";
            }
        }
        
        PreparedStatement stmt = this.connect.prepareStatement("INSERT INTO " + tbl + " VALUES (" + s);
        
        int counter = 1;
        for (Object o : args) {
            stmt.setObject(counter, o, types[counter - 1]);
            counter++;
        }
        
        stmt.executeUpdate();
    }
    /**
     * Update row(s) in a table in the database.
     * Operator WHERE is used and chained with AND to determine which row(s) to
     * be update.
     * @param tbl Name of the table
     * @param pkeys Key-value pairs for the WHERE operator, chained with AND operator
     * @param cols Name of the columns to be updated
     * @param types Types of the columns to be updated. Type is based on java.sql.Types
     * @param args The new value of the columns to be updated
     * @throws SQLException 
     */
    public void update(String tbl, Map<String, Object> pkeys, String[] cols, int[] types, Object ... args) throws SQLException {
        String s = "";
        for (int i = 0; i < cols.length; i++) {
            s += cols[i] + " = ?";
            if (i < types.length - 1) {
                s += ", ";
            }
        }
        
        String keys = "";
        int keycount = 0;
        for (Map.Entry<String, Object> pkey : pkeys.entrySet()) {
            keys += pkey.getKey() + " = \"" + pkey.getValue().toString() + "\"";
            if (keycount < pkeys.size() - 1) {
                keys += " AND ";
            }
            keycount++;
        }
        
        PreparedStatement stmt = this.connect.prepareStatement("UPDATE " + tbl + " SET " + s + " WHERE " + keys);
        
        int counter = 1;
        for (Object o : args) {
            stmt.setObject(counter, o, types[counter - 1]);
            counter++;
        }
        
        stmt.executeUpdate();
    }
    /**
     * Delete row(s) from a table in the database.
     * Operator WHERE is used and chained with AND to determine which row(s) to
     * be deleted.
     * @param tbl Name of the table
     * @param pkeys Key-value pairs for the WHERE operator, chained with AND operator
     * @throws SQLException 
     */
    public void delete(String tbl, Map<String, Object> pkeys) throws SQLException {
        String s = "";
        int counter = 0;
        for (Map.Entry<String, Object> pkey : pkeys.entrySet()) {
            s += pkey.getKey() + " = \"" + pkey.getValue() + "\"";
            if (counter < pkeys.size() - 1) {
                s += " AND ";
            }
            counter++;
        }
        
        PreparedStatement stmt = this.connect.prepareStatement("DELETE FROM " + tbl + " WHERE " + s);
        
        stmt.executeUpdate();
    }
    /**
     * Executes an SQL query with WHERE operator.
     * @param tbl Name of the table
     * @param pkey The column name to be used in the WHERE operator
     * @param val The column value
     * @return
     * @throws SQLException 
     */
    public ResultSet where(String tbl, String pkey, Object val) throws SQLException {
        PreparedStatement stmt = this.connect.prepareStatement("SELECT * FROM " + tbl + " WHERE " + pkey + " = \"" + val + "\"");
        return stmt.executeQuery();
    }
    /**
     * Executes an SQL query with WHERE operator and chained with AND operator.
     * @param tbl Name of the table
     * @param keys Key-value pairs for the WHERE operator, chained with AND operator
     * @return
     * @throws SQLException 
     */
    public ResultSet where(String tbl, Map<String, Object> keys) throws SQLException {
        String s = "";
        int counter = 0;
        for (Map.Entry<String, Object> pkey : keys.entrySet()) {
            s += pkey.getKey() + " = \"" + pkey.getValue() + "\"";
            if (counter < keys.size() - 1) {
                s += " AND ";
            }
            counter++;
        }
        
        PreparedStatement stmt = this.connect.prepareStatement("SELECT * FROM " + tbl + " WHERE " + s);
        
        return stmt.executeQuery();
    }
}

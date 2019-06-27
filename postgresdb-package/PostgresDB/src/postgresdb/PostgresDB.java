/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package postgresdb;

import java.sql.*;

/**
 *
 * @author ujjwal_raizada (https:github.com/ujjwalrox)
 */
public class PostgresDB {

    /**
     * @param args the command line arguments
     */
    
    static String db_url = "localhost";
    static String db_port = "5432";
    static String db_name = "R6Database";
    static String db_username = "postgres";
    static String db_password = "postgres";
    
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
    public static String databaseURL() {
    
        String URL = String.format("jdbc:postgres://%s:%s/%s", db_url, db_port, db_name);
        return URL;  
    }
    
    public static Connection DatabaseConnect() {
        
        String URL = databaseURL();
        Connection conn = null;
        
        try {
            conn = DriverManager.getConnection(URL, db_username, db_password);
            System.out.println("Connected to the PostgreSQL server successfully.");
        }
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
 
        return conn;
    }
    
    public static long insertData(PreparedStatement pstmt) {
    
        long id = -1;
        
        try {
        
            int affectedRows = pstmt.executeUpdate();
            
            // check the affected rows 
            if (affectedRows > 0) {
                // get the ID back
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        id = rs.getLong(1);
                    }
                } catch (SQLException ex) {
                    System.out.println(ex.getMessage());
                }
            }
            
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        return id;
    }
    
    public static ResultSet retrieveData(PreparedStatement pstmt) {
    
        ResultSet rs = null;
        
        try {
            
            rs = pstmt.executeQuery();
        } catch(SQLException ex) {
            
            System.out.println(ex.getMessage());
        }
        
        return rs;
    }
    
    public static void InitializeDatabase() {
        
        Connection conn = DatabaseConnect();
        String SQL = "CREATE TABLE DEMO (" +
                "Name varchar(30)," +
                "ID varchar(30) PRIMARY KEY" +
                ");";
        
        try {
        
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            insertData(pstmt);
            
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
    }
    
    public static void closeConnection(Connection conn) {
    
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
 }


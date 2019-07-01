package postgresdb;

import java.util.HashMap; 
import java.util.Map; 

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
         InitializeDatabase();
        testInsertRecord();
        
        
    }

    
    public static void testInsertRecord() {
    
        HashMap<String, String> record = new HashMap<>();
        record.put("district", "d");
        record.put("tehsil", "t");
        record.put("village", "v");
        record.put("share_added", "sa");
        record.put("share_removed", "sr");
        record.put("mall_guzari", "mg");
        record.put("order_number", "on");
        record.put("date", "date");
        record.put("remark", "remark");
        
        insertRecord(record);
    
    }
    
    public static String databaseURL() {
    
        String URL = String.format("jdbc:postgresql://%s:%s/%s", db_url, db_port, db_name);
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
        
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            id = rs.getInt(1);
  
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        return id;
    }
    
    public static void insertRecord(HashMap<String, String> recordMap) {
    
        /*
        
        District
        Tehesil
        Village
        
        Share_Added
        Share_Removed
        Mall_Guzari
        order_number
        date
        Remark
        
        */
        
        String district = recordMap.get("district");
        String tehsil = recordMap.get("tehsil");
        String village = recordMap.get("village");
        String share_added = recordMap.get("share_added");
        String share_removed = recordMap.get("share_removed");
        String mall_guzari = recordMap.get("mall_guzari");
        String order_number = recordMap.get("order_number");
        String date = recordMap.get("date");
        String remark = recordMap.get("remark");
        
        Connection conn = DatabaseConnect();
        String SQL = "INSERT INTO register6 (district, tehsil, village, share_added, share_removed, mall_guzari, order_number, date, remark)" +
                "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING sno;";
        
        try {
        
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            
            pstmt.setString(1, district);
            pstmt.setString(2, tehsil);
            pstmt.setString(3, village);
            pstmt.setString(4, share_added);
            pstmt.setString(5, share_removed);
            pstmt.setString(6, mall_guzari);
            pstmt.setString(7, order_number);
            pstmt.setString(8, date);
            pstmt.setString(9, remark);
            
            System.out.println(insertData(pstmt));
            
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        
        
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
    
    public static HashMap<String, String> retrieveRecord(int serial_number) {
    
        HashMap<String, String> record = new HashMap<>();
        String SQL = "SELECT * FROM Register6 where sno = (?);";
        
        Connection conn = DatabaseConnect();
        
        try {
        
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            
            pstmt.setInt(1, serial_number);
            ResultSet rs = retrieveData(pstmt);
            
            rs.next();
            int sno = rs.getInt(1);
            String district = rs.getString(2);
            String tehsil = rs.getString(3);
            String village = rs.getString(4);
            String share_added = rs.getString(5);
            String share_removed = rs.getString(6);
            String mall_guzari = rs.getString(7);
            String order_number = rs.getString(8);
            String date = rs.getString(9);
            String remark = rs.getString(10);
            
            record.put("sno", Integer.toString(sno));
            record.put("district", district);
            record.put("tehsil", tehsil);
            record.put("village", village);
            record.put("share_added", share_added);
            record.put("share_removed", share_removed);
            record.put("mall_guzari", mall_guzari);
            record.put("order_number", order_number);
            record.put("date", date);
            record.put("remark", remark);
            
        }
        catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        
        return record;
    }
    
    public static void InitializeDatabase() {
        
        /*
        
        District
        Tehesil
        Village
        
        Share_Added
        Share_Removed
        Mall_Guzari
        order_number
        date
        Remark
        
        */
        
        
        Connection conn = DatabaseConnect();
        String SQL = "CREATE TABLE register6 (" +
                "sno SERIAL," +
                "District varchar(100)," +
                "Tehsil varchar(100)," +
                "Village varchar(100)," +
                "share_Added varchar(100)," +
                "share_removed varchar(100)," +
                "mall_guzari varchar(100)," +
                "order_number varchar(100)," +
                "date varchar(100)," +
                "remark varchar(100)" +
                ");";
        
        try {
        
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            System.out.println(insertData(pstmt));
            
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


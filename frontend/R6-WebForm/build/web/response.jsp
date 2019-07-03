<%@ page import="postgresdb.PostgresDB" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>

<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%!

public class PostgresDB {

    /**
     * @param args the command line arguments
     */
    
    

    
   
    
    public  void testInsertRecord() {
    
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
    
    public  String databaseURL() {

    String db_url = "localhost";
        String db_port = "5432";
        String db_name = "R6Database";
        String db_username = "postgres";
        String db_password = "postgres";
    
        String URL = String.format("jdbc:postgresql://%s:%s/%s", db_url, db_port, db_name);
        return URL;  
    }
    
    public  Connection DatabaseConnect() {
        

        String db_url = "localhost";
        String db_port = "5432";
        String db_name = "R6Database";
        String db_username = "postgres";
        String db_password = "postgres";
        String URL = databaseURL();
        Connection conn = null;
        
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(URL, db_username, db_password);
            System.out.println("Connected to the PostgreSQL server successfully.");
        }
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
 
        return conn;
    }
    
    public  long insertData(PreparedStatement pstmt) {
    
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
    
    public  void insertRecord(HashMap<String, String> recordMap) {
    
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
    
    public  ResultSet retrieveData(PreparedStatement pstmt) {
    
        ResultSet rs = null;
        
        try {
            
            rs = pstmt.executeQuery();
        } catch(SQLException ex) {
            
            System.out.println(ex.getMessage());
        }
        
        return rs;
    }
    
    public  HashMap<String, String> retrieveRecord(int serial_number) {
    
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
    
    public  void InitializeDatabase() {
        
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
    
    public  void closeConnection(Connection conn) {
    
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
 }


%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>  रजिस्टर ६ प्रिंट-पीडीऍफ़  </title>
    <link rel="icon" href="assets/bootstrap/css/icon.ico">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/css/pikaday.min.css">
    <link rel="stylesheet" href="assets/css/style-1.css">
  </head>

  <body>
    <nav class="navbar navbar-dark navbar-expand-lg
         fixed-top bg-white portfolio-navbar gradient"
         >
      <div class="container">
        <a class="navbar-brand logo" data-aos="fade" data-aos-delay="250" href="#">
          <img src="assets/img/BOR-Image.png">
          राजस्व परिषद, उत्तर प्रदेश
        </a>

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="nav navbar-nav ml-auto"></ul>
          </ul>
        </div>
      </div>
    </nav>

    <% HashMap<String, String> h = new HashMap();
      out.print(request.getParameter("District"));
      h.put("district", request.getParameter("District"));
      h.put("tehsil", request.getParameter("Tehsil"));
      h.put("village", request.getParameter("Village"));
      h.put("share_added", request.getParameter("DescShareAdded"));
      h.put("share_removed", request.getParameter("DescShareRemoved"));
      h.put("mall_guzari", request.getParameter("MallGuzari"));
      h.put("order_number", request.getParameter("OrderNumber"));
      h.put("data", request.getParameter("Data"));
      h.put("remark", request.getParameter("Remark"));
      out.print(h);
      PostgresDB postgres = new PostgresDB();
      postgres.testInsertRecord();
%>

    <main class="page hire-me-page">
      <section class="portfolio-block hire-me">
        <div class="container">
          <div id="print-pdf-heading" class="heading" >
            <h3>  धन्यवाद  </h3>
            <h6><strong>आपका जवाब जमा कर लिया गया है। </strong></h6>
          </div>

          <form style="width: 300px;">
            <input type="text" id="text-area-margin" class="form-control" style="height: 50px;"/>
            <button class="btn btn-primary btn-block btn-sm text-center" type="submit">
              <i class="fa fa-file-pdf-o"></i>&nbsp;
              प्रिंट-पीडीऍफ़
            </button>
          </form>
        </div>
      </section>
    </main>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-animation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/pikaday.min.js"></script>
    <script src="assets/js/theme.js"></script>
  </body>

</html>
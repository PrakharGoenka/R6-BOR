<%@ page import="java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%!
  public class PostgresDB {

    /**
     * @param args the command line arguments
     */
    String db_url = "localhost";
    String db_port = "5432";
    String db_name = "R6Database";
    String db_username = "postgres";
    String db_password = "sa@123";

    public void setDBUrlPort(String url, String port) {

      db_url = url;
      db_port = port;
    }

    public void setDBName(String name) {

      db_name = name;
    }

    public void setUsernamePassword(String username, String password) {

      db_username = username;
      db_password = password;
    }

    public String databaseURL() {

      String URL = String.format("jdbc:postgresql://%s:%s/%s", db_url, db_port, db_name);
      return URL;
    }

    public Connection DatabaseConnect() {

      String URL = databaseURL();
      Connection conn = null;

      try {
        Class.forName("org.postgresql.Driver");
      } catch (java.lang.ClassNotFoundException e) {
        System.err.print("ClassNotFoundException: ");
        System.err.println(e.getMessage());
      }

      try {
        conn = DriverManager.getConnection(URL, db_username, db_password);
        System.out.println("Connected to the PostgreSQL server successfully.");
      } catch (SQLException e) {
        System.out.println(e.getMessage());
      }

      return conn;
    }

    public long insertData(PreparedStatement pstmt) {

      long id = -1;

      try {

        ResultSet rs = pstmt.executeQuery();
        rs.next();
        id = rs.getInt(1);

      } catch (SQLException ex) {
        System.out.println(ex.getMessage());
      }

      return id;
    }

    public long insertRecord(HashMap<String, String> recordMap) {

      /*

        District
        Tehesil
        Village

        Share_Added
        Share_Removed
        Mall_Guzari
        AOLS
        order_number
        date
        Remark

       */
      String court_order = recordMap.get("court_order");
      String district = recordMap.get("district");
      String tehsil = recordMap.get("tehsil");
      String village = recordMap.get("village");
      String share_added = recordMap.get("share_added");
      String share_removed = recordMap.get("share_removed");
      String mall_guzari = recordMap.get("mall_guzari");
      String aols = recordMap.get("aols");
      String order_number = recordMap.get("order_number");
      String date = recordMap.get("date");
      String remark = recordMap.get("remark");

      Connection conn = DatabaseConnect();
      String SQL = "INSERT INTO register6 (court_order,district, tehsil, village, share_added, share_removed, mall_guzari, aols, order_number, date, remark)"
              + "VALUES(?,?, ?, ?, ?, ?, ?, ?, ?, ?,?) RETURNING sno;";
      long ind = -1;
      try {

        PreparedStatement pstmt = conn.prepareStatement(SQL);
        
        pstmt.setString(1, court_order);
        pstmt.setString(2, district);
        pstmt.setString(3, tehsil);
        pstmt.setString(4, village);
        pstmt.setString(5, share_added);
        pstmt.setString(6, share_removed);
        pstmt.setString(7, mall_guzari);
        pstmt.setString(8, order_number);
        pstmt.setString(9, aols);
        pstmt.setString(10, date);
        pstmt.setString(11, remark);

        ind = insertData(pstmt);

      } catch (SQLException ex) {
        System.out.println(ex.getMessage());
      } finally {

        return ind;
      }
    }

    public void InitializeDatabase() {

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
      String SQL = "CREATE TABLE register6 ("
              + "sno SERIAL,"
              + "court_order varchar(100),"
              + "District varchar(100),"
              + "Tehsil varchar(100),"
              + "Village varchar(100),"
              + "share_Added varchar(100),"
              + "share_removed varchar(100),"
              + "mall_guzari varchar(100),"
              + "aols varchar(100),"
              + "order_number varchar(100),"
              + "date varchar(100),"
              + "remark varchar(100)"
              + ");";

      try {

        PreparedStatement pstmt = conn.prepareStatement(SQL);
        System.out.println(insertData(pstmt));

      } catch (SQLException ex) {
        System.out.println(ex.getMessage());
      }

    }

    public void closeConnection(Connection conn) {

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

    <% long ind = -1;
        if(request.getParameter("District") != null){
        HashMap<String, String> h = new HashMap();
        out.print(request.getParameter("District"));
//        String m = request.getParameter("mode");
//        if(m == "1")
//            m = "वरासत";
//        else
//            m = "धारा ३४";
        h.put("court_order", request.getParameter("mode"));
        h.put("district", request.getParameter("District"));
        h.put("tehsil", request.getParameter("Tehsil"));
        h.put("village", request.getParameter("Village"));
        h.put("share_added", request.getParameter("DescShareAdded"));
        h.put("share_removed", request.getParameter("DescShareRemoved"));
        h.put("mall_guzari", request.getParameter("MallGuzari"));
        h.put("aols", request.getParameter("AOLS"));
        h.put("order_number", request.getParameter("OrderNumber"));
        h.put("date", request.getParameter("Date"));
        h.put("remark", request.getParameter("Remark"));
        out.print(h);
        PostgresDB postgres = new PostgresDB();
        ind = postgres.insertRecord(h);
    }
        
    %>

    <main class="page hire-me-page">
      <section class="portfolio-block hire-me">
        <div class="container">
          <% if(request.getParameter("District") != null){ %>
              <div id="print-pdf-heading" class="heading" >
                <h3>  धन्यवाद  </h3>
                <h6>
                  <strong>
                    आपका डेटा सुरक्षित कर लिया गया है। <br> <br>
                    आपका सीरियल नंबर है: <%= ind%>
                  </strong>
                 
                </h6>
              </div>
              <%} %>
          <form style="width: 300px;" action="result.jsp" method="POST">
            <strong>
      
            </strong>
            <input placeholder="अपना सीरियल नंबर यहाँ डालें" type="text" id="text-area-margin" class="form-control" style="height: 50px;" name="sno"/>
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
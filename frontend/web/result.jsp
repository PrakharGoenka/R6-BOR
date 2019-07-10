
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
    String db_password = "postgres";

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

    public ResultSet retrieveData(PreparedStatement pstmt) {

      ResultSet rs = null;

      try {

        rs = pstmt.executeQuery();
      } catch (SQLException ex) {

        System.out.println(ex.getMessage());
      }

      return rs;
    }

    public HashMap<String, String> retrieveRecord(int serial_number) {

      HashMap<String, String> record = new HashMap<>();
      String SQL = "SELECT * FROM Register6 where sno = (?);";

      Connection conn = DatabaseConnect();

      try {

        PreparedStatement pstmt = conn.prepareStatement(SQL);

        pstmt.setInt(1, serial_number);
        ResultSet rs = retrieveData(pstmt);

        rs.next();
        int sno = rs.getInt(1);
        String court_order = rs.getString(2);
        String district = rs.getString(3);
        String tehsil = rs.getString(4);
        String village = rs.getString(5);
        String share_added = rs.getString(6);
        String share_removed = rs.getString(7);
        String mall_guzari = rs.getString(8);
        String aols = rs.getString(9);
        String order_number = rs.getString(10);
        String date = rs.getString(11);
        String remark = rs.getString(12);

        record.put("sno", Integer.toString(sno));
        record.put("court_order", court_order);
        record.put("district", district);
        record.put("tehsil", tehsil);
        record.put("village", village);
        record.put("share_added", share_added);
        record.put("share_removed", share_removed);
        record.put("mall_guzari", mall_guzari);
        record.put("aols", aols);
        record.put("order_number", order_number);
        record.put("date", date);
        record.put("remark", remark);

      } catch (SQLException ex) {
        System.out.println(ex.getMessage());
      }

      return record;
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
    <title>राजस्व परिषद-प्रिंट पि.डी.एफ </title>
    <link rel="icon" href="assets_pdf/bootstrap/css/icon.ico">
    <link rel="stylesheet" href="assets_pdf/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets_pdf/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.css">
    <link rel="stylesheet" href="assets_pdf/css/style-table-pdf.css">
  </head>

  <body id="page-top">
    <%
      String sno = request.getParameter("sno");
      if (sno == null) {
    %>
    <jsp:forward page = "response.jsp" />
    <% }
      PostgresDB postgres = new PostgresDB();
      HashMap rs = postgres.retrieveRecord(Integer.parseInt(sno));
    %>

    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-primary portfolio-navbar gradient" id="nav-top">
      <div class="container-fluid">
        <a class="navbar-brand logo" data-aos="fade" data-aos-delay="250" href="#" style="font-size: 25px;">
          <img src="assets_pdf/img/BOR-Image.png">
          राजस्व परिषद, उत्तर प्रदेश
        </a>
      </div>
    </nav>

    <div id="wrapper">
      <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
          <div class="container-fluid text-center">
            <h3 class="text-dark mb-4" data-aos="fade" data-aos-delay="150">रजिस्टर ६-वेब फॉर्म </h3>
            <div class="card shadow">
              <div class="card-header py-3">
                <p class="text-primary m-0 font-weight-bold" data-aos="zoom-in" data-aos-delay="200">कोर्ट के आदेश से संबंधित जानकारी</p>
              </div>
              <% if (rs.get("sno") == null) {
                  out.print("कृपया सीरियल नंबर जांचे");
                } else {%>
              <div class="card-body" data-aos="flip-up" data-aos-delay="250">
                <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                  <table class="table dataTable my-0" id="dataTable">

                    <thead>
                      <tr>
                        <th>संख्या </th>
                        <th>हस्तांतरण की विधि</th>
                        <th>खाता संख्या </th>
                        <th>जोड़े गए हिस्से का विवरण</th>
                        <th>निकाले गए हिस्से  का विवरण</th>
                        <th>माल गुज़ारी</th>
                        <th>हस्तांतरण के हिस्से का क्षेत्र</th>
                        <th>आदेश संख्या एवं  दिनांक</th>
                        <th>टिप्पणी</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><%= rs.get("sno")%></td>
                        <td><%= rs.get("court_order")%></td>
                        <td>१२३४५६७८९१२३४५६७</td>
                        <td><%= rs.get("share_added")%>  </td>
                        <td> <%= rs.get("share_removed")%> </td>
                        <td><%= rs.get("mall_guzari")%></td>
                        <td><%= rs.get("aols")%></td>
                        <td><%= rs.get("order_number")%>----एवं--- <%= rs.get("date")%></td>
                        <td> <%= rs.get("remark")%></td>
                      </tr>
                    </tbody>
                    <tfoot>
                      <tr></tr>
                    </tfoot>
                  </table>
                </div>
              </div>
              <% }%>
            </div>
          </div>
        </div>
      </div>
    </div>


    <div class="text-center" style="margin: 30px;">
      <button onclick="window.print()" class="btn btn-primary text-center" id="print-button" type="button" style="width: 200px;height: 40px;color: rgb(13,0,0);background-color: rgb(78,223,119);"><i
          class="fa fa-file-pdf-o"></i>&nbsp;
        प्रिंट पि.डी.एफ</button>
    </div>



    <script src="assets_pdf/js/jquery.min.js"></script>
    <script src="assets_pdf/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets_pdf/js/bs-animation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.1.1/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets_pdf/js/theme.js"></script>
  </body>

</html>
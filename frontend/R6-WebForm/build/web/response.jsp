<%@ page import="postgresdb.PostgresDB" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.postgresql.Driver" %>

<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

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
      PostgresDB.InitializeDatabase();
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
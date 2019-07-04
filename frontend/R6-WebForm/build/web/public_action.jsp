<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="java.lang.*" %>
<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
  PrintWriter pw = response.getWriter();
  if (request.getParameter("act") != null) {
    String act = request.getParameter("act");
    pw.write("hello World");
    out.print("dasd");
    //if (act.equalsIgnoreCase("fetchDistricts")) {
    String url = "";
%>
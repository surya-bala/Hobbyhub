<%-- 
    Document   : event.jsp
    Created on : Feb 23, 2018, 10:25:02 AM
    Author     : suryabala
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
         Connection conn= null;    
        try{                      int status= 0;
                      String ename = request.getParameter("name");
                      String edesc= request.getParameter("desc");
                      String edate= request.getParameter("edate");
                      Random rand = new Random();
                      String eid = String.valueOf(rand.nextInt(100000));
                      Class.forName("org.apache.derby.jdbc.ClientDriver");
                      conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hobbyhub" , "hobbyhub","hobbyhub");
                      PreparedStatement ps = conn.prepareStatement("insert into events values(?,?,?,?)");
                      ps.setString(1, eid);
                      ps.setString(2, ename);
                      ps.setString(3, edesc);
                      ps.setString(4, edate);
                      status = ps.executeUpdate();
                      
        }catch(Exception e){
                      out.println(e);
                      out.println("Something went wrong !! please try again");     
        }
%>
    </body>
</html>

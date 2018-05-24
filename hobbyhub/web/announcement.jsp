<%-- 
    Document   : announcement
    Created on : Feb 23, 2018, 10:09:10 AM
    Author     : suryabala
--%>

<%@page import="java.util.Random"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
        <h1>Hello World!</h1>
<%
         Connection conn= null;
           
        try{
             
                      int status= 0;
                      String adesc= request.getParameter("announce");
                      String adate= (new java.util.Date()).toLocaleString();
                      Random rand = new Random();
                      String aid = String.valueOf(rand.nextInt(100000));
                      Class.forName("org.apache.derby.jdbc.ClientDriver");
                      conn = DriverManager.getConnection("jdbc:derby://localhost:1527/hobbyhub" , "hobbyhub","hobbyhub");
                      PreparedStatement ps = conn.prepareStatement("insert into announcements values(?,?,?)");
                      ps.setString(1, aid);
                      ps.setString(2, adesc);
                      ps.setString(3, adate);
                      status = ps.executeUpdate();
                       //Statement stmt = conn.createStatement();
                     out.println(adate);
                     out.println(aid);
                      
        }catch(Exception e){
                      out.println(e);
                      out.println("Something went wrong !! please try again");     
        }
%>

        
        
        
        
    </body>
</html>

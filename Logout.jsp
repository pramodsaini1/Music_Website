<%-- 
    Document   : Logout
    Created on : 11 Jul, 2022, 10:47:48 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
   Cookie c = new Cookie("Login","");
   c.setMaxAge(0);
   response.addCookie(c);
    response.sendRedirect("index.jsp");
   
    
%>
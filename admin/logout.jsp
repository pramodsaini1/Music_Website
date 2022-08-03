<%-- 
    Document   : logout
    Created on : 12 Jul, 2022, 10:45:12 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
Cookie c = new Cookie("login","");
c.setMaxAge(0);
response.addCookie(c);
response.sendRedirect("index.jsp");
    
    
    
%>
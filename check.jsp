<%-- 
    Document   : check
    Created on : 5 Jul, 2022, 10:54:13 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("email").length()==0||request.getParameter("pass").length()==0){
    response.sendRedirect("index.jsp?empty_login=1");
}    
else{
     String email=request.getParameter("email");
     String pass = request.getParameter("pass");
     try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
         Statement st  = cn.createStatement();
         ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
         if(rs.next()){
             if(rs.getString("password").equals(pass)){
                  Cookie c = new Cookie("Login",email);
                  c.setMaxAge(3600);
                  response.addCookie(c);
                  session.setAttribute(email,pass);
                  session.setMaxInactiveInterval(3600);
                  response.sendRedirect("index.jsp");

             }
             else{
                 response.sendRedirect("index.jsp?invalid_pass=1");
             }
         }
         else{
             response.sendRedirect("index.jsp?invalid_email=1");
         }
     }
     catch(Exception er){
         out.print(er.getMessage());
     }
}   
    
%>

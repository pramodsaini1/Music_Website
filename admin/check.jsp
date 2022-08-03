<%-- 
    Document   : check
    Created on : 6 May, 2022, 5:57:15 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("email").length()==0||request.getParameter("pass").length()==0){
    response.sendRedirect("index.jsp?empty=1");
}  
else{
    String email=request.getParameter("email");
    String pass = request.getParameter("pass");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from admin where email='"+email+"'");
        if(rs.next()){
            if(rs.getString("password").equals(pass)){
                Cookie c = new Cookie("login",email);
                c.setMaxAge(36000);
                response.addCookie(c);
                session.setAttribute(email, pass);
                session.setMaxInactiveInterval(3600);
                response.sendRedirect("dashboard.jsp");
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
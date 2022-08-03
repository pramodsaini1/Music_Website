<%-- 
    Document   : save_profile
    Created on : 16 Jul, 2022, 8:47:32 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[]=request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("Login")){
        email = c[i].getValue();
        break;
    }
}
if(email==null && session.getAttribute(email)==null){
    response.sendRedirect("index.jsp");
}
else{
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
        Statement  st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("user").length()==0||request.getParameter("country").length()==0){
                response.sendRedirect("user_edit_profile.jsp?empty=1");
            }
            else{
                String name =  request.getParameter("user");
                String country = request.getParameter("country");
                
                PreparedStatement ps = cn.prepareStatement("update user set name=?,country=? where email=?");
                ps.setString(1,name);
                ps.setString(2,country);
                ps.setString(3,email);
                
                if(ps.executeUpdate()>0){
                    response.sendRedirect("user_profile.jsp?profile_updated=1");
                }
                else{
                    response.sendRedirect("user_profile.jsp?again=1");
                }
            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
    
    
    
    
%>

<%-- 
    Document   : song_delete
    Created on : 28 Jun, 2022, 11:22:08 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[] = request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email=c[i].getValue();
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
        ResultSet rs = st.executeQuery("select * from admin where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code")!=null){
                String code = request.getParameter("code");
                int status=1;
                
                PreparedStatement ps = cn.prepareStatement("update song set status=? where code=? AND email=?");
                ps.setInt(1,status);
                ps.setString(2,code);
                ps.setString(3,email);
                
                if(ps.executeUpdate()>0){
                    out.print("success");
                }
            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
    
    
%>

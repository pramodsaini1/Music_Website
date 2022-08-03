<%-- 
    Document   : update_song
    Created on : 2 Jul, 2022, 9:55:03 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[] = request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email = c[i].getValue();
        break;
    }
}
if(email!=null && session.getAttribute(email)!=null){
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
        Statement  st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from admin where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code")!=null && request.getParameter("msg")!=null){
                String code  = request.getParameter("code");
                String msg = request.getParameter("msg");
                PreparedStatement ps = cn.prepareStatement("update song set song_name=? where code=? AND email=?");
                ps.setString(1,msg);
                ps.setString(2,code);
                ps.setString(3,email);
                
                if(ps.executeUpdate()>0){
                    out.print("success");
                }
                
            }
        }
    }
    catch(Exception er){}
}

%>
<%-- 
    Document   : update_album
    Created on : 27 Jun, 2022, 5:25:45 PM
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
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("Select * from admin where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code").length()==0){
                response.sendRedirect("dashboard.jsp?code_err=1");
            }
            else{
                String code = request.getParameter("code");
                if(request.getParameter("aname").length()==0 ||request.getParameter("des").length()==0){
                    response.sendRedirect("edit_album.jsp?code="+code+"&All_Field_Required=1");
                }
                else{
                    String aname = request.getParameter("aname");
                    String des   = request.getParameter("des");
                    int status=0;
                    PreparedStatement ps = cn.prepareStatement("update album set album_name=? ,description=? where code=? AND email=? AND status=?");
                    ps.setString(1,aname);
                    ps.setString(2,des);
                    ps.setString(3,code);
                    ps.setString(4,email);
                    ps.setInt(5,status);
                    
                    if(ps.executeUpdate()>0){
                        response.sendRedirect("edit_album.jsp?code="+code+"&album_updated=1");
                    }
                    else{
                        response.sendRedirect("edit_album.jsp?code="+code+"&try_again=1");
                    }
                }
            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
    
    
%>
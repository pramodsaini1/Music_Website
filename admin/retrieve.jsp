<%-- 
    Document   : retrieve
    Created on : 24 Jun, 2022, 12:40:19 PM
    Author     : Genius
--%>

<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
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
        ResultSet rs = st.executeQuery("select * from admin where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("txt")!=null){
                String btn = request.getParameter("txt");
                   Statement st1 = cn.createStatement();
                   ResultSet rs1 = st1.executeQuery("select * from album where album_name LIKE '"+btn+"%' AND status=0");
                   out.print("<table class='table table-borderless'>");
                   int flag = 0;
                   while (rs1.next()) {
                       flag = 1;
               %>
               <tr id="r-<%=rs1.getString("code")%>">
                   <td align="center"><img src="../album/<%=rs1.getString("code")%>.jpg" style="width:150px;height:150px;" class="img-fluid"></td>
                   <td><strong><%=rs1.getString("album_name")%></strong></td>
                   <td align="center"><button class='btn btn-warning'><a style="text-decoration: none;color:white;" href="edit_album.jsp?code=<%=rs1.getString("code")%>"><i class="fa fa-edit"></i> Edit</a></button></td>
                   <td align="center"><button class='btn btn-info' rel="<%=rs1.getString("code")%>"><i class="fa fa-trash"></i> Delete</button></td>

                   <td align="center"><button class='btn btn-success'><a style="text-decoration: none;color:white;" href="song.jsp?code=<%=rs1.getString("code")%>"style="color:white"><i class="fa fa-plus"></i>Add Song</button></td>

               </tr>
               <%
                   }

                   if (flag == 0) {
                       out.print("<tr><td><h3>Record Not Found</h3></td></tr>");
                   }
                   out.print("</table>");

            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
%>
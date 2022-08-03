<%-- 
    Document   : Load_more
    Created on : 6 Jul, 2022, 1:11:17 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
 <%
  if(request.getParameter("code")!=null && request.getParameter("num")!=null){
      String code = request.getParameter("code");
       
       try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
                 Statement st = cn.createStatement();
                  int id  = Integer.parseInt(request.getParameter("num"));
      
                 int start =id*4 ;
                    int flag=0;
                 ResultSet rs = st.executeQuery("select * from album where category_code='"+code+"' AND status=0 limit "+start+",4");
                 while(rs.next()){
                     flag++;
                     %>
                     <div class="col-sm-3">
                         <table class="table table-borderless w3-card">
                             <tr><td align=center><a href="play_song.jsp?code=<%=rs.getString("code")%>"><img src="album/<%=rs.getString("code")%>.jpg" class="img-responsive"></a></td></tr>
                             <tr><td><b><a href="play_song.jsp?code=<%=rs.getString("code")%>" style="text-decoration:none;"><%out.print(rs.getString("album_name"));%></a></b>   </td></tr>
                         </table>

                     </div>
                       
                     <%
                 }
                 if(flag==4){
                     %>
                     <div class="col-sm-12"><center><button class="w3-button w3-red" id="<%=(id+1)%>">Load More</button></center><br></div>

                     <%
                 }
                 
             }
             catch(Exception er){
                 out.print(er.getMessage());
             }
       
            
            
              




           
  }
 %>
 

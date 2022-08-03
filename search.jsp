<%-- 
    Document   : search
    Created on : 13 Jul, 2022, 11:26:15 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
  if(request.getParameter("txt")!=null){
      String txt = request.getParameter("txt");
      try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
          Statement st = cn.createStatement();
          String arr[] = txt.split(" ");
          String sql =  "select * from album where album_name like '%"+txt+"%' ";
          for(int i=0;i<arr.length;i++){
              sql = sql+" OR album_name like '%"+arr[i]+"%' AND status=0";
          }
          %>
          <div class="col-sm-12 w3-card-4"><h3><strong>Search Result</strong></h3></div>
          <%
           ResultSet rs = st.executeQuery(sql);
           while(rs.next()){
          
          %>
          <div class="col-sm-4">	
                                    <table class="table table-borderless w3-card">
                                      <tr >
                                        <td><a href="play_song.jsp?code=<%=rs.getString("code")%>"><img src="album/<%=rs.getString("code")%>.jpg" class="img-responsive"></a></td>
                                       </tr>
                                       <tr>
                                           <td><h5><strong><%=rs.getString("album_name")%></strong></h5></td> 
                                       </tr>
                                    </table>
                         </div>
          
          <%
           }
      }
      catch(Exception er){
          out.print(er.getMessage());
      }
  } 
%>
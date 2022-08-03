<%-- 
    Document   : add_song
    Created on : 25 Jun, 2022, 2:11:44 PM
    Author     : Genius
--%>

<%@page contentType="text/html"import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[] = request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email = c[i].getValue();
        break;
    }
}
if(email==null){
    response.sendRedirect("index.jsp");
}
else{
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
        Statement  st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from admin where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("code")==null && request.getParameter("cat_code")!=null){
                response.sendRedirect("dashboard.jsp?code_errt=1");
            }
            else{
                String album_code = request.getParameter("code");
                String cat_code = request.getParameter("cat_code");
                if(request.getParameter("song_name").length()==0||request.getParameter("description").length()==0){
                    response.sendRedirect("song.jsp?code="+album_code+"&empty=1");
                }
                else{
                    String song = request.getParameter("song_name");
                    String des  = request.getParameter("description");
                    
                    int sn=0;
                    int status=0;
                    String code="";
                     
                    Statement st1 = cn.createStatement();
                    ResultSet rs1 = st1.executeQuery("select MAX(sn) from song where album_code='"+album_code+"'");
                    if(rs1.next()){
                        sn = rs1.getInt(1);
                    }
                    sn = sn+1;
                    
                    
                    LinkedList l = new LinkedList();
                    for(char p='A';p<='Z';p++){
                        l.add(p+"");
                    }
                    for(char p='a';p<='z';p++){
                        l.add(p+"");
                    }
                    for(char p='0';p<='9';p++){
                        l.add(p+"");
                    }
                    Collections.shuffle(l);
                    for(int i=0;i<6;i++){
                        code = code+l.get(i);
                    }
                    code=code+"_"+sn;
                    
                    PreparedStatement ps = cn.prepareStatement("insert into song values(?,?,?,?,?,?,?)");
                    ps.setInt(1,sn);
                    ps.setString(2,code);
                    ps.setString(3,email);
                    ps.setString(4,song);
                    ps.setString(5,des);
                    ps.setString(6,album_code);
                    ps.setInt(7,status);
                    
                    if(ps.executeUpdate()>0){
                        response.sendRedirect("song_upload.jsp?code="+code+"&cat_code="+cat_code+"&album_code="+album_code+"&Song_added=1");
                    }
                    else{
                        response.sendRedirect("song.jsp?code="+code+"&cat_code="+cat_code+"&again=1");
                        
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

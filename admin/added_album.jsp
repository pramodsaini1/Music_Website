<%-- 
    Document   : added_album
    Created on : 23 Jun, 2022, 10:57:03 AM
    Author     : Genius
--%>

<%@page contentType="text/html"import="java.sql.*,java.util.*,java.io.*" pageEncoding="UTF-8"%>
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
             if(request.getParameter("code")!=null){
                  String cat_code = request.getParameter("code");
                    if(request.getParameter("album_name").length()==0||request.getParameter("des").length()==0){
                        response.sendRedirect("album.jsp?empty=1");
                    }
                    else{
                        String a_name = request.getParameter("album_name");
                        String des    = request.getParameter("des");
                        
                        int sn=0;
                        
                        Statement st1 = cn.createStatement();
                        ResultSet rs1 = st1.executeQuery("select Max(sn) from album");
                        if(rs1.next()){
                            sn = rs1.getInt(1);
                        }
                         sn= sn+1;
                         String code="";
                       LinkedList l = new LinkedList();
                       for(char p='A';p<='Z';p++){
                           l.add(p+"");
                       }
                       for(char p='0';p<='9';p++){
                           l.add(p+"");
                       }
                       for(char p='a';p<='z';p++){
                           l.add(p+"");
                       }
                       Collections.shuffle(l);
                       for(int i=0;i<6;i++){
                         code = code+l.get(i); 
                       }
                       code = code+"_"+sn;
                        
                      int status=0;
                       PreparedStatement ps = cn.prepareStatement("insert into album values(?,?,?,?,?,?,?)");
                       ps.setInt(1,sn);
                       ps.setString(2,code);
                       ps.setString(3,email);
                       ps.setString(4,a_name);
                       ps.setString(5,des);
                       ps.setInt(6,status);
                       ps.setString(7,cat_code);
                       String mkdir="";
                       if(ps.executeUpdate()>0){
                            File f = new File(request.getRealPath("/")+"album"+"/"+code);
                        f.mkdir();
                           response.sendRedirect("add_album_img.jsp?code="+cat_code+"&album_code="+code+"&album_added=1");
                       }
                       else{
                           response.sendRedirect("add_album.jsp?code="+cat_code+" &img_errr=1");
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

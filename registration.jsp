<%-- 
    Document   : registration
    Created on : 5 Jul, 2022, 8:06:12 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("user").length()==0||request.getParameter("email").length()==0||request.getParameter("pass").length()==0||request.getParameter("country").length()==0){
    response.sendRedirect("index.jsp?empty=1");
}
else{
    String user = request.getParameter("user");
    String email = request.getParameter("email");
    String pass  = request.getParameter("pass");
    String country = request.getParameter("country");
    int sn=0;
    String code="";
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
        Statement  st = cn.createStatement();
        ResultSet rs = st.executeQuery("Select Max(sn) from user");
        if(rs.next()){
            sn = rs.getInt(1);
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
            code=code+l.get(i);
        }
        code = code+"_"+sn;
        
        PreparedStatement ps =cn.prepareStatement("insert into user values(?,?,?,?,?,?)");
        ps.setInt(1,sn);
        ps.setString(2,code);
        ps.setString(3,user);
        ps.setString(4,email);
        ps.setString(5,pass);
        ps.setString(6,country);
        
        if(ps.executeUpdate()>0){
            response.sendRedirect("index.jsp?success=1");
        }
        else{
             response.sendRedirect("index.jsp?again=1");
        }
        
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}





%> 

<%-- 
    Document   : add_category
    Created on : 7 May, 2022, 5:14:47 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*"  pageEncoding="UTF-8"%>
 <%
String email=null ;
Cookie c[]=request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email=c[i].getValue();
        break;
    }
}
if(email==null){
    out.print("Login");
}
else{
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pk2","root","");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from admin where email='"+email+"'");
        if(rs.next()){
            if(request.getParameter("category").length()==0){
                response.sendRedirect("dashboard.jsp?empty=1");
            }
            else{
                String category=request.getParameter("category");
                int sn=0;
                String code="";
                Statement st1 = cn.createStatement();
                ResultSet rs1 = st1.executeQuery("select MAX(sn) from category");
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
                code = code+"_"+sn;
                int status=0;
                
                PreparedStatement ps = cn.prepareStatement("insert into category values(?,?,?,?,?)");
                ps.setInt(1,sn);
                ps.setString(2,code);
                ps.setString(3,email);
                ps.setString(4,category);
                ps.setInt(5,status);
                if(ps.executeUpdate()>0){
                    response.sendRedirect("dashboard.jsp?category_added=1");
                }
                else{
                    response.sendRedirect("dashboard.jsp?try_again=1");
                }
                
            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
    
    
%>

<%-- 
    Document   : song
    Created on : 25 Jun, 2022, 11:30:18 AM
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
            if(request.getParameter("code")==null && request.getParameter("cat_code")==null){
                response.sendRedirect("dashboard.jsp?code_err=1");
            }
            else{
                String code = request.getParameter("code");
                String cat_code = request.getParameter("cat_code");
                
                %>
                <html>
      <head>
	  
	  </head>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   
	   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://unpkg.com/aos@2.3.0/dist/aos.css'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	  <script>
	  $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
	  $(document).on("click",".fa.fa-trash-o",function(){
              var code = $(this).attr("rel");
              $.post(
                  "song_delete.jsp",{code:code},function(data){
                      if(data.trim()=="success"){
                          $("#r"+code).fadeOut(1000);
                      }
                  }
              );
              
              
          });
          $(document).on("click",".fa.fa-edit",function(){
              var code = $(this).attr("id");
              var msg = $("#d"+code).text();
              $("#d"+code).html("<input type='text' id='f"+code+"' value='"+msg+"'>");
              $(this).css("color","blue");
              $(this).attr("class","fa fa-save");
              
              
          });
          $(document).on("click",".fa.fa-save",function(){
              var code = $(this).attr("id");
              var msg  = $("#f"+code).val();
                $.post(
                  "update_song.jsp",{code:code,msg:msg},function(data){
                        if(data.trim()=="success"){
                           $("#d"+code).html("<strong>"+msg+"</strong>");
                            $(this).css("color","blue");
                            $(this).attr("class","fa fa-edit");
                        }
                  }
              );
              
              
          });
	  </script>
	  <style>
	  /*
    DEMO STYLE
*/

@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}

p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a,
a:hover,
a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

.navbar {
    padding: 15px 10px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}

.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}

.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}

/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */

.wrapper {
    display: flex;
    width: 100%;
    align-items: stretch;
}

#sidebar {
    min-width: 250px;
    max-width: 250px;
    background: #7386D5;
    color: #fff;
    transition: all 0.3s;
}

#sidebar.active {
    margin-left: -250px;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}

#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active>a,
a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}

a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}

ul.CTAs {
    padding: 20px;
}

ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}

a.download {
    background: #fff;
    color: #7386D5;
}

a.article,
a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}

/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */

#content {
    width: 100%;
    padding: 20px;
    min-height: 100vh;
    transition: all 0.3s;
}

/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */

@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
    #sidebarCollapse span {
        display: none;
    }
}
.fa.fa-heart{
    font-size:20px;
	cursor:pointer;

}	  
	  </style>
           
	  <body>




<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Music Player </h3>
            </div>

            <ul class="list-unstyled components">
                 
                <li class="active">
                    <a href="dashboard.jsp" style="text-decoration:none;">Home</a>
                     
                </li><br>
                <li>
                    <a href="logout.jsp"  style="text-decoration:none;">Logout</a>
                </li>
                 
                 
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                 </li>
                <li>
                 </li>
            </ul>
        </nav>

		 
        <!-- Page Content  -->
        <div id="content" style="background-color:white;">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fa fa-align-left"></i>
                        <span>Toggle Sidebar</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <%
                             if(email==null && session.getAttribute(email)==null){
                                 %>
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Login</a>
                            </li>
                            <%
                             }
                             else{
                                %>
                                <li class="nav-item">
                                     <a class="nav-link" href="logout.jsp">Logout</a>
                            </li>
                                
                                <%
                             }
                             %>
                        </ul>
                    </div>
                </div>
            </nav>
<div class="container-fluid">
  <div class="row w3-card w3-white">
      <%
        Statement st2 = cn.createStatement();
        ResultSet rs2 = st2.executeQuery("select * from album where code='"+code+"' AND status=0");
        if(rs2.next()){
            
        
                             
       %>
                 <div class="col-sm-12"><center><h2><strong><%out.print(rs2.getString("album_name"));%></strong></h2></center></div><br><br>
                 
                 <%
        }
        %>
      <div class="col-sm-4">
          <img src="../album/<%=code%>.jpg" class="img-fluid">
          
      </div>
        <div class="col-sm-8">
            <form method ="post"  action="add_song.jsp?code=<%=code%>&cat_code=<%=cat_code%>">
               Song Name : <input type="text" name="song_name" class="form-control"><br><br>
               Description: <textarea  name="description" rows="4" style="resize:none;"cols="50" class="form-control"></textarea><br><br>

               <input type="submit" value="submit" class="btn btn-success">
           </form> 
           <br>
             

       </div><br>
     <div class="col-sm-12"><center><h2><strong>Song Matches</strong></h2></center></div><br><br> 
    <div class="col-sm-12">
        <%
            Statement st1 = cn.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from song where album_code='"+code+"' AND status=0");
            out.print("<table class='table table-borderless'>");
            while(rs1.next()){
                %>
              
                    <tr id="r<%=rs1.getString("code")%>">
                        <td><strong><%=rs1.getInt("sn")%></strong></td>
                        <td id="d<%=rs1.getString("code")%>"><strong><%=rs1.getString("song_name")%></strong></td>
                        <td><i id="<%=rs1.getString("code")%>" style="color:blue;font-size: 25px;cursor:pointer;" class="fa fa-edit"></i></td>
                        <td><i rel="<%=rs1.getString("code")%>" style="color:red;font-size: 25px;cursor:pointer;" class="fa fa-trash-o"></i></td>
                        
                    </tr>
                
                
                <%
            }
               out.print("</table>");
               
                
                
        %>

    </div>
  
  </div><br><br>
     
</div><br>
<footer class="footer">
            <div class="container-fluid" style="background-color:#A7A2A2;">
                        <div>
	        <center> <h3>Follow Us :  <a href="https://www.facebook.com/profile.php?id=100060203576938" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/PramodK82377407" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/pramodkumarsaini12/" target="_blank"><i class="fa fa-instagram"></i></a></h3></center>
                            
                        </div>
						<div class="row"><div class="col-sm-12" style="color:white;">
          <center><br><a href="#" target="_blank" style="color:white">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:black">Privacy Policy</a></center>
         <center><br><h3>Music © 2022</h3></center><br></div></div>
		        <center> <p style="color:white;">Made with ? By <a  style="color:white;" href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/ " target="_blank">Pramod Kumar Saini</a></p></center>

  
  
                    </div>
          </footer>            
         </div>
    </div>
	</body>
	<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  <script src='https://unpkg.com/aos@2.3.0/dist/aos.js'></script>
  
      <script id="rendered-js" >
AOS.init({
  duration: 1200 });
//# sourceURL=pen.js
    </script>

  

  <script src="https://static.codepen.io/assets/editor/iframe/iframeRefreshCSS-e03f509ba0a671350b4b363ff105b2eb009850f34a2b4deaadaa63ed5d970b37.js"></script>
  
</html>
                
                
                <%
            }
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}



%>  
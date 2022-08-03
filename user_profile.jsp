<%-- 
    Document   : user_profile
    Created on : 15 Jul, 2022, 9:28:32 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[] = request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("Login")){
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
        ResultSet rs = st.executeQuery("select * from user where email='"+email+"'");
        if(rs.next()){
             %>
             <!DOCTYPE HTML>
<html>
<head>
<title>Music Player</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Mosaic Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.css" type='text/css' />
<!-- //lined-icons -->
<script src="js/jquery-2.1.4.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

 <!-- Meters graphs -->
  
</head> 
    	 <!-- /w3layouts-agile -->
 <body class="sticky-header left-side-collapsed"  onload="initMap()">
    <section>
      <!-- left side start-->
		<div class="left-side sticky-left-side">

			<!--logo and iconic logo start-->
			<div class="logo">
				<h1><a href="index.html">Music Player</a></h1>
			</div>
			<div class="logo-icon text-center">
				<a href="index.jsp">M </a>
			</div>
 	 <!-- /w3l-agile -->
			<!--logo and iconic logo end-->
			<div class="left-side-inner">

				<!--sidebar nav start-->
					<ul class="nav nav-pills nav-stacked custom-nav">
						<li class="active"><a href="index.jsp"><i class="lnr lnr-home"></i><span>Home</span></a></li>
 						
 							 
						</li>
                                                <%
                                                  
                                                 if(email!=null && session.getAttribute(email)!=null){
                                                       
                                                              %>
                                                               	 <li><a href="user_profile.jsp"><i class="fa fa-user"></i>  <span><%out.print(rs.getString("name"));%></span></a> 

                                                              
                                                              <%
                                                          }
                                                          
                                                %>
					</ul>
				<!--sidebar nav end-->
			</div>
		</div>
		 	 <!-- /w3layouts-agile -->
					<!-- app-->
			 
			<!-- //app-->
 	 <!-- /w3l-agile -->
		<!-- signup -->
			 
			<!-- //signup -->
 	 <!-- /w3l-agile -->
		<!-- left side end-->
		<!-- main content start-->
		<div class="main-content">
			<!-- header-starts -->
			<div class="header-section">
			<!--toggle button start-->
			<a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
			<!--toggle button end-->
			<!--notification menu start -->
				<div class="menu-right">
					<div class="profile_details">		
						  <div class="col-md-4 serch-part">
								<div id="sb-search" class="sb-search">
									<form action="#" method="post">

										<input class="sb-search-input" placeholder="Search" type="search" name="search" id="search">
										<input class="sb-search-submit" type="submit" value="">
										<span class="sb-icon-search"> </span>
									</form>
								</div>
							</div>
							  <!-- search-scripts -->
									<script src="js/classie.js"></script>
									<script src="js/uisearch.js"></script>
										<script>
											new UISearch( document.getElementById( 'sb-search' ) );
										</script>
									<!-- //search-scripts -->
											 <!---->
											  <div class="col-md-4 player">
													<div class="audio-player">
   														</div>
												<!---->
												 
												 


												<!--//-->
												 	
											</div>
											<div class="col-md-4 login-pop">
                                                                                            <div id="loginpop">
                                                                                                <%
                                                                                                  
                                                                                                 if(email==null && session.getAttribute(email)==null){
                                                                                                    
                                                                                                    
                                                                                                %>
                                                                                                <a href="#" id="loginButton"><span>Login <i class="arrow glyphicon glyphicon-chevron-right"></i></span></a><a class="top-sign" href="#" data-toggle="modal" data-target="#myModal5"><i class="fa fa-sign-in"></i></a>
                                                                                                <%
                                                                                                 }
                                                                                                 else{
                                                                                                     %>
                                                                                                    <a href="Logout.jsp" ><span>Logout <i class="arrow glyphicon glyphicon-chevron-right"></i></span></a>  
                                                                                                <%
                                                                                                 }
                                                                                                 %>
                                                                                               
                                                                                                <div id="loginBox">  
												<form action="check.jsp" method="post" id="loginForm">
																	<fieldset id="body">
																		<fieldset>
																			  <label for="email">Email Address</label>
																			  <input type="text" name="email" id="email">
																		</fieldset>
																		<fieldset>
																				<label for="password">Password</label>
																				<input type="password" name="pass" id="password">
																		 </fieldset>
																		<input type="submit" id="login" value="Login">
																		<label for="checkbox"><input type="checkbox" id="checkbox"> <i>Remember me</i></label>
																	</fieldset>
																 
														 </form>
													</div>
												</div>

											</div>
										<div class="clearfix"> </div>
								</div>
							<!-------->
						</div>
					<div class="clearfix"></div>
				</div>
			<!--notification menu end -->
			<!-- //header-ends -->
 	 <!-- /w3l-agileits -->
		<!-- //header-ends -->
			<div id="page-wrapper">
                            <div class="col-sm-12"><center><h3><strong>User Profile</strong></h3></center></div>
                            <div class="col-sm-12 w3-card">
                                <div class="col-sm-6">
                                    <img src="album/pll.jpg" class="img-responsive circle">
                                </div> 
                                <div class="col-sm-6">
                                    <table class="table table-borderless">
                                        <tr>
                                            <td><strong>User Name :</strong></td><td><strong><%out.print(rs.getString("name"));%></strong></td></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Email ID :</strong></td><td><strong><%out.print(rs.getString("email"));%></strong></td></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Country :</strong></td><td><strong><%out.print(rs.getString("country"));%></strong></td></td>
                                        </tr>
                                        <tr>
                                            <td><a href="user_edit_profile.jsp"><button class="btn btn-success">Edit Profile</button></a></td>
                                        </tr>
                                    </table>
                                 </div>
                            </div>		 
			 </div>
					</div>
                                     
			 
        <!--footer section start-->
			<footer>
                             
                      <h3 style="color:white;">MP3 © 2022</h3> <p>Made with ❤ By <a  style="color:white;" href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/ " target="_blank">Pramod Kumar Saini</a></p>

 			</footer>
       
   </section>
  
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.js"></script>
</body>
</html>
             
             <%
        }
    }
    catch(Exception er){
        out.print(er.getMessage());
    }
}
    
    
    
%>